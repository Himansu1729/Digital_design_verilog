module adder_test;
	reg[3:0] A,B;
	reg cin;
	wire [3:0] out;
	wire cout;
	four_bit_carry_lookahead_adder DUT(A,B,cin,out,cout);
	
	initial begin
		$dumpfile("adder.vcd");
		$dumpvars(0,adder_test);
		$monitor($time, "A=%h,B=%h,cin=%b,out=%h,cout=%b",A,B,cin,out,cout);
		#5
		A= 4'hA;B=4'hB;cin=1'b0;
		#5
		A= 4'hF;B=4'h1;cin=1'b0;
                #5
		A= 4'h8;B=4'h9;cin=1'b0;
                #5
		$finish;
	end
endmodule	
