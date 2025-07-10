module four_to_one_mux(
	input [3:0] i,
	input [1:0] s,
	output y
);
	wire s1,s2;
	
	multiplexer_2_1 inst1(.a(i[0]), .b(i[1]), .s(s[1]), .y(s1));
	multiplexer_2_1 inst2(.a(i[2]), .b(i[3]), .s(s[1]), .y(s2));
	multiplexer_2_1 inst3(.a(s1), .b(s2), .s(s[0]), .y(y));
endmodule
