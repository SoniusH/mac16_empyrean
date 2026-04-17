`timescale 1ns/1ps

module tb_serial_output();

    reg clk;
    reg rst_n;
    reg acc_valid;
    reg [23:0] acc_data;
    reg acc_carry_in;
    
    wire sum_out;
    wire out_ready;
    wire carry_out;
    
    reg [23:0] test_data;
    reg        test_carry;
    integer    i, j;
    
    serial_output uut (
        .clk          (clk),
        .rst_n        (rst_n),
        .acc_valid    (acc_valid),
        .acc_data     (acc_data),
        .acc_carry_in (acc_carry_in),
        .sum_out      (sum_out),
        .out_ready    (out_ready),
        .carry_out    (carry_out)
    );
    
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    task send_data;
        input [23:0] data;
        input        carry;
        begin
            @(posedge clk);
            acc_valid <= 1'b1;
            acc_data <= data;
            acc_carry_in <= carry;
            @(posedge clk);
            acc_valid <= 1'b0;
        end
    endtask
    
    initial begin
        rst_n = 1'b0;
        acc_valid = 1'b0;
        acc_data = 24'd0;
        acc_carry_in = 1'b0;
        
        repeat(5) @(posedge clk);
        rst_n = 1'b1;
        repeat(2) @(posedge clk);
        
        // Test 1: 单次发送，检查串行输出
        test_data = 24'hAAAAAA;
        test_carry = 1'b1;
        send_data(test_data, test_carry);
        
        repeat(30) @(posedge clk);
        
        // Test 2: 发送全0数据
        test_data = 24'h000000;
        test_carry = 1'b0;
        send_data(test_data, test_carry);
        
        repeat(30) @(posedge clk);
        
        // Test 3: 发送全1数据
        test_data = 24'hFFFFFF;
        test_carry = 1'b1;
        send_data(test_data, test_carry);
        
        repeat(30) @(posedge clk);
        
        // Test 4: 发送特定位模式（交替01）
        test_data = 24'h555555;
        test_carry = 1'b0;
        send_data(test_data, test_carry);
        
        repeat(30) @(posedge clk);
        
        // Test 5: 发送特定位模式（交替10）
        test_data = 24'hAAAAAA;
        test_carry = 1'b1;
        send_data(test_data, test_carry);
        
        repeat(30) @(posedge clk);
        
        // Test 6: 背靠背发送（验证busy期间能否正确拒绝新数据）
        test_data = 24'h123456;
        test_carry = 1'b0;
        send_data(test_data, test_carry);
        
        @(posedge clk);
        // 在busy期间尝试发送新数据
        acc_valid <= 1'b1;
        acc_data <= 24'hABCDEF;
        acc_carry_in <= 1'b1;
        @(posedge clk);
        acc_valid <= 1'b0;
        
        repeat(30) @(posedge clk);
        
        // Test 7: 连续发送3个数据
        for (i = 0; i < 3; i = i + 1) begin
            test_data = 24'h111111 * (i + 1);
            test_carry = i[0];
            send_data(test_data, test_carry);
            repeat(25) @(posedge clk);
        end
        
        // Test 8: 发送随机数据
        test_data = 24'h5A5A5A;
        test_carry = 1'b1;
        send_data(test_data, test_carry);
        
        repeat(30) @(posedge clk);
        
        // Test 9: 发送后立即复位
        test_data = 24'hDEADBE;
        test_carry = 1'b0;
        send_data(test_data, test_carry);
        
        repeat(5) @(posedge clk);
        rst_n = 1'b0;
        @(posedge clk);
        @(posedge clk);
        rst_n = 1'b1;
        
        // Test 10: 复位后重新发送
        test_data = 24'hBEEF00;
        test_carry = 1'b1;
        send_data(test_data, test_carry);
        
        repeat(30) @(posedge clk);
        
        $finish;
    end
    
    

endmodule