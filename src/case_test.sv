module case_test (A,B,C,D,S,Y,clk,reset);

  input clk,reset;
  input [7:0] A, B, C, D;
  input [1:0] S;
  output reg [7:0] Y;

always@(posedge clk)
    begin
        case (S)
            0: Y = A;
            1: Y = B;
            2: Y = C;
            3: Y = D;//o cambiar por default
        endcase
    end
endmodule
