`timescale 1ns / 1ps
// ============================================================================
// Module Name: sync_fifo
// Description: 同步 FIFO，采用 FWFT 模式，解决速率不匹配问题
// ============================================================================

module sync_fifo #(
    parameter DATA_WIDTH = 25, // 24位结果 + 1位carry
    parameter ADDR_WIDTH = 2   // 深度 = 2^2 = 4
)(
    input  wire                  clk,
    input  wire                  rst_n,
    
    input  wire                  wr_en,
    input  wire [DATA_WIDTH-1:0] wr_data,
    
    input  wire                  rd_en,  // Pop (读取确认)
    output wire[DATA_WIDTH-1:0] rd_data,// 始终呈现头部数据 (FWFT)
    
    output wire                  full,
    output wire                  empty
);

    localparam DEPTH = 1 << ADDR_WIDTH;
    
    // 存储阵列
    reg [DATA_WIDTH-1:0] mem[0:DEPTH-1];
    
    // 指针 (多 1 位用于空满判断)
    reg[ADDR_WIDTH:0] wr_ptr;
    reg [ADDR_WIDTH:0] rd_ptr;

    // --- 状态标志位判断 ---
    // 空：读写指针完全相等
    assign empty = (wr_ptr == rd_ptr);
    
    // 满：最高位不同（折返了一圈），但其余位完全相同
    assign full = (wr_ptr[ADDR_WIDTH] != rd_ptr[ADDR_WIDTH]) &&
                  (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);

    // --- FWFT 读数据输出 ---
    // 只要有数据，直接指向 rd_ptr 对应的存储单元
    assign rd_data = mem[rd_ptr[ADDR_WIDTH-1:0]];

    // --- 写入与读取逻辑 ---
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
        end else begin
            // 写入操作 (非满且有写使能)
            if (wr_en && !full) begin
                mem[wr_ptr[ADDR_WIDTH-1:0]] <= wr_data;
                wr_ptr <= wr_ptr + 1'b1;
            end
            
            // 读取操作 (非空且有读使能/Pop)
            if (rd_en && !empty) begin
                rd_ptr <= rd_ptr + 1'b1;
            end
        end
    end

endmodule