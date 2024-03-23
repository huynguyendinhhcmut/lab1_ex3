module lab1_ex3 (
	input logic [0:0] EA, EB, clk, rst,
	input logic [7:0] a, 
	output logic [15:0] P
);

wire [7:0] A, B;
wire [15:0] H;
	
D_FF8b dff8b0 (.clk(clk), .rst(rst), .enable(EA), .data_i(a), .data_o(A));
D_FF8b dff8b1 (.clk(clk), .rst(rst), .enable(EB), .data_i(a), .data_o(B));
mul88 mul881 (.a(A), .b(B), .cin(1'b0), .mul(H));
D_FF16b (.clk(clk), .rst(rst), .data_i(H), .data_o(P));
endmodule	