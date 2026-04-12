`timescale 1ns / 1ps
// ============================================================================
// Module Name: compute_engine
// Description: 基于状态机控制的时分复用 (Time-Multiplexed) 乘累加计算核心
// Architecture: 1 个 8x8 乘法器分 4 拍计算，第 5 拍完成 MAC 累加
// ============================================================================

module compute_engine (
    input  wire        clk,
    input  wire        rst_n,      // 注意：顶层已经将 mode 切换绑定到了此复位上！
    input  wire        mode,
    input  wire        rx_valid,   // 接收器发来的：16位数据已收齐脉冲
    input  wire[15:0] data_A,
    input  wire [15:0] data_B,

    output reg  [23:0] mac_result, // 算好的 24bit 结果
    output reg         mac_carry,  // 溢出进位标志 (一旦置 1 保持不变)
    output reg         calc_done   // 计算完成脉冲 (输出给 FIFO 做 wr_en)
);

    // ========================================================================
    // 1. 状态机定义 (FSM Encoding) - 使用 One-Hot 编码利于高频综合
    // ========================================================================
    localparam S_IDLE   = 3'd0; // 空闲待机
    localparam S_MUL_HH = 3'd1; // 计算 AH * BH
    localparam S_MUL_HL = 3'd2; // 计算 AH * BL
    localparam S_MUL_LH = 3'd3; // 计算 AL * BH
    localparam S_MUL_LL = 3'd4; // 计算 AL * BL
    localparam S_MAC    = 3'd5; // 最终累加与溢出判断

    reg [2:0] current_state, next_state;

    // ========================================================================
    // 2. 内部寄存器声明
    // ========================================================================
    reg [15:0] reg_A, reg_B;       // 锁存输入的 16位 数据，防止接收端后续变化
    reg [31:0] temp_product;       // 用于“滚雪球”累加 4 次乘积的 32位 寄存器
    reg [24:0] global_acc;         // 全局 MAC 累加器 (25位用于捕捉进位)

    reg  [7:0] mul_in1;
    reg  [7:0] mul_in2;
    wire [15:0] mul_out;

    // 这里使用 Verilog 原生 * 号。由于操作数 mul_in 是无符号 [7:0]，
    // 综合工具会自动将其映射为无符号 8x8 硬件乘法器。

    booth_wallace_8x8_unsigned u_custom_8x8_mul (
        .A (mul_in1),
        .B (mul_in2),
        .P (mul_out)
    );


    // ========================================================================
    // 4. 输入多路选择器 (MUX) 与 【操作数隔离】(低功耗绝招)
    // ========================================================================
    always @(*) begin
        case (current_state)
            S_MUL_HH: begin mul_in1 = reg_A[15:8]; mul_in2 = reg_B[15:8]; end
            S_MUL_HL: begin mul_in1 = reg_A[15:8]; mul_in2 = reg_B[7:0];  end
            S_MUL_LH: begin mul_in1 = reg_A[7:0];  mul_in2 = reg_B[15:8]; end
            S_MUL_LL: begin mul_in1 = reg_A[7:0];  mul_in2 = reg_B[7:0];  end
            default:  begin 
                // ⚠️ 极其重要的低功耗设计：操作数隔离 (Operand Isolation)
                // 在 IDLE 和 MAC 状态下，强制乘法器输入为 0，彻底杜绝内部组合逻辑翻转！
                mul_in1 = 8'd0; 
                mul_in2 = 8'd0; 
            end
        endcase
    end

    // ========================================================================
    // 5. 状态机次态跳转逻辑 (Next State Logic)
    // ========================================================================
    always @(*) begin
        next_state = current_state; // 默认保持
        case (current_state)
            S_IDLE:   if (rx_valid) next_state = S_MUL_HH;
            S_MUL_HH: next_state = S_MUL_HL;
            S_MUL_HL: next_state = S_MUL_LH;
            S_MUL_LH: next_state = S_MUL_LL;
            S_MUL_LL: next_state = S_MAC;
            S_MAC:    next_state = S_IDLE; // 计算完直接回到空闲
            default:  next_state = S_IDLE;
        endcase
    end

    // ========================================================================
    // 6. MAC 累加超前计算 (Combinational MAC)
    // ========================================================================
    // 如果 mode=1 (累加)，则加上 global_acc；如果 mode=0，则相当于加上 0。
    wire [24:0] current_acc_val = (mode == 1'b1) ? global_acc : 25'd0;
    
    // 计算本次结果：历史累加值 + 刚算出的 32 位乘积的低 24 位
    wire [24:0] mac_add_res     = current_acc_val + temp_product[23:0];

    // 溢出判断逻辑：
    // 条件1：单纯的 16x16 乘积本身就大得超过了 24 位（即 [31:24] 存在 1）
    // 条件2：MAC 加法导致第 24 位产生了进位 (mac_add_res[24] == 1)
    wire current_overflow = (|temp_product[31:24]) | mac_add_res[24];

    reg [15:0] mul_out_reg;
    reg [2:0] state_delay;

    // 延迟状态和延迟部分积，此时数据已稳定
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            mul_out_reg <= 16'd0;
            state_delay <= S_IDLE;
        end else begin
            mul_out_reg <= mul_out;
            state_delay <= current_state;
        end
    end

    // ========================================================================
    // 7. 时序路径：状态更新与数据搬运 (Sequential Logic)
    // ========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= S_IDLE;
            reg_A         <= 16'd0;
            reg_B         <= 16'd0;
            temp_product  <= 32'd0;
            global_acc    <= 25'd0;
            mac_result    <= 24'd0;
            mac_carry     <= 1'b0;
            calc_done     <= 1'b0;
        end else begin
            // 状态流转
            current_state <= next_state;

            // 默认单拍脉冲拉低
            calc_done <= 1'b0; 

            // 数据流转
            case (state_delay)
                S_IDLE: begin
                    if (rx_valid) begin
                        reg_A <= data_A; // 锁存数据，放走 RX 模块让它继续收下一组
                        reg_B <= data_B;
                    end
                end

                S_MUL_HH: begin
                    // 结果代表 2^16 权重，所以左移 16 位补零
                    temp_product <= {mul_out_reg, 16'd0}; 
                end

                S_MUL_HL: begin
                    // 结果代表 2^8 权重，所以左移 8 位。并与之前的乘积累加
                    temp_product <= temp_product + {8'd0, mul_out_reg, 8'd0};
                end

                S_MUL_LH: begin
                    // 同样代表 2^8 权重
                    temp_product <= temp_product + {8'd0, mul_out_reg, 8'd0};
                end

                S_MUL_LL: begin
                    // 结果代表 2^0 权重，直接加在最低位
                    temp_product <= temp_product + {16'd0, mul_out_reg};
                end

                S_MAC: begin
                    // 更新全局累加器
                    global_acc <= mac_add_res;
                    
                    // 输出最终的 24 位结果供 FIFO 抓取
                    mac_result <= mac_add_res[23:0];

                    // 处理粘性进位 (Sticky Carry)
                    if (current_overflow) begin
                        mac_carry <= 1'b1; 
                        // 注意：这里我们故意不写 else mac_carry <= 0;
                        // 因为赛题要求“一旦置1保持不变，直到 mode 切换或复位”
                        // 而 mode 切换引发的复位，顶层 sys_rst_n 已经帮我们做掉了！
                    end

                    calc_done <= 1'b1; // 产生 1 拍高电平脉冲，通知 FIFO 写入数据！
                end
            endcase
        end
    end

endmodule