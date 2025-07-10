module mux2to1(a,b,sel,y);
	input a,b,sel;
	output y;
	wire y,t1,t2;
	
	and G1(t1,a,~sel);
	and G2(t2,b,sel);
	or G3(y, t1,t2);
endmodule

module mux4to1(in,sel,out);
	input [3:0] in;
	input [1:0] sel;
	output out;
	wire out,t1,t2;
	
	mux2to1 inst1(in[0],in[1],sel[0],t1);
	mux2to1 inst2(in[2],in[3],sel[0],t2);
	mux2to1 inst3(t1,t2,sel[1],out);
endmodule

module mux16to1(in,sel,out);
	input [15:0] in;
	input [3:0] sel;
	output out;
	wire out;
	wire [3:0] t;
	
	mux4to1 inst4 (in[3:0],sel[1:0],t[0]);
	mux4to1 inst5 (in[7:4],sel[1:0],t[1]);
	mux4to1 inst6 (in[11:8],sel[1:0],t[2]);
	mux4to1 inst7 (in[15:12],sel[1:0],t[3]);
	mux4to1 inst8 (t,sel[3:2],out);
endmodule
