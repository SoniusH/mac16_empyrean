`timescale 1ns / 1ps
//=============================================================================
// Module Name: compute_engine
// Description: 16×16 MAC计算核心 - 四分块时分复用
// 调用独立 8×8 乘法器：Booth+Wallace+Kogge-Stone 三级流水线
//=============================================================================
module compute_engine (
    input  wire         clk,
    input  wire         rst_n,
    input  wire         mode,
    input  wire         rx_valid,
    input  wire  [15:0] data_A,
    input  wire  [15:0] data_B,
    
    output reg   [23:0] mac_result,
    output reg          mac_carry,
    output reg          calc_done
);

//=============================================================================
// 1. 拆分16bit操作数为高8位/低8位
//=============================================================================
wire [7:0] A_H = data_A[15:8];
wire [7:0] A_L = data_A[7:0];
wire [7:0] B_H = data_B[15:8];
wire [7:0] B_L = data_B[7:0];

//=============================================================================
// 2. 7周期时序计数器 (严格对齐你的设计)
//=============================================================================
reg [2:0] cnt;
reg       calc_en;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        cnt     <= 3'd0;
        calc_en <= 1'b0;
    end else begin
        if(rx_valid) begin
            calc_en <= 1'b1;
            cnt     <= 3'd1;
        end else if(calc_en) begin
            cnt <= (cnt == 3'd6) ? 3'd0 : cnt + 1'b1;
            calc_en <= (cnt == 3'd6) ? 1'b0 : 1'b1;
        end
    end
end

//=============================================================================
// 3. 乘法器输入选择器 (严格按7周期时序)
//=============================================================================
reg [7:0] mul_a;
reg [7:0] mul_b;
always @(*) begin
    case(cnt)
        3'd1: begin mul_a = A_H; mul_b = B_H; end
        3'd2: begin mul_a = A_H; mul_b = B_L; end
        3'd3: begin mul_a = A_L; mul_b = B_H; end
        3'd4: begin mul_a = A_L; mul_b = B_L; end
        default: begin mul_a = 8'd0; mul_b = 8'd0; end
    endcase
end

//=============================================================================
// 4. ✅ 例化独立 8×8 乘法器 (替换完成！)
//=============================================================================
wire [15:0] mul_result;
mul8x8_booth_wallace_ks u_mul8x8 (
    .clk    (clk),
    .rst_n  (rst_n),
    .a      (mul_a),
    .b      (mul_b),
    .prod   (mul_result)   // 输出8×8乘积
);

//=============================================================================
// 5. 四分块移位累加 (AH*BH<<16 + AH*BL<<8 + AL*BH<<8 + AL*BL)
//=============================================================================
reg [31:0] temp_product;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        temp_product <= 32'd0;
    else begin
        case(cnt)
            3'd4: temp_product <= {mul_result, 16'd0};                // AH*BH <<16
            3'd5: temp_product <= temp_product + {8'd0, mul_result, 8'd0}; // AH*BL <<8
            3'd6: temp_product <= temp_product + {8'd0, mul_result, 8'd0}; // AL*BH <<8
            3'd0: temp_product <= temp_product + {16'd0, mul_result};     // AL*BL <<0
            default: temp_product <= temp_product;
        endcase
    end
end

//=============================================================================
// 6. 模式累加 & 溢出判断
//=============================================================================
reg  [24:0] global_acc;
wire [24:0] add_in      = mode ? global_acc : 25'd0;
wire [24:0] mac_add_res = add_in + {1'b0, temp_product[23:0]};
wire        overflow    = |temp_product[31:24] | mac_add_res[24];

//=============================================================================
// 7. 输出逻辑
//=============================================================================
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        global_acc <= 25'd0;
        mac_result <= 24'd0;
        mac_carry  <= 1'b0;
        calc_done  <= 1'b0;
    end else begin
        calc_done <= 1'b0;
        if(cnt == 3'd0 && calc_en == 1'b0 && |global_acc == 1'b0) begin
            global_acc  <= mac_add_res;
            mac_result  <= mac_add_res[23:0];
            mac_carry   <= mac_carry | overflow; // 粘性溢出
            calc_done   <= 1'b1;
        end
    end
end

endmodule