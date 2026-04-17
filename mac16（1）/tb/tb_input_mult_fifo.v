`timescale 1ns/1ps

module tb_input_mult_fifo();

    parameter DATA_WIDTH = 33;
    parameter FIFO_DEPTH = 8;
    
    reg clk;
    reg rst_n;
    reg wr_en;
    reg [DATA_WIDTH-1:0] wr_data;
    wire full;
    reg rd_en;
    wire [DATA_WIDTH-1:0] rd_data;
    wire empty;
    
    reg [DATA_WIDTH-1:0] test_data;
    integer i, j;
    
    input_mult_fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .FIFO_DEPTH(FIFO_DEPTH)
    ) uut (
        .clk      (clk),
        .rst_n    (rst_n),
        .wr_en    (wr_en),
        .wr_data  (wr_data),
        .full     (full),
        .rd_en    (rd_en),
        .rd_data  (rd_data),
        .empty    (empty)
    );
    
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    task write_fifo;
        input [DATA_WIDTH-1:0] data;
        begin
            @(posedge clk);
            while (full) begin
                @(posedge clk);
            end
            wr_en <= 1'b1;
            wr_data <= data;
            @(posedge clk);
            wr_en <= 1'b0;
        end
    endtask
    
    task read_fifo;
        output [DATA_WIDTH-1:0] data;
        begin
            @(posedge clk);
            while (empty) begin
                @(posedge clk);
            end
            rd_en <= 1'b1;
            @(posedge clk);
            rd_en <= 1'b0;
            data = rd_data;
        end
    endtask
    
    initial begin
        rst_n   = 1'b0;
        wr_en   = 1'b0;
        wr_data = 33'd0;
        rd_en   = 1'b0;
        
        repeat(5) @(posedge clk);
        rst_n = 1'b1;
        repeat(2) @(posedge clk);
        
        // Test 1: 单次写入读出
        test_data = 33'h0AAAAAAAA;
        write_fifo(test_data);
        repeat(2) @(posedge clk);
        read_fifo(test_data);
        
        // Test 2: 连续写入6个数据（不满）
        for (i = 0; i < 6; i = i + 1) begin
            write_fifo(33'h100000000 + i);
        end
        
        // Test 3: 继续写入2个数据至满
        for (i = 0; i < 2; i = i + 1) begin
            write_fifo(33'h100000100 + i);
        end
        
        // Test 4: 满时写入（应被忽略）
        wr_en <= 1'b1;
        wr_data <= 33'h1ABCDEF00;
        @(posedge clk);
        wr_en <= 1'b0;
        
        // Test 5: 连续读出8个数据至空
        for (i = 0; i < 8; i = i + 1) begin
            read_fifo(test_data);
        end
        
        // Test 6: 空时读出（应被忽略）
        rd_en <= 1'b1;
        @(posedge clk);
        rd_en <= 1'b0;
        
        // Test 7: 边写边读（并发测试）
        fork
            begin
                for (i = 0; i < 4; i = i + 1) begin
                    write_fifo(33'h100000200 + i);
                end
            end
            begin
                repeat(2) @(posedge clk);
                for (j = 0; j < 4; j = j + 1) begin
                    read_fifo(test_data);
                end
            end
        join
        
        // Test 8: 环绕测试（12次写入，每3次读一次）
        for (i = 0; i < 12; i = i + 1) begin
            write_fifo(33'h100000300 + i);
            if (i % 3 == 0) begin
                read_fifo(test_data);
            end
        end
        
        // 清空FIFO
        while (!empty) begin
            read_fifo(test_data);
        end
        
        
        repeat(5) @(posedge clk);
        $finish;
    end


endmodule