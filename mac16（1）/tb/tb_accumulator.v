`timescale 1ns/1ps

module tb_accumulator();

    reg         clk;
    reg         rst_n;
    reg         mult_done;
    reg  [31:0] product;
    reg         prod_mode;
    
    wire        acc_valid;
    wire [23:0] acc_data;
    wire        acc_carry;
    
    reg  [31:0] test_products [0:9];
    integer     i, j;
    
    accumulator uut (
        .clk        (clk),
        .rst_n      (rst_n),
        .mult_done  (mult_done),
        .product    (product),
        .prod_mode  (prod_mode),
        .acc_valid  (acc_valid),
        .acc_data   (acc_data),
        .acc_carry  (acc_carry)
    );
    
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    task send_product;
        input [31:0] data;
        input        mode;
        begin
            @(posedge clk);
            mult_done <= 1'b1;
            product   <= data;
            prod_mode <= mode;
            @(posedge clk);
            mult_done <= 1'b0;
        end
    endtask
    
    task wait_acc;
        begin
            while (!acc_valid) begin
                @(posedge clk);
            end
        end
    endtask
    
    initial begin
        rst_n     = 1'b0;
        mult_done = 1'b0;
        product   = 32'd0;
        prod_mode = 1'b0;
        
        repeat(5) @(posedge clk);
        rst_n = 1'b1;
        repeat(2) @(posedge clk);
        
        // Test 1: 模式0单次输入
        send_product(32'h10, 1'b0);
        wait_acc();
        
        // Test 2: 模式0连续累加
        send_product(32'h20, 1'b0);
        wait_acc();
        send_product(32'h30, 1'b0);
        wait_acc();
        send_product(32'h40, 1'b0);
        wait_acc();
        
        // Test 3: 切换模式 0→1
        send_product(32'h100, 1'b1);
        wait_acc();
        
        // Test 4: 模式1连续累加
        send_product(32'h200, 1'b1);
        wait_acc();
        send_product(32'h300, 1'b1);
        wait_acc();
        send_product(32'h400, 1'b1);
        wait_acc();
        
        // Test 5: 产生进位
        send_product(32'hFFFFFF, 1'b1);
        wait_acc();
        
        // Test 6: 进位粘滞测试
        send_product(32'h1, 1'b1);
        wait_acc();
        send_product(32'h1, 1'b1);
        wait_acc();
        
        // Test 7: 切换模式清除粘滞进位
        send_product(32'h10, 1'b0);
        wait_acc();
        
        
        // Test 8: 随机数据测试
        test_products[0] = 32'hA5A5A5;
        test_products[1] = 32'h5A5A5A;
        test_products[2] = 32'h123456;
        test_products[3] = 32'h654321;
        test_products[4] = 32'hFFFFFF;
        
        send_product(test_products[0], 1'b0);
        wait_acc();
        send_product(test_products[1], 1'b0);
        wait_acc();
        
        send_product(test_products[2], 1'b1);
        wait_acc();
        send_product(test_products[3], 1'b1);
        wait_acc();
        send_product(test_products[4], 1'b1);
        wait_acc();
        
        // Test 9: 复位测试
        @(posedge clk);
        rst_n = 1'b0;
        @(posedge clk);
        @(posedge clk);
        rst_n = 1'b1;
        
        send_product(32'h100, 1'b1);
        wait_acc();
        
        // Test 10: 大数据量进位测试
        send_product(32'hFFFFFF, 1'b1);
        wait_acc();
        send_product(32'hFFFF, 1'b1);
        wait_acc();
        send_product(32'hFF, 1'b1);
        wait_acc();
        
        // Test 11: 模式切换后重新累加
        send_product(32'h1, 1'b0);
        wait_acc();
        send_product(32'h2, 1'b0);
        wait_acc();
        send_product(32'h3, 1'b1);
        wait_acc();
        send_product(32'h4, 1'b1);
        wait_acc();
        
        repeat(5) @(posedge clk);
        $finish;
    end


endmodule