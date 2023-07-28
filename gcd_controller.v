module gcd_controller(
    input clk,
	input rst,
	input start,
	input [1:0]compare,
	output reg [1:0]edit_num,
	output reg get_res
);

reg [2:0] curr_state, next_state;
parameter [2:0] wait_start = 3'd0,
                check_equal = 3'd1,
				check_greater = 3'd2,
				check_A = 3'd3,
				check_B = 3'd4,
				get_result = 3'd5;

always @(posedge clk) begin
    if(rst)begin
        curr_state = wait_start;		
	end
	else begin
	    curr_state = next_state;
	end
end

always @(*) begin
    edit_num = 0;
	get_res = 0;
	
	case(curr_state)
	
	wait_start: begin
	    if(start == 0) next_state = wait_start;
	    else next_state = check_equal;
	end
	
	check_equal: begin
     	if(compare == 1) next_state = get_result; 
        else next_state = check_greater;	
	end
	
	check_greater: begin
		if(compare == 2) 
		next_state = check_A;
        else if(compare == 3) 
		next_state = check_B;		
	end
	
	check_A: begin
	    edit_num = 1;
        next_state = check_equal;	
	end
	
	check_B: begin
	    edit_num = 2;
        next_state = check_equal;	
	end
	
	get_result: begin
	    get_res = 1;
		next_state = wait_start;
	end
	endcase
end
endmodule