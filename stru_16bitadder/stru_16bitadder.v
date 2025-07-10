module full_adder(a,b,cin,sum,cout);
	input a,b,cin;
	output sum,cout;
	wire [2:0]t;

	xor G1(sum,a,b,cin);
	and G2(t[0],a,b);
	and G3(t[1],a,cin);
	and G4(t[2],b,cin);
	or G5(cout, t[0],t[1],t[2]);
endmodule

module four_bit_adder(in1,in2,cin,out,cout);
	input [3:0] in1,in2;
	input cin;
	output [3:0] out;
	output cout;
	wire [2:0]c;
	
	full_adder inst1(in1[0],in2[0],cin,out[0],c[0]);
	full_adder inst2(in1[1],in2[1],c[0],out[1],c[1]);
	full_adder inst3(in1[2],in2[2],c[1],out[2],c[2]);
	full_adder inst4(in1[3],in2[3],c[2],out[3],cout);
endmodule

module stru_16bitadder(in1,in2,out,sign,carry, zero, overflow);
	input [15:0] in1,in2;
	output [15:0] out;
	output sign, carry, zero, overflow;
	wire [2:0]c;
	
	four_bit_adder inst1(in1[3:0],in2[3:0],1'b0,out[3:0],c[0]);
	four_bit_adder inst2(in1[7:4],in2[7:4],c[0],out[7:4],c[1]);
	four_bit_adder inst3(in1[11:8],in2[11:8],c[1],out[11:8],c[2]);
	four_bit_adder inst4(in1[15:12],in2[15:12],c[2],out[15:12],carry);
	
	assign sign = out[15];
	assign zero = ~|out;
	assign overflow = (in1[15] & in2[15] & ~out[15])|(~in1[15] & ~in2[15] & out[15]);
endmodule



	

