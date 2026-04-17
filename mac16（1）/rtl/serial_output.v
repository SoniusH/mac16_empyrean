`timescale 1ns/1ps

module serial_output (
    input wire clk,
    input wire rst_n,
    input wire acc_valid,
    input wire [23:0] acc_data,
    input wire acc_carry_in,
    
    
    output wire sum_out,
    output reg out_ready,
    output reg carry_out
);
    reg [23:0] out_shift;
    reg [4:0] out_cnt;
    reg out_busy;

    assign sum_out = out_busy ? out_shift[23] : acc_data[23];
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out_shift <= 24'd0;
            out_cnt   <= 5'd0;
            out_ready <= 1'b0;
            out_busy  <= 1'b0;
            carry_out <= 1'b0;
        end else begin
            
            if (!out_busy && acc_valid) begin
                out_shift <= acc_data;
                out_busy  <= 1'b1;
                out_cnt   <= 5'd0;
                out_ready <= 1'b1;
                carry_out <= acc_carry_in;
            end
            
            if (out_busy) begin
                if (out_cnt < 5'd23) begin
                    out_shift <= {out_shift[22:0], 1'b0};
                    out_cnt   <= out_cnt + 5'd1;
                end else begin
                    out_busy  <= 1'b0;
                    out_ready <= 1'b0;
                end
            end
        end
    end
    
endmodule