module mux_test;
	reg [15:0] A;
	reg [3:0] s;
	wire y;
	mux16to1 DUT(A,s,y);
	
	initial begin
		$dumpfile("mux.vcd");
		$dumpvars(0,mux_test);
		$monitor($time, "A=%h, s=%h, y=%b", A, s, y);
		#5
		A = 16'hC0F0;s=4'h0;
		#5
		s=4'hF;
		#5
		s=4'h5;
		#5
		s=4'h9;
		#5
		s=4'hA;
		#5
		$finish;
	end
endmodule
