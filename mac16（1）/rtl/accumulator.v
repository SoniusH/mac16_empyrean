`timescale 1ns/1ps

module accumulator (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        mult_done,
    input  wire [31:0] product,
    input  wire        prod_mode,
    
    output reg         acc_valid,
    output reg  [23:0] acc_data,
    output reg         acc_carry
);

    //========================================================================
    // 数据寄存器
    //========================================================================
    reg [31:0] accumulator;
    reg [31:0] prev_product;
    reg        current_mode;
    reg        carry_sticky;
    
    //========================================================================
    // 流水线控制
    //========================================================================
    reg [3:0]  pipe_cnt;
    reg        pipe_busy;
    
    //========================================================================
    // 操作数保存
    //========================================================================
    reg [31:0] op_a;
    reg [31:0] op_b;
    reg        op_mode;
    
    //========================================================================
    // 分片加法结果
    //========================================================================
    reg  [7:0] sum_b0;
    reg        carry_b0;
    
    reg  [7:0] sum_b1;
    reg        carry_b1;
    
    reg  [7:0] sum_b2;
    reg        carry_b2;
    
    reg  [8:0] sum_b3;
    
    //========================================================================
    // Stage 0: 输入锁存与控制
    //========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            accumulator  <= 32'd0;
            prev_product <= 32'd0;
            current_mode <= 1'b0;
            carry_sticky <= 1'b0;
            pipe_busy    <= 1'b0;
            op_a         <= 32'd0;
            op_b         <= 32'd0;
            op_mode      <= 1'b0;
        end else begin
            
            if (mult_done && !pipe_busy) begin
                pipe_busy <= 1'b1;
                op_mode   <= prod_mode;
                
                if (prod_mode != current_mode) begin
                    current_mode <= prod_mode;
                    carry_sticky <= 1'b0;
                    op_a <= 32'd0;
                    op_b <= product;
                end else begin
                    if (prod_mode == 1'b0) begin
                        op_a <= prev_product;
                        op_b <= product;
                    end else begin
                        op_a <= accumulator;
                        op_b <= product;
                    end
                end
            end
            
            if (pipe_cnt == 4'd5) begin
                if (op_mode == 1'b0) begin
                    prev_product <= op_b;
                end else begin
                    accumulator <= {sum_b3, sum_b2, sum_b1, sum_b0};
                    if (sum_b3 != 9'd0) begin
                        carry_sticky <= 1'b1;
                    end
                end
                pipe_busy <= 1'b0;
            end
        end
    end
    
    //========================================================================
    // 流水线计数器 - 统一管理
    //========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pipe_cnt <= 4'd0;
        end else begin
            if (mult_done && !pipe_busy) begin
                pipe_cnt <= 4'd1;
            end else if (pipe_cnt >= 4'd1 && pipe_cnt < 4'd5) begin
                pipe_cnt <= pipe_cnt + 1'b1;
            end else if (pipe_cnt == 4'd5) begin
                pipe_cnt <= 4'd0;
            end
        end
    end
    
    //========================================================================
    // Stage 1: 低 8 位加法
    //========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sum_b0   <= 8'd0;
            carry_b0 <= 1'b0;
        end else if (pipe_cnt == 4'd1) begin
            {carry_b0, sum_b0} <= {1'b0, op_a[7:0]} + {1'b0, op_b[7:0]};
        end
    end
    
    //========================================================================
    // Stage 2: 次低 8 位加法
    //========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sum_b1   <= 8'd0;
            carry_b1 <= 1'b0;
        end else if (pipe_cnt == 4'd2) begin
            {carry_b1, sum_b1} <= {1'b0, op_a[15:8]} + {1'b0, op_b[15:8]} + {8'd0, carry_b0};
        end
    end
    
    //========================================================================
    // Stage 3: 次高 8 位加法
    //========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sum_b2   <= 8'd0;
            carry_b2 <= 1'b0;
        end else if (pipe_cnt == 4'd3) begin
            {carry_b2, sum_b2} <= {1'b0, op_a[23:16]} + {1'b0, op_b[23:16]} + {8'd0, carry_b1};
        end
    end
    
    //========================================================================
    // Stage 4: 高 8 位加法
    //========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sum_b3 <= 9'd0;
        end else if (pipe_cnt == 4'd4) begin
            sum_b3 <= {1'b0, op_a[31:24]} + {1'b0, op_b[31:24]} + {9'd0, carry_b2};
        end
    end
    
    //========================================================================
    // Stage 5: 输出
    //========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            acc_valid <= 1'b0;
            acc_data  <= 24'd0;
            acc_carry <= 1'b0;
        end else if (pipe_cnt == 4'd5) begin
            acc_valid <= 1'b1;
            acc_data  <= {sum_b2, sum_b1, sum_b0};
            
            if (op_mode == 1'b1 && carry_sticky) begin
                acc_carry <= 1'b1;
            end else if (sum_b3 != 9'd0) begin
                acc_carry <= 1'b1;
            end else begin
                acc_carry <= 1'b0;
            end
        end else begin
            acc_valid <= 1'b0;
        end
    end

endmodule