module multiplier (
    input  wire         clk,
    input  wire         rst_n,
    input  wire [32:0]  mult_data,
    input  wire         empty,
    output reg          rd_en,
    output reg          mult_done,
    output reg  [31:0]  product,
    output reg          prod_mode
);

    //========================================================================
    // 数据解析
    //========================================================================
    wire        mode_in;
    wire [15:0] a_in;
    wire [15:0] b_in;
    
    assign {mode_in, b_in, a_in} = mult_data;
    
    //========================================================================
    // 状态机
    //========================================================================
    localparam IDLE         = 4'd0;
    localparam LOAD_A       = 4'd1;
    localparam CALC_3A_LOW  = 4'd2;
    localparam CALC_3A_HIGH = 4'd3;
    localparam CALC_P1      = 4'd4;
    localparam CALC_P2      = 4'd5;
    localparam CALC_P3      = 4'd6;
    localparam CALC_P4      = 4'd7;
    localparam DONE         = 4'd8;
    
    reg [3:0] state, next_state;
    
    //========================================================================
    // 忙标志
    //========================================================================
    reg mult_busy;
    
    //========================================================================
    // 迭代计数
    //========================================================================
    reg [2:0] iter_cnt;
    
    //========================================================================
    // 操作数寄存器 - 18位防止3A溢出
    //========================================================================
    reg [17:0] A_reg;      // A
    reg [17:0] A2_reg;     // 2A
    reg [17:0] A3_reg;     // 3A
    reg [15:0] B_shift;
    reg        mode_reg;
    
    //========================================================================
    // 3A计算分片寄存器
    //========================================================================
    reg  [8:0] a_low;      // A的低9位 (bit 8:0)
    reg  [8:0] a2_low;     // 2A的低9位
    reg  [8:0] a_high;     // A的高9位 (bit 17:9)
    reg  [8:0] a2_high;    // 2A的高9位
    reg        carry_3a_low; // 低9位加法的进位
    
    //========================================================================
    // 18位扩展
    //========================================================================
    wire [17:0] A_ext  = {2'b0, a_in};        // 18位：A
    wire [17:0] A2_ext = {1'b0, a_in, 1'b0};  // 18位：2A
    
    //========================================================================
    // 部分积选择 - 18位
    //========================================================================
    reg [17:0] pp_selected;
    wire [1:0] b_sel = B_shift[1:0];
    
    always @(*) begin
        case (b_sel)
            2'd0:    pp_selected = 18'd0;
            2'd1:    pp_selected = A_reg;
            2'd2:    pp_selected = A2_reg;
            2'd3:    pp_selected = A3_reg;
            default: pp_selected = 18'd0;
        endcase
    end
    
    //========================================================================
    // 移位后的部分积 - 32位
    //========================================================================
    wire [31:0] pp_shifted;
    
    // 根据迭代次数左移部分积
    assign pp_shifted = {14'd0, pp_selected} << (iter_cnt * 2);
    
    //========================================================================
    // 累加器 - 拆分为4个8位分片
    //========================================================================
    reg  [7:0] acc_low;      // 累加器 bit 7:0
    reg  [7:0] acc_mid;      // 累加器 bit 15:8
    reg  [7:0] acc_high;     // 累加器 bit 23:16
    reg  [7:0] acc_top;      // 累加器 bit 31:24
    
    // 累加器组合成32位（用于最终输出）
    wire [31:0] accumulator = {acc_top, acc_high, acc_mid, acc_low};
    
    //========================================================================
    // 部分积分片 - 4个8位
    //========================================================================
    wire [7:0] pp_byte0 = pp_shifted[7:0];
    wire [7:0] pp_byte1 = pp_shifted[15:8];
    wire [7:0] pp_byte2 = pp_shifted[23:16];
    wire [7:0] pp_byte3 = pp_shifted[31:24];
    
    //========================================================================
    // 累加进位寄存器
    //========================================================================
    reg carry_p1_p2;  // byte0 加到 byte1 的进位
    reg carry_p2_p3;  // byte1 加到 byte2 的进位
    reg carry_p3_p4;  // byte2 加到 byte3 的进位
    
    //========================================================================
    // 下一迭代预计算
    //========================================================================
    wire [15:0] B_shift_next = {2'b0, B_shift[15:2]};
    wire [2:0]  iter_cnt_next = iter_cnt + 3'd1;
    wire        is_last_iter = (iter_cnt == 3'd7);
    
    //========================================================================
    // 状态转移
    //========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end
    
    always @(*) begin
        next_state = state;
        case (state)
            IDLE:         if (!empty) next_state = LOAD_A;
            LOAD_A:       next_state = CALC_3A_LOW;
            CALC_3A_LOW:  next_state = CALC_3A_HIGH;
            CALC_3A_HIGH: next_state = CALC_P1;
            CALC_P1:      next_state = CALC_P2;
            CALC_P2:      next_state = CALC_P3;
            CALC_P3:      next_state = CALC_P4;
            CALC_P4:      next_state = is_last_iter ? DONE : CALC_P1;
            DONE:         next_state = IDLE;
            default:      next_state = IDLE;
        endcase
    end
    
    //========================================================================
    // mult_busy 和 rd_en 逻辑
    //========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mult_busy <= 1'b0;
        end else begin
            case (state)
                IDLE: mult_busy <= !empty;
                DONE: mult_busy <= 1'b0;
                default: mult_busy <= mult_busy;
            endcase
        end
    end
    
    always @(*) begin
        rd_en = (state == IDLE && !empty);
    end
    
    //========================================================================
    // 数据通路 - 修正 acc_top 更新时序
    //========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            A_reg    <= 18'd0;
            A2_reg   <= 18'd0;
            A3_reg   <= 18'd0;
            B_shift  <= 16'd0;
            mode_reg <= 1'b0;
            iter_cnt <= 3'd0;
            
            acc_low  <= 8'd0;
            acc_mid  <= 8'd0;
            acc_high <= 8'd0;
            acc_top  <= 8'd0;
            
            mult_done <= 1'b0;
            product  <= 32'd0;
            prod_mode <= 1'b0;
            
            a_low  <= 9'd0;
            a2_low <= 9'd0;
            a_high <= 9'd0;
            a2_high <= 9'd0;
            carry_3a_low <= 1'b0;
            
            carry_p1_p2 <= 1'b0;
            carry_p2_p3 <= 1'b0;
            carry_p3_p4 <= 1'b0;
        end else begin
            
            mult_done <= 1'b0;
            
            case (state)
                IDLE: begin
                    iter_cnt <= 3'd0;
                    acc_low  <= 8'd0;
                    acc_mid  <= 8'd0;
                    acc_high <= 8'd0;
                    acc_top  <= 8'd0;
                    carry_p1_p2 <= 1'b0;
                    carry_p2_p3 <= 1'b0;
                    carry_p3_p4 <= 1'b0;
                end
                
                LOAD_A: begin
                    // 加载操作数，同时准备好分片数据
                    A_reg    <= A_ext;
                    A2_reg   <= A2_ext;
                    B_shift  <= b_in;
                    mode_reg <= mode_in;
                    
                    // 准备3A计算的分片
                    a_low   <= A_ext[8:0];
                    a2_low  <= A2_ext[8:0];
                    a_high  <= A_ext[17:9];
                    a2_high <= A2_ext[17:9];
                end
                
                CALC_3A_LOW: begin
                    // 第一步：计算低9位加法，产生进位
                    {carry_3a_low, A3_reg[8:0]} <= {1'b0, a_low} + {1'b0, a2_low};
                end
                
                CALC_3A_HIGH: begin
                    // 第二步：计算高9位加法，加上低位的进位
                    A3_reg[17:9] <= {1'b0, a_high} + {1'b0, a2_high} + {8'd0, carry_3a_low};
                end
                
                //========================================================================
                // 4级流水线累加：每个周期做一个8位加法
                //========================================================================
                CALC_P1: begin
                    // Byte 0: acc_low + pp_byte0，产生进位给下一级
                    {carry_p1_p2, acc_low} <= {1'b0, acc_low} + {1'b0, pp_byte0};
                end
                
                CALC_P2: begin
                    // Byte 1: acc_mid + pp_byte1 + 上一级进位
                    {carry_p2_p3, acc_mid} <= {1'b0, acc_mid} + {1'b0, pp_byte1} + {8'd0, carry_p1_p2};
                end
                
                CALC_P3: begin
                    // Byte 2: acc_high + pp_byte2 + 上一级进位
                    {carry_p3_p4, acc_high} <= {1'b0, acc_high} + {1'b0, pp_byte2} + {8'd0, carry_p2_p3};
                end
                
                CALC_P4: begin
                    // Byte 3: acc_top + pp_byte3 + 上一级进位
                    {acc_top} <= acc_top + pp_byte3 + {7'd0, carry_p3_p4};  
                    
                    if (!is_last_iter) begin
                        B_shift <= B_shift_next;
                        iter_cnt <= iter_cnt_next;
                    end
                end
                
                DONE: begin
                    product   <= {acc_top, acc_high, acc_mid, acc_low};
                    prod_mode <= mode_reg;
                    mult_done <= 1'b1;
                end
            endcase
        end
    end

endmodule