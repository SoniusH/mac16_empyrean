`timescale 1ns/1ps

module shift_input (
    
    input wire clk,
    input wire rst_n,
    input wire in_ready,
    input wire inA,
    input wire inB,
    input wire mode,
    
    output reg [32:0] shift_data,
    output reg data_ready
);
    reg [15:0] shift_a;
    reg [15:0] shift_b;
    reg shift_mode;
    
    reg [4:0] bit_cnt;
    reg loading;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_data <= 33'd0;
            data_ready <= 1'b0;
            shift_a <= 16'd0;
            shift_b <= 16'd0;
            shift_mode <= 1'b0;
            bit_cnt <= 5'd0;     
            loading <= 1'b0;
        end else begin
            if (!loading && in_ready) begin
                loading <= 1'b1;
                bit_cnt <= 5'd1;
                shift_a <= {15'd0, inA};
                shift_b <= {15'd0, inB};
                shift_mode <= mode;
            end 


            else if (loading && in_ready && bit_cnt < 5'd16) begin
                if (in_ready) begin
                    shift_a <= {shift_a[14:0], inA};
                    shift_b <= {shift_b[14:0], inB};
                    bit_cnt <= bit_cnt + 5'd1;
                end
            end


            else if (loading && bit_cnt == 5'd16) begin
                loading <= 1'b0;
                data_ready <= 1'b1;
                shift_data <= {shift_mode, shift_b, shift_a};
                bit_cnt <= bit_cnt + 5'd1;
            end

            if (bit_cnt == 5'd17) begin
                data_ready <= 1'b0;
                bit_cnt <= 5'd0;
            end
        end
    end
endmodule