`timescale 1ns / 1ps
// ============================================================================
// Module Name: spi_rx
// Description: 串入并出模块 (MSB 先入)。带门控移位与并行锁存
// ============================================================================

module spi_rx (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        in_ready, // 输入有效门控信号
    input  wire        inA,
    input  wire        inB,
    
    output reg[15:0] data_A,   // 输出 16 位并行数据 A
    output reg[15:0] data_B,   // 输出 16 位并行数据 B
    output reg       valid_out // 并行数据就绪脉冲 (1 拍)
);

    reg [15:0] shift_A;
    reg[15:0] shift_B;
    reg [3:0]  bit_cnt; // 0~15 计数器

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_A   <= 16'd0;
            shift_B   <= 16'd0;
            data_A    <= 16'd0;
            data_B    <= 16'd0;
            bit_cnt   <= 4'd0;
            valid_out <= 1'b0;
        end else begin
            // 只有外部告知数据有效时，才进行采样和移位
            if (in_ready) begin
                // MSB 先入，左移并将新来的 bit 放在最低位
                shift_A <= {shift_A[14:0], inA};
                shift_B <= {shift_B[14:0], inB};
                bit_cnt <= bit_cnt + 1'b1;

                // 当收到第 16 个 bit 时 (cnt == 15)
                if (bit_cnt == 4'd15) begin
                    // 【关键技巧】: 此时不能等 shift_A 慢慢更新，
                    // 直接用拼接好的最新完整数据赋值给 data_A，实现零延迟交接！
                    data_A    <= {shift_A[14:0], inA};
                    data_B    <= {shift_B[14:0], inB};
                    valid_out <= 1'b1; // 拉高一个周期，通知 compute_engine 开始干活
                end else begin
                    valid_out <= 1'b0;
                end
            end else begin
                // 如果 in_ready 拉低，说明间歇了，valid_out 必须拉低防止误触发
                valid_out <= 1'b0; 
            end
        end
    end

endmodule