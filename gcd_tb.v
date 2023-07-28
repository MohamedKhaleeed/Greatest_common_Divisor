module gcd_tb;
parameter clk_period = 10ns;
parameter [2:0] wait_start = 3'd0,
                check_equal = 3'd1,
				check_greater = 3'd2,
				check_A = 3'd3,
				check_B = 3'd4,
				get_result = 3'd5;
reg clk_tb = 0;
always #(clk_period/2) clk_tb = ~clk_tb;

reg rst_tb;
reg start_tb;
reg [9:0]A_tb;
reg [9:0]B_tb;
reg [9:0]out_tb;

gcd_top dut(
    .clk(clk_tb),
	.rst(rst_tb),
	.start(start_tb),
	.A(A_tb),
	.B(B_tb),
	.out(out_tb)
);

task find_gcd(
    input reg [9:0]A,
	input reg [9:0]B
);
    rst_tb = 1;
	#(clk_period);
    rst_tb = 0;
	A_tb = A;
	B_tb = B;
	start_tb = 1;
	#(clk_period);
	start_tb = 0;
	while(out_tb == 0)
	#(clk_period);
	$display("the gcd is %d",out_tb);
	
endtask

initial begin
    find_gcd(100,75);
    find_gcd(400,300);
    find_gcd(0,20);

    $finish();
end

endmodule