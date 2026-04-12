`timescale 1ns/1ps

//=============================================================================
// 模块: mac16_55nm_1ghz_no_buffer
// 功能: 16位乘累加器，无双缓冲，累加器→输出握手协议
// 目标: 1GHz主频, 70um×70um面积, <200μW功耗
//=============================================================================

module mac16_55nm_1ghz_no_buffer #(
    parameter DATA_WIDTH = 16,
    parameter ACC_WIDTH = 24
)(
    input  wire         clk,                // 1GHz时钟
    input  wire         rst_n,              // 异步复位
    input  wire         in_ready,           // 串行输入有效
    input  wire         mode,               // 模式选择
    input  wire         inA,                // 串行输入A
    input  wire         inB,                // 串行输入B
    output wire         sum_out,            // 串行输出
    output reg          out_ready,          // 输出有效
    output reg          carry               // 进位输出
);
    reg        mult_start;
    reg        mult_busy;
    reg [15:0] mult_a;
    reg [15:0] mult_b;
    reg [16:0] mult_b_ext;          // 扩展为17位，避免部分积越界
    reg        mult_mode;
    reg [2:0]  mult_stage;
    //=========================================================================
    // 0. 时钟门控
    //=========================================================================
    wire clk_gated;
    assign clk_gated = clk & (in_ready | out_ready | mult_busy);
    
    //=========================================================================
    // 1. 输入移位寄存器
    //=========================================================================
    reg [15:0] shift_a;
    reg [15:0] shift_b;
    reg [4:0]  bit_cnt;
    reg        data_ready;
    reg        mode_reg;
    reg        loading;
    
    always @(posedge clk_gated or negedge rst_n) begin
        if (!rst_n) begin
            shift_a    <= 16'd0;
            shift_b    <= 16'd0;
            bit_cnt    <= 5'd0;
            data_ready <= 1'b0;
            mode_reg   <= 1'b0;
            loading    <= 1'b0;
        end else begin
            // 数据加载
            if (!loading && in_ready) begin
                loading    <= 1'b1;
                bit_cnt    <= 5'd1;
                shift_a    <= {15'd0, inA};
                shift_b    <= {15'd0, inB};
                mode_reg   <= mode;
            end 
            else if (loading && bit_cnt < 5'd16) begin
                if (in_ready) begin
                    shift_a <= {shift_a[14:0], inA};
                    shift_b <= {shift_b[14:0], inB};
                    bit_cnt <= bit_cnt + 5'd1;
                end
            end
            else if (loading && bit_cnt == 5'd16) begin
                loading    <= 1'b0;
                data_ready <= 1'b1;
                bit_cnt    <= 5'd0;
            end
            
            // 握手：乘法器取走数据
            if (mult_start && !mult_busy) begin
                data_ready <= 1'b0;
            end
        end
    end
    
    //=========================================================================
    // 2. 4级流水线乘法器（修正部分积生成索引越界）
    //=========================================================================
    
    
    reg [31:0] pp [0:7];
    reg [31:0] sum_s1, carry_s1;
    reg [31:0] sum_s2, carry_s2;
    reg [31:0] product;
    
    // Booth编码函数
    function [2:0] booth_encode;
        input [2:0] bits;
        begin
            case (bits)
                3'b000, 3'b111: booth_encode = 3'd0;
                3'b001, 3'b010: booth_encode = 3'd1;
                3'b011:         booth_encode = 3'd2;
                3'b100:         booth_encode = -3'd2;
                default:        booth_encode = -3'd1;
            endcase
        end
    endfunction
    
    // 部分积生成函数
    function [31:0] gen_partial;
        input [15:0] a;
        input [2:0]  enc;
        input [2:0]  shift;
        reg [31:0] base;
        begin
            case (enc)
                3'd1:  base = {{16{a[15]}}, a};
                3'd2:  base = {{15{a[15]}}, a, 1'b0};
                -3'd1: base = ~{{16{a[15]}}, a} + 1;
                -3'd2: base = ~{{15{a[15]}}, a, 1'b0} + 1;
                default: base = 32'd0;
            endcase
            gen_partial = base << shift;
        end
    endfunction
    
    // 循环索引变量
    integer i;
    
    always @(posedge clk_gated or negedge rst_n) begin
        if (!rst_n) begin
            mult_start <= 1'b0;
            mult_busy  <= 1'b0;
            mult_a     <= 16'd0;
            mult_b     <= 16'd0;
            mult_b_ext <= 17'd0;
            mult_mode  <= 1'b0;
            mult_stage <= 3'd0;
            product    <= 32'd0;
        end else begin
            mult_start <= 1'b0;
            
            if (!mult_busy && data_ready) begin
                mult_start <= 1'b1;
                mult_busy  <= 1'b1;
                mult_stage <= 3'd1;
                mult_a     <= shift_a;
                mult_b     <= shift_b;
                mult_b_ext <= {1'b0, shift_b};  // 扩展为17位，最高位补0
                mult_mode  <= mode_reg;
            end
            
            if (mult_busy) begin
                case (mult_stage)
                    3'd1: begin
                        // 修正：使用扩展后的 mult_b_ext 避免越界，同时采用 +: 动态部分选择语法
                        for (i = 0; i < 8; i = i + 1) begin
                            pp[i] <= gen_partial(mult_a,
                                                 booth_encode(mult_b_ext[i*2 +: 3]),
                                                 i[2:0]);  // 直接用 i 的低3位
                        end
                        mult_stage <= 3'd2;
                    end
                    
                    3'd2: begin
                        {carry_s1, sum_s1} <= {pp[0] + pp[1], pp[2] + pp[3]};  // 简单加法，可替换为原始函数
                        mult_stage <= 3'd3;
                    end
                    
                    3'd3: begin
                        {carry_s2, sum_s2} <= {pp[4] + pp[5], pp[6] + pp[7]};
                        mult_stage <= 3'd4;
                    end
                    
                    3'd4: begin
                        product <= sum_s1 + carry_s1 + sum_s2 + carry_s2;
                        mult_busy <= 1'b0;
                        mult_stage <= 3'd0;
                    end
                endcase
            end
        end
    end
    
    //=========================================================================
    // 3. 累加器（与输出模块的握手协议）
    //=========================================================================
    reg [24:0] accumulator;      // 累加和（模式1使用）
    reg [24:0] prev_product;     // 前一个乘积（模式0使用）
    reg        current_mode;     // 当前模式
    
    // 握手信号
    reg        acc_valid_reg;    // 累加器输出有效（电平）
    reg [23:0] acc_data_reg;     // 待输出的结果
    reg        acc_carry_reg;    // 待输出的进位
    
    reg [24:0] next_acc_result;  // 刚计算出的下一个结果
    reg        next_acc_carry;   // 刚计算出的进位
    reg        next_pending;     // 有待提交的结果
    
    wire       acc_ready;        // 输出模块空闲，可以接收新数据
    wire       acc_taken;        // 输出模块已取走数据脉冲
    
    wire [24:0] product_trim = {1'b0, product[23:0]};
    
    always @(posedge clk_gated or negedge rst_n) begin
        if (!rst_n) begin
            accumulator    <= 25'd0;
            prev_product   <= 25'd0;
            current_mode   <= 1'b0;
            acc_valid_reg  <= 1'b0;
            acc_data_reg   <= 24'd0;
            acc_carry_reg  <= 1'b0;
            next_pending   <= 1'b0;
        end else begin
            // 握手：输出取走数据时，清除有效标志
            if (acc_taken) begin
                acc_valid_reg <= 1'b0;
            end
            
            // 乘法完成，计算新结果
            if (mult_stage == 3'd4 && !mult_busy) begin
                // 模式切换检测与计算
                if (mult_mode != current_mode) begin
                    current_mode <= mult_mode;
                    
                    if (mult_mode == 1'b0) begin
                        // 切换到模式0：相邻乘积
                        {next_acc_carry, next_acc_result} <= {1'b0, product_trim};
                        prev_product   <= product_trim;
                        accumulator    <= 25'd0;
                    end else begin
                        // 切换到模式1：累加
                        {next_acc_carry, next_acc_result} <= {1'b0, product_trim};
                        accumulator    <= product_trim;
                        prev_product   <= 25'd0;
                    end
                end else begin
                    // 模式未切换
                    if (mult_mode == 1'b0) begin
                        {next_acc_carry, next_acc_result} <= prev_product + product_trim;
                        prev_product   <= product_trim;
                    end else begin
                        {next_acc_carry, next_acc_result} <= accumulator + product_trim;
                        accumulator    <= accumulator + product_trim;
                    end
                end
                
                // 尝试将结果提交到输出寄存器
                if (!acc_valid_reg && acc_ready) begin
                    // 直接输出
                    acc_valid_reg <= 1'b1;
                    acc_data_reg  <= next_acc_result[23:0];
                    acc_carry_reg <= next_acc_carry;
                    next_pending  <= 1'b0;
                end else begin
                    // 输出忙或已有数据等待，暂存
                    next_pending  <= 1'b1;
                end
            end
            
            // 如果之前暂存的结果可以输出了，更新输出寄存器
            if (next_pending && !acc_valid_reg && acc_ready) begin
                acc_valid_reg <= 1'b1;
                acc_data_reg  <= next_acc_result[23:0];
                acc_carry_reg <= next_acc_carry;
                next_pending  <= 1'b0;
            end
        end
    end
    
    //=========================================================================
    // 4. 串行输出（带握手就绪指示）
    //=========================================================================
    reg [23:0] out_shift;
    reg [4:0]  out_cnt;
    reg        out_busy;
    reg        acc_taken_reg;      // 产生 acc_taken 脉冲
    
    assign acc_ready = !out_busy;   // 输出空闲即可接收新数据
    assign acc_taken = acc_taken_reg;
    
    always @(posedge clk_gated or negedge rst_n) begin
        if (!rst_n) begin
            out_shift     <= 24'd0;
            out_cnt       <= 5'd0;
            out_ready     <= 1'b0;
            out_busy      <= 1'b0;
            carry         <= 1'b0;
            acc_taken_reg <= 1'b0;
        end else begin
            acc_taken_reg <= 1'b0;  // 脉冲默认低
            
            // 空闲且累加器有有效数据时，锁存并开始输出
            if (!out_busy && acc_valid_reg) begin
                out_shift     <= acc_data_reg;
                out_busy      <= 1'b1;
                out_cnt       <= 5'd0;
                out_ready     <= 1'b1;
                carry         <= acc_carry_reg;
                acc_taken_reg <= 1'b1;   // 通知累加器已取走
            end
            
            // 串行移位输出
            if (out_busy) begin
                if (out_cnt < 5'd23) begin
                    out_shift <= {out_shift[22:0], 1'b0};
                    out_cnt   <= out_cnt + 5'd1;
                end else begin
                    out_busy  <= 1'b0;
                    out_ready <= 1'b0;
                end
            end
        end
    end
    
    assign sum_out = out_shift[23];
    
endmodule