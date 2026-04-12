`timescale 1ns/1ps
module mac8_dualmode #(
    parameter ACCW = 32               
)(
    input  wire             clk,
    input  wire             rst_n,    
    input  wire             clr,      
    input  wire             mode,     
    input  wire [7:0]       a,
    input  wire [7:0]       b,
    output reg  [15:0]      sum_out
);

    wire [15:0]  prod = a * b;          
    reg  [15:0]  prev_prod;   
    reg  [15:0]  acc_reg;     

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            prev_prod <= 16'd0;
            acc_reg   <= 16'd0;
            sum_out   <= 16'd0;
        end
        else begin
            
            if (mode == 1'b0) begin        
                sum_out   <= prev_prod + prod;  
                prev_prod <= prod;
               
            end
            else begin                     
                if (clr) begin             
                    acc_reg <= 16'd0;
                    sum_out <= 16'd0;
                end
                else begin
                    acc_reg <= acc_reg + prod;
                    sum_out <= acc_reg + prod;  
                end
               
                prev_prod <= prod;
            end
        end
    end

endmodule

