`timescale 1ns / 1ps
// ============================================================================
// Module: stage1_booth
// Description: 8x8 无符号乘法器 - 第一级组合逻辑 (Booth 编码与部分积生成)
// ============================================================================

module stage1_booth (
    input  [7:0] A,     // 8位无符号被乘数
    input  [7:0] B,     // 8位无符号乘数

    output reg  [9:0] pp0,   // 第 0 行部分积基数
    output reg  [9:0] pp1,   // 第 1 行部分积基数
    output reg  [9:0] pp2,   // 第 2 行部分积基数
    output reg  [9:0] pp3,   // 第 3 行部分积基数
    output reg  [9:0] pp4,   // 第 4 行部分积基数

    output reg        c0,    // 第 0 行补偿进位 (用于负数取反加1)
    output reg        c1,
    output reg        c2,
    output reg        c3,
    output reg        c4
);

    // ========================================================================
    // 1. 乘数 B 的扩展与切片 (Padding)
    // ========================================================================
    // 高位补 2 个 0 (确保无符号正数)，低位补 1 个 0 (Booth标准结尾)
    wire [10:0] B_pad = {2'b00, B, 1'b0};

    wire [2:0] code0 = B_pad[2:0];
    wire [2:0] code1 = B_pad[4:2];
    wire[2:0] code2 = B_pad[6:4];
    wire [2:0] code3 = B_pad[8:6];
    wire [2:0] code4 = B_pad[10:8]; // 无符号特有的第 5 组

    // ========================================================================
    // 2. 被乘数 A 的倍数预处理 (10位安全位宽)
    // ========================================================================
    // A 是无符号数，所以在前面直接补 2 个 0 变成正数
    wire[9:0] A_pos1 = {2'b00, A};       // +A
    // +2A 就是左移 1 位，最高位补 1 个 0，最低位补 1 个 0
    wire [9:0] A_pos2 = {1'b0, A, 1'b0};  // +2A
    
    // 负数直接按位取反 (加 1 的操作留给后面的 c0~c4)
    wire [9:0] A_neg1 = ~A_pos1;          // -A 
    wire [9:0] A_neg2 = ~A_pos2;          // -2A 

    // ========================================================================
    // 3. 多路选择器阵列 (MUX Array)：生成部分积与补偿位
    // ========================================================================
    
    // --- PP0 ---
    always @(*) begin
        case(code0)
            3'b001, 3'b010: begin pp0 = A_pos1; c0 = 1'b0; end // +A
            3'b011:         begin pp0 = A_pos2; c0 = 1'b0; end // +2A
            3'b100:         begin pp0 = A_neg2; c0 = 1'b1; end // -2A (需补偿+1)
            3'b101, 3'b110: begin pp0 = A_neg1; c0 = 1'b1; end // -A  (需补偿+1)
            default:        begin pp0 = 10'd0;  c0 = 1'b0; end // 0
        endcase
    end

    // --- PP1 ---
    always @(*) begin
        case(code1)
            3'b001, 3'b010: begin pp1 = A_pos1; c1 = 1'b0; end
            3'b011:         begin pp1 = A_pos2; c1 = 1'b0; end
            3'b100:         begin pp1 = A_neg2; c1 = 1'b1; end
            3'b101, 3'b110: begin pp1 = A_neg1; c1 = 1'b1; end
            default:        begin pp1 = 10'd0;  c1 = 1'b0; end
        endcase
    end

    // --- PP2 ---
    always @(*) begin
        case(code2)
            3'b001, 3'b010: begin pp2 = A_pos1; c2 = 1'b0; end
            3'b011:         begin pp2 = A_pos2; c2 = 1'b0; end
            3'b100:         begin pp2 = A_neg2; c2 = 1'b1; end
            3'b101, 3'b110: begin pp2 = A_neg1; c2 = 1'b1; end
            default:        begin pp2 = 10'd0;  c2 = 1'b0; end
        endcase
    end

    // --- PP3 ---
    always @(*) begin
        case(code3)
            3'b001, 3'b010: begin pp3 = A_pos1; c3 = 1'b0; end
            3'b011:         begin pp3 = A_pos2; c3 = 1'b0; end
            3'b100:         begin pp3 = A_neg2; c3 = 1'b1; end
            3'b101, 3'b110: begin pp3 = A_neg1; c3 = 1'b1; end
            default:        begin pp3 = 10'd0;  c3 = 1'b0; end
        endcase
    end

    // --- PP4 (无符号数特有的高位组) ---
    always @(*) begin
        // 注意：因为 code4 的来源是 {0, 0, B[7]}，
        // 所以它只可能是 000 (0) 或者 001 (+A)。
        // 这一组绝对不可能出现负数！所以逻辑极其简单！
        case(code4)
            3'b001:  begin pp4 = A_pos1; c4 = 1'b0; end
            default: begin pp4 = 10'd0;  c4 = 1'b0; end
        endcase
    end

endmodule