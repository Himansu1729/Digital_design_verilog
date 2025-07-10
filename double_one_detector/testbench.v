module testbench;
    reg clk, in, reset;
    wire out;
    double_one_detector DUT(clk, in , reset, out);

    initial
        begin
            $dumpfile("mealy_fsm.vcd");
            $dumpvars(0, testbench);
            $monitor($time, " in = %b, reset = %b, out = %b", in , reset, out);
            clk = 1'b0; reset = 1'b1;
            #15  reset = 1'b0;
        end

    always #5 clk= ~clk;
    initial
        begin
            #12 in =0 ;#10 in=1; #10 in = 0; #10 in = 1; #10 in = 1;#10 in = 1;
            #10 in=0; #10 in = 0; #10 in = 0; #10 in = 1;#10 in = 0;
            #10 in =0 ;#10 in=1; #10 in = 0; #10 in = 1; #10 in = 1;#10 in = 1;
            #10 $finish;
        end
endmodule
