// 16位 纯组合逻辑 Kogge-Stone 超前进位加法器
module stage3_ksa (
    input  wire [15:0] A,    // 16位操作数A
    input  wire [15:0] B,    // 16位操作数B
    output wire [15:0] Sum  // 16位和
);

// -------------------------- 1. 定义进位生成G、进位传播P -------------------------
// Gi = Ai & Bi  ：进位生成（本位自身产生进位）
// Pi = Ai ^ Bi  ：进位传播（本位传递低位进位）
wire [15:0] G, P;
generate
    for (genvar i=0; i<16; i=i+1) begin
        assign G[i] = A[i] & B[i];
        assign P[i] = A[i] ^ B[i];
    end
endgenerate

// -------------------------- 2. 4级并行前缀进位网络（16位核心）---------------------
// 16位KS加法器：前缀级数 = log2(16) = 4级
wire [15:0] C1, C2, C3, C; // 各级进位中间变量

// 第1级前缀 (步长=1)
assign C1[0]  = G[0];
assign C1[15] = G[15] | (P[15] & G[14]);
assign C1[14] = G[14] | (P[14] & G[13]);
assign C1[13] = G[13] | (P[13] & G[12]);
assign C1[12] = G[12] | (P[12] & G[11]);
assign C1[11] = G[11] | (P[11] & G[10]);
assign C1[10] = G[10] | (P[10] & G[9]);
assign C1[9]  = G[9]  | (P[9]  & G[8]);
assign C1[8]  = G[8]  | (P[8]  & G[7]);
assign C1[7]  = G[7]  | (P[7]  & G[6]);
assign C1[6]  = G[6]  | (P[6]  & G[5]);
assign C1[5]  = G[5]  | (P[5]  & G[4]);
assign C1[4]  = G[4]  | (P[4]  & G[3]);
assign C1[3]  = G[3]  | (P[3]  & G[2]);
assign C1[2]  = G[2]  | (P[2]  & G[1]);
assign C1[1]  = G[1]  | (P[1]  & G[0]);

// 第2级前缀 (步长=2)
assign C2[0]  = C1[0];
assign C2[1]  = C1[1];
assign C2[15] = G[15] | (P[15] & C1[13]);
assign C2[14] = G[14] | (P[14] & C1[12]);
assign C2[13] = G[13] | (P[13] & C1[11]);
assign C2[12] = G[12] | (P[12] & C1[10]);
assign C2[11] = G[11] | (P[11] & C1[9]);
assign C2[10] = G[10] | (P[10] & C1[8]);
assign C2[9]  = G[9]  | (P[9]  & C1[7]);
assign C2[8]  = G[8]  | (P[8]  & C1[6]);
assign C2[7]  = G[7]  | (P[7]  & C1[5]);
assign C2[6]  = G[6]  | (P[6]  & C1[4]);
assign C2[5]  = G[5]  | (P[5]  & C1[3]);
assign C2[4]  = G[4]  | (P[4]  & C1[2]);
assign C2[3]  = G[3]  | (P[3]  & C1[1]);
assign C2[2]  = G[2]  | (P[2]  & C1[0]);

// 第3级前缀 (步长=4)
assign C3[0]  = C2[0];
assign C3[1]  = C2[1];
assign C3[2]  = C2[2];
assign C3[3]  = C2[3];
assign C3[15] = G[15] | (P[15] & C2[11]);
assign C3[14] = G[14] | (P[14] & C2[10]);
assign C3[13] = G[13] | (P[13] & C2[9]);
assign C3[12] = G[12] | (P[12] & C2[8]);
assign C3[11] = G[11] | (P[11] & C2[7]);
assign C3[10] = G[10] | (P[10] & C2[6]);
assign C3[9]  = G[9]  | (P[9]  & C2[5]);
assign C3[8]  = G[8]  | (P[8]  & C2[4]);
assign C3[7]  = G[7]  | (P[7]  & C2[3]);
assign C3[6]  = G[6]  | (P[6]  & C2[2]);
assign C3[5]  = G[5]  | (P[5]  & C2[1]);
assign C3[4]  = G[4]  | (P[4]  & C2[0]);

// 第4级前缀 (步长=8) → 最终进位C
assign C[0]  = 1'b0;       // 最低位进位输入 C0=0
assign C[1]  = C3[1];
assign C[2]  = C3[2];
assign C[3]  = C3[3];
assign C[4]  = C3[4];
assign C[5]  = C3[5];
assign C[6]  = C3[6];
assign C[7]  = C3[7];
assign C[15] = G[15] | (P[15] & C3[7]);
assign C[14] = G[14] | (P[14] & C3[6]);
assign C[13] = G[13] | (P[13] & C3[5]);
assign C[12] = G[12] | (P[12] & C3[4]);
assign C[11] = G[11] | (P[11] & C3[3]);
assign C[10] = G[10] | (P[10] & C3[2]);
assign C[9]  = G[9]  | (P[9]  & C3[1]);
assign C[8]  = G[8]  | (P[8]  & C3[0]);

// -------------------------- 3. 计算最终和 Sum -------------------------
// Sum_i = P_i ^ C_i (低位进位)
generate
    for (genvar i=0; i<16; i=i+1) begin
        assign Sum[i] = P[i] ^ C[i];
    end
endgenerate
endmodule