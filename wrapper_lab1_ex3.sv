module wrapper_lab1_ex3 (
	input logic [9:0] SW, KEY,
	output logic [9:0] LEDR,
	output logic [6:0] HEX0, HEX1, HEX2
);

assign LEDR[9:8] = SW[9:8];

wire [7:0] A;
wire [15:0] p;

lab1_ex3 lab1ex3 (.EA(SW[9]), .EB(SW[8]), .rst(KEY[0]), .clk(KEY[1]), .a(A), .P(p), .outled(LEDR[7:0]));

display_hex displayhex0 (.data_in(p[3:0]), .display_out(HEX0));
display_hex displayhex1 (.data_in(p[7:4]), .display_out(HEX1));
display_hex displayhex2 (.data_in(p[15:8]), .display_out(HEX2));

endmodule