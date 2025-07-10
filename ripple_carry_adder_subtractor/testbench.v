module testbench;
	reg [3:0]A,B;
	wire [3:0] out;
    reg mode;
	adder_subtractor DUT(A,B,mode,out,carry);

	initial begin
		$dumpfile("adder_subtractor.vcd");
		$dumpvars(0,testbench);
		$monitor($time, "A=%h,B=%h,mode = %b,out=%h,carry=%b",A,B,mode,out,carry);
		#5
		A=4'ha;B=4'h8;mode=1'b1;
		#5
		A=4'h0;B=14'h0;mode=1'b0;
		#5
		A=4'h9;B=16'h6;mode=1'b0;
		#5
        A=4'hf;B=16'ha;mode=1'b1;
		#5
        A=4'h1;B=16'h8;mode=1'b1;
        #5
		$finish;
	end
endmodule
