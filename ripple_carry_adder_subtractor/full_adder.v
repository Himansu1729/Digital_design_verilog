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