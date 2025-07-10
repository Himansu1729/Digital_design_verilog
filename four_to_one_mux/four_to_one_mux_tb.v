`timescale 1ns/100ps;
module four_to_one_mux_tb;

	reg [3:0] i;
	reg [1:0] s;
	wire y;
	
	four_to_one_mux dut(
		.i(i),
		.s(s),
		.y(y)
	);

	initial begin
	$dumpfile("test_four_to_one_mux.vcd");
	$dumpvars(0,four_to_one_mux_tb);
	i = 4'b0001; s = 2'b00; #10;  // Expect y = i[0]
        i = 4'b0010; s = 2'b00; #10;  // Expect y = i[0]
        i = 4'b0010; s = 2'b01; #10;  // Expect y = i[1]
        i = 4'b1000; s = 2'b10; #10;  // Expect y = i[2]
        i = 4'b1000; s = 2'b11; #10;  // Expect y = i[3]
        
        // Try more combinations
        i = 4'b1111; s = 2'b00; #10;
        i = 4'b1010; s = 2'b01; #10;
        i = 4'b1100; s = 2'b10; #10;
        i = 4'b0110; s = 2'b11; #10;
	$finish;
	end
endmodule
