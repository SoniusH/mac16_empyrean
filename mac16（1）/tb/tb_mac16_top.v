`timescale 1ns/1ps

module tb_mac16;

    //========================================================================
    // 参数定义
    //========================================================================
    parameter CLK_PERIOD = 10;  // 100MHz = 10ns周期
    
    //========================================================================
    // 测试数据
    //========================================================================
    localparam DATA_COUNT = 6;
    
    reg [15:0] test_data_a [0:5];
    reg [15:0] test_data_b [0:5];
    
    initial begin
        test_data_a[0] = 16'd2;
        test_data_a[1] = 16'd8;
        test_data_a[2] = 16'd14;
        test_data_a[3] = 16'd116;
        test_data_a[4] = 16'd1546;
        test_data_a[5] = 16'd20698;
        
        test_data_b[0] = 16'd6;
        test_data_b[1] = 16'd30;
        test_data_b[2] = 16'd71;
        test_data_b[3] = 16'd828;
        test_data_b[4] = 16'd1152;
        test_data_b[5] = 16'd728;
    end
    
    //========================================================================
    // 信号定义
    //========================================================================
    reg         clk;
    reg         rst_n;
    reg         in_ready;
    reg         mode;
    reg         inA;
    reg         inB;
    wire        sum_out;
    wire        out_ready;
    wire        carry;
    
    //========================================================================
    // 测试控制
    //========================================================================
    integer     test_mode;          // 0: mode=0, 1: mode=1, 2: mode切换
    integer     i, bit_idx;
    reg  [15:0] send_a;
    reg  [15:0] send_b;
    reg         send_mode;
    
    //========================================================================
    // 期望值计算
    //========================================================================
    reg  [31:0] expected_accumulator;
    reg         expected_carry;
    reg         current_acc_mode;
    reg  [31:0] prev_product;
    reg         first_product_flag;
    
    //========================================================================
    // 结果检查
    //========================================================================
    reg  [23:0] received_data;
    reg         received_carry;
    integer     received_bit_cnt;
    integer     data_received_count;
    integer     expected_output_count;
    integer     error_count;
    
    //========================================================================
    // DUT 例化
    //========================================================================
    mac16 u_mac16 (
        .clk        (clk),
        .rst_n      (rst_n),
        .in_ready   (in_ready),
        .mode       (mode),
        .inA        (inA),
        .inB        (inB),
        .sum_out    (sum_out),
        .out_ready  (out_ready),
        .carry      (carry)
    );
    
    //========================================================================
    // 时钟生成
    //========================================================================
    initial begin
        clk = 1'b0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
    
    //========================================================================
    // 主测试流程
    //========================================================================
    initial begin
        rst_n = 1'b0;
        in_ready = 1'b0;
        mode = 1'b0;
        inA = 1'b0;
        inB = 1'b0;
        error_count = 0;
        
        repeat(10) @(posedge clk);
        @(negedge clk);
        rst_n = 1'b1;
        repeat(5) @(posedge clk);
        
        $display("MAC16 Testbench Started");
        
        // 测试1: mode = 0
        test_mode = 0;
        run_test(0);
        repeat(50) @(posedge clk);
        
        // 测试2: mode = 1
        test_mode = 1;
        run_test(1);
        repeat(50) @(posedge clk);
        
        // 测试3: mode 切换
        test_mode = 2;
        run_test(2);
        
        // 最终结果
        if (error_count == 0)
            $display("ALL TESTS PASSED");
        else
            $display("ALL TESTS FAILED (Errors: %0d)", error_count);
        
        $stop;
    end
    
    //========================================================================
    // 运行单次测试
    //========================================================================
    task run_test;
        input integer mode_setting;
        begin
            expected_accumulator = 32'd0;
            expected_carry = 1'b0;
            current_acc_mode = mode_setting;
            prev_product = 32'd0;
            first_product_flag = 1'b1;
            data_received_count = 0;
            received_data = 24'd0;
            received_bit_cnt = 0;
            received_carry = 1'b0;
            
            expected_output_count = (mode_setting == 0) ? DATA_COUNT - 1 : DATA_COUNT;
            
            for (i = 0; i < DATA_COUNT; i = i + 1) begin
                if (test_mode == 0) send_mode = 1'b0;
                else if (test_mode == 1) send_mode = 1'b1;
                else send_mode = (i < 3) ? 1'b0 : 1'b1;
                
                send_a = test_data_a[i];
                send_b = test_data_b[i];
                
                send_16bit_data(send_a, send_b, send_mode);
                update_expected(send_a, send_b, send_mode);
                repeat(3) @(posedge clk);
            end
            
            wait_all_outputs();
            
            if (data_received_count != expected_output_count) begin
                $display("Test %0d FAILED: received %0d/%0d", 
                         test_mode+1, data_received_count, expected_output_count);
                error_count = error_count + 1;
            end else begin
                $display("Test %0d PASSED", test_mode+1);
            end
        end
    endtask
    
    //========================================================================
    // 发送16位数据 (MSB first)
    //========================================================================
    task send_16bit_data;
        input [15:0] data_a;
        input [15:0] data_b;
        input mode_val;
        begin
            @(posedge clk);
            in_ready = 1'b1;
            mode = mode_val;
            
            for (bit_idx = 15; bit_idx >= 0; bit_idx = bit_idx - 1) begin
                inA = data_a[bit_idx];
                inB = data_b[bit_idx];
                @(posedge clk);
            end
            
            in_ready = 1'b0;
            mode = 1'b0;
            inA = 1'b0;
            inB = 1'b0;
        end
    endtask
    
    //========================================================================
    // 更新期望值
    //========================================================================
    task update_expected;
        input [15:0] a;
        input [15:0] b;
        input m;
        reg [31:0] product_val;
        begin
            product_val = a * b;
            
            if (m == 1'b0) begin
                if (first_product_flag) begin
                    prev_product = product_val;
                    first_product_flag = 1'b0;
                end else begin
                    expected_accumulator = prev_product + product_val;
                    expected_carry = (expected_accumulator > 32'h00FFFFFF) ? 1'b1 : 1'b0;
                    prev_product = product_val;
                end
            end else begin
                if (current_acc_mode == 1'b0) begin
                    expected_accumulator = product_val;
                    expected_carry = 1'b0;
                    current_acc_mode = 1'b1;
                end else begin
                    expected_accumulator = expected_accumulator + product_val;
                    if (expected_accumulator > 32'h00FFFFFF)
                        expected_carry = 1'b1;
                end
            end
        end
    endtask
    
    //========================================================================
    // 等待所有输出完成
    //========================================================================
    task wait_all_outputs;
        integer timeout;
        begin
            timeout = 50000;
            while (data_received_count < expected_output_count && timeout > 0) begin
                @(posedge clk);
                timeout = timeout - 1;
            end
            
            if (timeout == 0) begin
                $display("ERROR: Timeout! Received %0d/%0d", 
                         data_received_count, expected_output_count);
                error_count = error_count + 1;
            end
        end
    endtask
    
    //========================================================================
    // 输出监控和验证
    //========================================================================
    always @(posedge clk) begin
        if (out_ready) begin
            if (received_bit_cnt < 24) begin
                received_data = {received_data[22:0], sum_out};
                received_bit_cnt = received_bit_cnt + 1;
            end
            
            if (received_bit_cnt == 1)
                received_carry = carry;
            
            if (received_bit_cnt == 24) begin
                if (received_data !== expected_accumulator[23:0] || 
                    received_carry !== expected_carry) begin
                    $display("Mismatch at output %0d: got 0x%06h/%0d, exp 0x%06h/%0d",
                             data_received_count, received_data, received_carry,
                             expected_accumulator[23:0], expected_carry);
                    error_count = error_count + 1;
                end
                
                received_data = 24'd0;
                received_bit_cnt = 0;
                data_received_count = data_received_count + 1;
            end
        end
    end
    
    //========================================================================
    // 波形记录
    //========================================================================
    `ifndef XILINX_SIMULATOR
    initial begin
        $dumpfile("tb_mac16.vcd");
        $dumpvars(0, tb_mac16);
    end
    `endif

endmodule