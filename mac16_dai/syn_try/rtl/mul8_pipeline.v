`timescale 1ns / 1ps
// ============================================================================
// Module Name: mul8x8_booth_wallace_ks
// Description: 8位无符号乘法器
// 三级流水线：
// Stage 1: Booth 编码生成部分积
// Stage 2: Wallace 树压缩部分积
// Stage 3: Kogge-Stone 超前进位加法器输出最终结果
// ============================================================================
module mul8_pipeline (
    input        clk,        // 时钟
    input        rst_n,      // 低电平复位
    input [7:0]  a,          // 8位乘数A
    input [7:0]  b,          // 8位乘数B
    output reg  [15:0]  prod        // 16位乘积输出 (流水线第3级)
);
    // ========================================================================
    // 第 0 拍：输入寄存器 (Input Registers)
    // 工业界铁律：永远不要让外部的组合逻辑毛刺直接冲进你的高速乘法器！
    // ========================================================================
    reg[7:0] a_reg, b_reg;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_reg <= 8'd0;
            b_reg <= 8'd0;
        end else begin
            a_reg <= a;
            b_reg <= b;
        end
    end

    // ========================================================================
    // 第 1 级组合逻辑：Booth 编码与部分积生成
    // ========================================================================
    wire [9:0] pp0_comb, pp1_comb, pp2_comb, pp3_comb, pp4_comb;
    wire       c0_comb, c1_comb, c2_comb, c3_comb, c4_comb;

    // 例化上一回合写的 stage1_booth (纯组合逻辑)
    stage1_booth u_stage1_booth (
        .A(a_reg), .B(b_reg),
        .pp0(pp0_comb), .pp1(pp1_comb), .pp2(pp2_comb), .pp3(pp3_comb), .pp4(pp4_comb),
        .c0(c0_comb),   .c1(c1_comb),   .c2(c2_comb),   .c3(c3_comb),   .c4(c4_comb)
    );

    // --- 【流水线切割刀 1】 --- 锁存 Stage 1 的结果
    reg[9:0] pp0_reg, pp1_reg, pp2_reg, pp3_reg, pp4_reg;
    reg       c0_reg, c1_reg, c2_reg, c3_reg, c4_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pp0_reg <= 10'd0; pp1_reg <= 10'd0; pp2_reg <= 10'd0; pp3_reg <= 10'd0; pp4_reg <= 10'd0;
            c0_reg <= 1'b0;   c1_reg <= 1'b0;   c2_reg <= 1'b0;   c3_reg <= 1'b0;   c4_reg <= 1'b0;
        end else begin
            pp0_reg <= pp0_comb; pp1_reg <= pp1_comb; pp2_reg <= pp2_comb; pp3_reg <= pp3_comb; pp4_reg <= pp4_comb;
            c0_reg  <= c0_comb;  c1_reg  <= c1_comb;  c2_reg  <= c2_comb;  c3_reg  <= c3_comb;  c4_reg  <= c4_comb;
        end
    end

    // ========================================================================
    // 第 2 级组合逻辑：Wallace 树压缩 (6行 压 2行)
    // ========================================================================
    wire [15:0] S_comb; // 压缩后的 Sum 行
    wire [15:0] C_comb; // 压缩后的 Carry 行

    // 例化即将要写的 stage2_wallace (纯组合逻辑)
    // 它负责把 10 位的 pp 扩展对齐到 16 位，然后压成 2 行 16 位数据
    stage2_wallace u_stage2_wallace (
        .pp0(pp0_reg), .pp1(pp1_reg), .pp2(pp2_reg), .pp3(pp3_reg), .pp4(pp4_reg),
        .c0(c0_reg),   .c1(c1_reg),   .c2(c2_reg),   .c3(c3_reg),   .c4(c4_reg),
        .S_out(S_comb), .C_out(C_comb)
    );

    // --- 【流水线切割刀 2】 --- 锁存 Stage 2 的结果
    reg [15:0] S_reg;
    reg[15:0] C_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            S_reg <= 16'd0;
            C_reg <= 16'd0;
        end else begin
            S_reg <= S_comb;
            C_reg <= C_comb;
        end
    end

    // ========================================================================
    // 第 3 级组合逻辑：Kogge-Stone 超前进位加法器 (KSA)
    // ========================================================================
    wire [15:0] final_sum_comb;

    // 例化即将要写的 stage3_ksa (纯组合逻辑)
    // 它负责把 S_reg 和 C_reg 用极其恐怖的速度加起来
    stage3_ksa u_stage3_ksa (
        .A(S_reg),
        .B(C_reg),
        .Sum(final_sum_comb)
    );

    // --- 【流水线切割刀 3】 --- 锁存最终结果到输出管脚
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            prod <= 16'd0;
        end else begin
            prod <= final_sum_comb;
        end
    end

endmodule