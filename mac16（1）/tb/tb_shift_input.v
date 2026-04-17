`timescale 1ns/1ps

module tb_shift_input();

    reg clk;
    reg rst_n;
    reg in_ready;
    reg inA;
    reg inB;
    reg mode;
    
    wire [32:0] shift_data;
    wire        data_ready;
    
    reg [15:0] test_data_A;
    reg [15:0] test_data_B;
    integer i;
    
    shift_input uut (
        .clk        (clk),
        .rst_n      (rst_n),
        .in_ready   (in_ready),
        .inA        (inA),
        .inB        (inB),
        .mode       (mode),
        .shift_data (shift_data),
        .data_ready (data_ready)
    );
    
    // 时钟生成
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    
    // 发送一次 16 位数据的任务
    task send_data;
        input [15:0] data_a;
        input [15:0] data_b;
        input        mode_val;
        begin
            mode = mode_val;
            in_ready = 1'b1;
            for (i = 0; i < 16; i = i + 1) begin
                inA = data_a[15 - i];
                inB = data_b[15 - i];
                @(posedge clk);
            end
            in_ready = 1'b0;
        end
    endtask
    
    // 主测试流程
    initial begin
        // 初始化
        rst_n     = 1'b0;
        in_ready  = 1'b0;
        inA       = 1'b0;
        inB       = 1'b0;
        mode      = 1'b0;
        
        repeat(5) @(posedge clk);
        rst_n = 1'b1;
        repeat(2) @(posedge clk);
        
        // Test 1: 0xAAAA × 0xCCCC, mode=0
        test_data_A = 16'hAAAA;
        test_data_B = 16'hCCCC;
        send_data(test_data_A, test_data_B, 1'b0);
        wait(data_ready);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        
        // Test 2: 0x1234 × 0x5678, mode=1
        test_data_A = 16'h1234;
        test_data_B = 16'h5678;
        send_data(test_data_A, test_data_B, 1'b1);
        wait(data_ready);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        
        // Test 3: 中断传输测试（前8拍 + 暂停 + 后8拍）
        test_data_A = 16'hFFFF;
        test_data_B = 16'h0000;
        mode = 1'b0;
        
        in_ready = 1'b1;
        for (i = 0; i < 8; i = i + 1) begin
            inA = test_data_A[15 - i];
            inB = test_data_B[15 - i];
            @(posedge clk);
        end
        in_ready = 1'b0;
        
        repeat(5) @(posedge clk);  // 暂停
        
        in_ready = 1'b1;
        for (i = 8; i < 16; i = i + 1) begin
            inA = test_data_A[15 - i];
            inB = test_data_B[15 - i];
            @(posedge clk);
        end
        in_ready = 1'b0;
        
        wait(data_ready);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        
        // Test 4: 复位打断测试
        test_data_A = 16'hAAAA;
        test_data_B = 16'h5555;
        mode = 1'b0;
        
        in_ready = 1'b1;
        for (i = 0; i < 5; i = i + 1) begin
            inA = test_data_A[15 - i];
            inB = test_data_B[15 - i];
            @(posedge clk);
        end
        
        // 中途复位
        rst_n = 1'b0;
        @(posedge clk);
        @(posedge clk);
        rst_n = 1'b1;
        in_ready = 1'b0;
        
        repeat(3) @(posedge clk);
        
        // Test 5: 复位后正常传输
        test_data_A = 16'h1111;
        test_data_B = 16'h2222;
        send_data(test_data_A, test_data_B, 1'b0);
        wait(data_ready);
        


        repeat(10) @(posedge clk);
        $finish;
    end
    

endmodule