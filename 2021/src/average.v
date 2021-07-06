module average
  #(parameter G_DATA_SIZE = 10)
   (
     input clk,
     input reset,
     input [G_DATA_SIZE-1:0] a_in,
     input [G_DATA_SIZE-1:0] b_in,
     output reg [G_DATA_SIZE-1:0] avg_out
   );

  reg [G_DATA_SIZE-1:0] s_a_in;
  reg [G_DATA_SIZE-1:0] s_b_in;
  reg [G_DATA_SIZE:0] s_avg_out;

  always @(posedge clk)
  begin
    if (reset)
      s_avg_out <= {G_DATA_SIZE{1'b0}};
    else
    begin
      s_a_in <= a_in;
      s_b_in <= b_in;
      s_avg_out <= s_a_in + s_b_in; // sum
      avg_out <= s_avg_out >> 1; // average by dividing by 2 = shift 1 bit to the right
    end
  end

endmodule

