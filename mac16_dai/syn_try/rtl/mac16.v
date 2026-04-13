`timescale 1ns / 1ps
// ============================================================================
// Module Name: mac16
// Description: 基于 4次时间复用 8x8 乘法器架构的 MAC16 顶层模块
// Architecture: S2P_RX -> Compute_Engine (Folded 8x8) -> Sync_FIFO -> P2S_TX
// ============================================================================

module mac16 (
    input  wire clk,
    input  wire rst_n,
    input  wire in_ready,
    input  wire mode,
    input  wire inA,
    input  wire inB,
    
    output wire sum_out,
    output wire out_ready,
    output wire carry
);

    // ========================================================================
    // 1. 核心控制逻辑：mode 切换时的全局复位 (边沿检测)
    // ========================================================================
    reg mode_d1, mode_d2;
    wire mode_toggle;
    wire sys_rst_n; // 内部全局系统复位

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mode_d1 <= 1'b0;
            mode_d2 <= 1'b0;
        end else begin
            mode_d1 <= mode;
            mode_d2 <= mode_d1; // 打两拍，防亚稳态并提取历史值
        end
    end

    // 当 mode 发生跳变时 (1变0 或 0变1)，异或门输出 1
    assign mode_toggle = mode_d1 ^ mode_d2; 
    
    // 生成系统级复位：只要外部拉低复位，或者 mode 发生切换，内部全部清零！
    assign sys_rst_n = rst_n & (~mode_toggle);


    // ========================================================================
    // 2. 内部线网声明 (Internal Wires)
    // ========================================================================
    
    // --- RX 到 运算大脑 的总线 ---
    wire [15:0] rx_data_A;
    wire [15:0] rx_data_B;
    wire        rx_valid;       // 16位数据收集完成的脉冲

    // --- 运算大脑 到 FIFO 的总线 ---
    wire[23:0] calc_result;    // 算好的 24位 乘累加结果
    wire        calc_carry;     // 进位溢出标志
    wire        calc_valid;     // 计算完成，作为 FIFO 的写使能

    // --- FIFO 到 TX 的总线 ---
    wire [23:0] fifo_rdata;     // 从 FIFO 读出的 24位 结果
    wire        fifo_rcarry;    // 从 FIFO 读出的进位标志
    wire        fifo_empty;     // FIFO 是否为空
    wire        tx_pop;         // TX 模块通知 FIFO 读出下一个数据的拉取脉冲


    // ========================================================================
    // 3. 子模块例化 (Module Instantiations)
    // ========================================================================

    // --------------------------------------------------------
    // (1) 串入并出接收器 (S2P)
    // --------------------------------------------------------
    spi_rx u_spi_rx (
        .clk        (clk), 
        .rst_n      (sys_rst_n),    // 使用结合后的系统复位
        .in_ready   (in_ready),
        .inA        (inA), 
        .inB        (inB),
        .data_A     (rx_data_A),    // out: 并行 16bit
        .data_B     (rx_data_B),    // out: 并行 16bit
        .valid_out  (rx_valid)      // out: 一组收齐脉冲
    );

    // --------------------------------------------------------
    // (2) 运算大脑：带状态机的时分复用核心
    // --------------------------------------------------------
    compute_engine u_compute_engine (
        .clk        (clk), 
        .rst_n      (sys_rst_n),
        .mode       (mode_d2),      // 喂入稳定后的 mode
        .rx_valid   (rx_valid),
        .data_A     (rx_data_A),
        .data_B     (rx_data_B),
        .mac_result (calc_result),  // out: 计算完成的 24bit 结果
        .mac_carry  (calc_carry),   // out: 溢出标志
        .calc_done  (calc_valid)    // out: 计算完成脉冲
    );

    // --------------------------------------------------------
    // (3) 同步 FIFO 缓冲池 (Rate Matching)
    // 深度暂定为 4，数据位宽 25 = 1(carry) + 24(result)
    // --------------------------------------------------------
    sync_fifo #(
        .DATA_WIDTH (25),
        .ADDR_WIDTH (2)  // 2^2 = 4 深度的 FIFO
    ) u_sync_fifo (
        .clk        (clk), 
        .rst_n      (sys_rst_n),
        .wr_en      (calc_valid), 
        .wr_data    ({calc_carry, calc_result}), // 拼接写入
        .rd_en      (tx_pop),
        .rd_data    ({fifo_rcarry, fifo_rdata}), // 拼接读出
        .full       (),              // 理论上绝对不会满，悬空即可
        .empty      (fifo_empty)
    );

    // --------------------------------------------------------
    // (4) 并转串发送器 (P2S)
    // --------------------------------------------------------
    spi_tx u_spi_tx (
        .clk        (clk), 
        .rst_n      (sys_rst_n), 
        .fifo_empty (fifo_empty),
        .tx_data    (fifo_rdata),
        .tx_carry   (fifo_rcarry),
        .fifo_pop   (tx_pop),        // out: 让 FIFO 吐出新数据的拉取脉冲
        .sum_out    (sum_out),       // out: 串行引脚
        .out_ready  (out_ready),     // out: 就绪引脚
        .carry_out  (carry)          // out: 溢出引脚
    );

endmodule