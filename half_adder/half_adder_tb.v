`timescale 1ns/100ps
module half_adder_tb;

	reg a, b;
	wire s, c;
	half_adder u0_DUT( .a(a),.b(b),.s(s),.c(c));

	initial begin
	$dumpfile("test_half_adder.vcd");
	$dumpvars(0,half_adder_tb);
	a=1'b0;
	b=1'b0;
	#5 b=1'b1;
	#5 a=1'b1;
	#5 b=1'b0;
	#5 $finish;
	end;
endmodule
