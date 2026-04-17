module input_mult_fifo #(
    parameter DATA_WIDTH = 33,
    parameter FIFO_DEPTH = 8
) (
    input wire clk,
    input wire rst_n,
    
    input wire wr_en,
    input wire [DATA_WIDTH-1:0] wr_data,
    output wire full,
    
    input wire rd_en,
    output reg [DATA_WIDTH-1:0] rd_data,
    output wire empty
);

    localparam ADDR_WIDTH = $clog2(FIFO_DEPTH);
    localparam PTR_WIDTH  = ADDR_WIDTH + 1;
    
    reg [DATA_WIDTH-1:0] mem [0:FIFO_DEPTH-1];
    reg [PTR_WIDTH-1:0] wr_ptr;
    reg [PTR_WIDTH-1:0] rd_ptr;
    
    wire [ADDR_WIDTH-1:0] wr_addr = wr_ptr[ADDR_WIDTH-1:0];
    wire [ADDR_WIDTH-1:0] rd_addr = rd_ptr[ADDR_WIDTH-1:0];
    
    assign empty = (wr_ptr == rd_ptr);
    assign full = (wr_ptr[PTR_WIDTH-1] != rd_ptr[PTR_WIDTH-1]) &&
                (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);
    
    integer i;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= {PTR_WIDTH{1'b0}};
            for (i = 0; i < FIFO_DEPTH; i = i + 1) begin
                mem[i] <= {DATA_WIDTH{1'b0}};
            end
        end else begin
            if (wr_en && !full) begin
                mem[wr_addr] <= wr_data;
                wr_ptr <= wr_ptr + 1'b1;
            end
        end
    end
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rd_ptr <= {PTR_WIDTH{1'b0}};
            rd_data <= {DATA_WIDTH{1'b0}};
        end else begin
            if (rd_en && !empty) begin
                rd_data <= mem[rd_addr];
                rd_ptr <= rd_ptr + 1'b1;
            end
        end
    end

endmodule