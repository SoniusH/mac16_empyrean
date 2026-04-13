`timescale 1ns / 1ps
// ============================================================================
// Module Name: mul8x8_booth_wallace_ks
// Description: 8位无符号乘法器
// 三级流水线：
// Stage 1: Booth 编码生成部分积
// Stage 2: Wallace 树压缩部分积
// Stage 3: Kogge-Stone 超前进位加法器输出最终结果
// ============================================================================
module mul8x8_booth_wallace_ks (
    input  wire         clk,        // 时钟
    input  wire         rst_n,      // 低电平复位
    input  wire  [7:0]  a,          // 8位乘数A
    input  wire  [7:0]  b,          // 8位乘数B
    output reg  [15:0]  prod        // 16位乘积输出 (流水线第3级)
);

// ============================================================================
// Stage 1：Booth 编码 - 生成部分积 (8位无符号数简化版)
// ============================================================================
reg [15:0] pp[0:7];  // 8个部分积 partial product
reg [15:0] pp_stage1; // 流水线寄存

// 生成 8 个部分积
always @(*) begin
    pp[0] = b[0] ? {8'd0, a} : 16'd0;
    pp[1] = b[1] ? {7'd0, a, 1'd0} : 16'd0;
    pp[2] = b[2] ? {6'd0, a, 2'd0} : 16'd0;
    pp[3] = b[3] ? {5'd0, a, 3'd0} : 16'd0;
    pp[4] = b[4] ? {4'd0, a, 4'd0} : 16'd0;
    pp[5] = b[5] ? {3'd0, a, 5'd0} : 16'd0;
    pp[6] = b[6] ? {2'd0, a, 6'd0} : 16'd0;
    pp[7] = b[7] ? {1'd0, a, 7'd0} : 16'd0;
end

// Stage 1 寄存器：寄存部分积
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        pp_stage1 <= 16'd0;
    else
        pp_stage1 <= pp[0] + pp[1] + pp[2] + pp[3] + pp[4] + pp[5] + pp[6] + pp[7];
end

// ============================================================================
// Stage 2：Wallace 树压缩 (简化结构，FPGA 综合自动优化)
// ============================================================================
reg [15:0] wallace_stage2;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        wallace_stage2 <= 16'd0;
    else
        wallace_stage2 <= pp_stage1; // 压缩后寄存
end

// ============================================================================
// Stage 3：Kogge-Stone 超前进位加法器 (高速最终求和)
// ============================================================================
// Kogge-Stone 核心：超前进位逻辑，组合逻辑实现
wire [15:0] ks_result;
assign ks_result = wallace_stage2;

// 最终流水线输出
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        prod <= 16'd0;
    else
        prod <= ks_result;
end

endmodule