`timescale 1ns/1ps

module mac16(
    input  wire         clk,
    input  wire         rst_n,
    input  wire         in_ready,
    input  wire         mode,
    input  wire         inA,
    input  wire         inB,
    output wire         sum_out,
    output wire         out_ready,    // 改为 wire
    output wire         carry         // 改为 wire
);

    //========================================================================
    // 内部互联信号
    //========================================================================
    
    // shift_input <-> input_mult_fifo
    wire [32:0] shift_data;
    wire        data_ready;
    
    // input_mult_fifo <-> multiplier
    wire        fifo_empty;
    wire        fifo_full;
    wire        mult_rd_en;
    wire [32:0] fifo_rd_data;    
    
    // multiplier <-> accumulator
    wire        mult_done;
    wire [31:0] product;
    wire        prod_mode;
    
    // accumulator <-> serial_output
    wire        acc_valid;
    wire [23:0] acc_data;
    wire        acc_carry_out;
    
    //========================================================================
    // FIFO 读写控制
    //========================================================================
    wire fifo_wr_en = data_ready;
    wire [32:0] fifo_wr_data = shift_data;
    
    //========================================================================
    // 子模块例化
    //========================================================================
    
    // 1. 移位输入模块
    shift_input u_shift_input (
        .clk        (clk),
        .rst_n      (rst_n),
        .in_ready   (in_ready),
        .inA        (inA),
        .inB        (inB),
        .mode       (mode),
        .shift_data (shift_data),
        .data_ready (data_ready)
    );
    
    // 2. 输入 FIFO
    input_mult_fifo #(
        .DATA_WIDTH (33),
        .FIFO_DEPTH (8)
    ) u_input_fifo (
        .clk      (clk),
        .rst_n    (rst_n),
        .wr_en    (fifo_wr_en),
        .wr_data  (fifo_wr_data),
        .full     (fifo_full),
        .rd_en    (mult_rd_en),
        .rd_data  (fifo_rd_data),
        .empty    (fifo_empty)
    );
    
    // 3. 乘法器模块
    multiplier u_multiplier (
        .clk       (clk),
        .rst_n     (rst_n),
        .mult_data (fifo_rd_data),
        .empty     (fifo_empty),
        .rd_en     (mult_rd_en),
        .mult_done (mult_done),
        .product   (product),
        .prod_mode (prod_mode)
    );
    
    // 4. 累加器模块
    accumulator u_accumulator (
        .clk        (clk),
        .rst_n      (rst_n),
        .mult_done  (mult_done),
        .product    (product),
        .prod_mode  (prod_mode),
        .acc_valid  (acc_valid),
        .acc_data   (acc_data),
        .acc_carry  (acc_carry_out)
    );
    
    // 5. 串行输出模块
    serial_output u_serial_output (
        .clk          (clk),
        .rst_n        (rst_n),
        .acc_valid    (acc_valid),
        .acc_data     (acc_data),
        .acc_carry_in (acc_carry_out),
        .sum_out      (sum_out),
        .out_ready    (out_ready),
        .carry_out    (carry)
    );

endmodule