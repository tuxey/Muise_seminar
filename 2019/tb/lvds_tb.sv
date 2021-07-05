`timescale 1 ps/ 1 ps
`include "vunit_defines.svh"
module lvds_tb;

// test vector input registers
reg [1:0] rx_in_sig=0;
reg [15:0] rx_out_sig=0;
reg rx_inclock_sig=0;
reg rx_outclock_sig=0;

// assign statements (if any)
lvds_adc	lvds_adc_inst (
	.rx_in ( rx_in_sig ),
	.rx_inclock ( rx_inclock_sig ),
	.rx_out ( rx_out_sig ),
	.rx_outclock ( rx_outclock_sig )
	);

`TEST_SUITE begin
   // It is possible to create a basic test bench without any test cases
   $display("case_tb");

// code that executes only once
// insert code here --> begin
$display("Running testbench");
$monitor("%g rx_in_sig = %b rx_out_sig = %b rx_outclock_sig = %b", $time, rx_in_sig, rx_out_sig, rx_outclock_sig);

#80000

// `CHECK_EQUAL(Y, D);
// $finish;
$display("End testbench");
end

always #400 rx_in_sig = ~rx_in_sig;
always #50 rx_inclock_sig = ~rx_inclock_sig;

endmodule
