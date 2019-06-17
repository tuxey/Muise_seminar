module if_else_test (clk,reset,A, B, C, D,Y,S);

    input clk,reset;
    input [7:0] A, B, C, D;
    input [1:0] S;
    output reg [7:0] Y;

always@(posedge clk)
begin
    if (reset)
    begin
        Y<=0;
    end
    else begin
	if (S == 0)
	begin
		Y <= A;
	end
	else if(S == 1) begin
		Y <= B;
	end
	else if(S == 2) begin
		Y <= C;
	end
	else begin
		Y <= D;
	end
end
end
endmodule
