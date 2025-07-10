module beh_16bitadder(in1,in2,out,sign,zero,carry,parity,overflow);
	input [15:0] in1,in2;
	output [15:0] out;
	output sign, zero, carry, parity, overflow;
	
	assign {carry,out} = in1 + in2;
	assign sign = out[15];
	assign zero = ~|out;
	assign parity = ~^out;
	assign overflow = (in1[15] & in2[15] & ~out[15])|(~in1[15] & ~in2[15] 
			& out[15]);
endmodule
