module gcd_datapath(
    input clk,
    input start,
	input [9:0]A,
	input [9:0]B,
	input [1:0]edit_num,
	input get_res,
	output reg [1:0]compare,
	output reg [9:0] out
);
reg [9:0]a;
reg [9:0]b;

always @(posedge clk) begin
    if(start) begin
	    compare = 0;
		out = 0;
        a <= A;
        b <= B;
	end
	else
	    if(a == 0 || b == 0)out = (a > b)? a:b; 
	else begin
	    if(a == b) begin
        compare <= 1;
		if(get_res == 1)out <= a;
		end
        else begin
            if(a > b)begin
                compare <= 2;	
                if(edit_num == 1) a <= a - b;				
			end
			else begin			    
			    compare <= 3;
				if(edit_num == 2) b <= b - a;
			end	
        end	     		
	end
end
endmodule