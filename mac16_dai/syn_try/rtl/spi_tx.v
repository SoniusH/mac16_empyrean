`timescale 1ns / 1ps
// ============================================================================
// Module Name: spi_tx
// Description: 并入串出发送模块 (MSB 先出)，带输出就绪指示
// ============================================================================

module spi_tx (
    input  wire        clk,
    input  wire        rst_n,
    
    input  wire        fifo_empty,
    input  wire [23:0] tx_data,   // FIFO 暴露在外的 24位 结果
    input  wire        tx_carry,  // FIFO 暴露在外的 1位 进位
    
    output reg         fifo_pop,  // 告诉 FIFO: "这包数据我拿走了！"
    output wire        sum_out,   // 串行输出
    output reg         out_ready, // 输出期间拉高
    output reg         carry_out  // 溢出进位标志
);

    reg[23:0] shift_reg;
    reg [4:0]  out_cnt;   // 需要数 0~23 (共 24 拍)

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_reg <= 24'd0;
            out_cnt   <= 5'd0;
            out_ready <= 1'b0;
            fifo_pop  <= 1'b0;
            carry_out <= 1'b0;
        end else begin
            // 默认情况下 pop 只是单拍脉冲
            fifo_pop <= 1'b0;

            if (!out_ready) begin
                // 状态一：我正闲着
                if (!fifo_empty) begin
                    // 发现 FIFO 里有新数据，立刻抓取！
                    shift_reg <= tx_data;
                    carry_out <= tx_carry; // 更新进位标志
                    out_cnt   <= 5'd23;    // 设置倒计时 23..0
                    out_ready <= 1'b1;     // 宣示：我开始发数据了
                    fifo_pop  <= 1'b1;     // 拉高 1 拍，让 FIFO 吐掉这个历史数据
                end
            end else begin
                // 状态二：我正在往外发数据
                if (out_cnt > 5'd0) begin
                    // MSB 已经被线连出去了，现在整体左移，把次高位顶上去
                    shift_reg <= {shift_reg[22:0], 1'b0};
                    out_cnt   <= out_cnt - 1'b1;
                end else begin
                    // 24 个 bit 全部发完了，收工，准备接下一单
                    out_ready <= 1'b0;
                end
            end
        end
    end

    // 【极其关键】：永远把 shift_reg 的最高位 [23] 暴露在输出引脚上
    assign sum_out = shift_reg[23];

endmodule