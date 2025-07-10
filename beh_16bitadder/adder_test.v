module adder_test;
	reg [15:0]A,B;
	wire [15:0] out;
	wire sign, zero, carry, parity, overflow;
	beh_16bitadder DUT(A,B,out, sign, zero, carry, parity, overflow);

	initial begin
		$dumpfile("adder.vcd");
		$dumpvars(0,adder_test);
		$monitor($time, "A=%h,B=%h,out=%h,sign=%b,zero=%b,carry=%b,parity=%b,overflow=%b",A,B,out, sign, zero, carry, parity, overflow);
		#5
		A=16'h8fff;B=16'h8000;
		#5
		A=16'hfffe;B=16'h0002;
		#5
		A=16'hAAAA;B=16'h5555;
		#5
		$finish;
	end
endmodule
