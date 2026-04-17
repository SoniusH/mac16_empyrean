`timescale 1ns/1ps

module tb_multiplier();

    reg         clk;
    reg         rst_n;
    reg  [32:0] mult_data;
    reg         empty;
    
    wire        rd_en;
    wire        mult_done;
    wire [31:0] product;
    wire        prod_mode;
    
    integer     error_cnt, test_cnt;
    
    // 随机测试用的变量
    reg [15:0]  rand_a, rand_b;
    reg         rand_mode;
    integer     j;
    
    multiplier uut (
        .clk        (clk),
        .rst_n      (rst_n),
        .mult_data  (mult_data),
        .empty      (empty),
        .rd_en      (rd_en),
        .mult_done  (mult_done),
        .product    (product),
        .prod_mode  (prod_mode)
    );
    
    //========================================================================
    // 时钟生成
    //========================================================================
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    //========================================================================
    // 测试任务
    //========================================================================
    task send_data;
        input [15:0] a;
        input [15:0] b;
        input        mode;
        begin
            empty <= 1'b0;
            mult_data <= {mode, b, a};
            @(posedge clk);
            while (!rd_en) begin
                @(posedge clk);
            end
            empty <= 1'b1;
            @(posedge clk);
        end
    endtask
    
    task wait_mult_done;
        begin
            while (!mult_done) begin
                @(posedge clk);
            end
        end
    endtask
    
    task test_mult;
        input [15:0] a;
        input [15:0] b;
        input        mode;
        input [31:0] expected;
        begin
            test_cnt = test_cnt + 1;
            send_data(a, b, mode);
            wait_mult_done();
            
            if (product !== expected) begin
                $display("ERROR: 0x%04h x 0x%04h = 0x%08h, expected 0x%08h", 
                         a, b, product, expected);
                error_cnt = error_cnt + 1;
            end
            
            if (prod_mode !== mode) begin
                $display("ERROR: mode mismatch for 0x%04h x 0x%04h", a, b);
                error_cnt = error_cnt + 1;
            end
        end
    endtask
    
    task test_mult_auto;
        input [15:0] a;
        input [15:0] b;
        input        mode;
        reg   [31:0] expected;
        begin
            expected = {16'd0, a} * {16'd0, b};
            test_mult(a, b, mode, expected);
        end
    endtask
    
    //========================================================================
    // 主测试流程
    //========================================================================
    initial begin
        rst_n = 1'b0;
        empty = 1'b1;
        mult_data = 33'd0;
        error_cnt = 0;
        test_cnt = 0;
        
        repeat(5) @(posedge clk);
        rst_n = 1'b1;
        repeat(2) @(posedge clk);
        
        $display("Multiplier Testbench Started\n");
        
        // 基础测试
        test_mult_auto(16'h0003, 16'h0004, 1'b0);
        test_mult_auto(16'h0010, 16'h0010, 1'b1);
        test_mult_auto(16'h0000, 16'h1234, 1'b0);
        test_mult_auto(16'hFFFF, 16'h0000, 1'b1);
        
        // 边界测试
        test_mult_auto(16'h0001, 16'h0001, 1'b0);
        test_mult_auto(16'hFFFF, 16'h0001, 1'b1);
        test_mult_auto(16'h0001, 16'hFFFF, 1'b0);
        test_mult_auto(16'hFFFF, 16'hFFFF, 1'b1);
        
        // 3A 溢出边界测试
        test_mult_auto(16'hFFFF, 16'h0003, 1'b0);
        test_mult_auto(16'h8000, 16'h0003, 1'b0);
        test_mult_auto(16'hAAAA, 16'h0003, 1'b0);
        test_mult_auto(16'h5555, 16'h0003, 1'b0);
        
        // 部分积选择测试
        test_mult_auto(16'h1234, 16'h0000, 1'b0);
        test_mult_auto(16'h1234, 16'h0001, 1'b0);
        test_mult_auto(16'h1234, 16'h0002, 1'b0);
        test_mult_auto(16'h1234, 16'h0003, 1'b0);
        
        // 移位累加测试
        test_mult_auto(16'h0001, 16'h0004, 1'b0);
        test_mult_auto(16'h0001, 16'h0010, 1'b0);
        test_mult_auto(16'h0001, 16'h0040, 1'b0);
        test_mult_auto(16'h0001, 16'h0100, 1'b0);
        test_mult_auto(16'h0001, 16'h1000, 1'b0);
        test_mult_auto(16'h0001, 16'h4000, 1'b0);
        
        // 进位传递测试
        test_mult_auto(16'h00FF, 16'h0001, 1'b0);
        test_mult_auto(16'hFFFF, 16'h0002, 1'b0);
        test_mult_auto(16'h7FFF, 16'h0002, 1'b0);
        test_mult_auto(16'h0100, 16'h0100, 1'b0);
        test_mult_auto(16'h1000, 16'h1000, 1'b0);
        
        // 随机测试
        test_mult_auto(16'h1234, 16'h5678, 1'b0);
        test_mult_auto(16'hABCD, 16'hEF01, 1'b1);
        test_mult_auto(16'hA5A5, 16'h5A5A, 1'b0);
        test_mult_auto(16'h55AA, 16'hAA55, 1'b1);
        
        // 大数测试
        test_mult_auto(16'h0001, 16'h8000, 1'b0);
        test_mult_auto(16'h8000, 16'h8000, 1'b1);
        test_mult_auto(16'h4000, 16'h0004, 1'b0);
        test_mult_auto(16'h2000, 16'h0010, 1'b1);
        test_mult_auto(16'h7FFF, 16'h7FFF, 1'b1);
        
        // 额外测试
        test_mult_auto(16'h00AA, 16'h00BB, 1'b0);
        test_mult_auto(16'h00CC, 16'h00DD, 1'b1);
        test_mult_auto(16'h00EE, 16'h00FF, 1'b0);
        test_mult_auto(16'hFFFE, 16'h0002, 1'b0);
        test_mult_auto(16'hFFFD, 16'h0003, 1'b1);
        
        // 随机测试 10 组
        for (j = 0; j < 10; j = j + 1) begin
            rand_a = $random % 65536;
            rand_b = $random % 65536;
            rand_mode = $random % 2;
            test_mult_auto(rand_a, rand_b, rand_mode);
        end
        
        // 测试结果汇总
        $display("\n==========================================");
        $display("           Test Summary");
        $display("==========================================");
        $display("Total tests: %0d", test_cnt);
        $display("Errors:      %0d", error_cnt);
        if (error_cnt == 0)
            $display("Status:      ALL TESTS PASSED!");
        else
            $display("Status:      TEST FAILED!");
        $display("==========================================\n");
        
        repeat(10) @(posedge clk);
        $finish;
    end
    
    //========================================================================
    // 超时保护
    //========================================================================
    initial begin
        #200000;
        $display("ERROR: Simulation timeout!");
        $finish;
    end

endmodule