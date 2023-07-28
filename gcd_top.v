module gcd_top(
    input clk,
	input rst,
	input start,
	input [9:0]A,
	input [9:0]B,
    output [9:0]out
);
wire get_res;
wire [1:0] compare,edit_num;

gcd_controller controller (
    .clk(clk),
	.rst(rst),
	.start(start),
	.edit_num(edit_num),
	.compare(compare),
	.get_res(get_res)
);

gcd_datapath datapath(
    .clk(clk),
	.start(start),
	.A(A),
	.B(B),
	.edit_num(edit_num),
	.compare(compare),
	.get_res(get_res),
	.out(out)
);

endmodule