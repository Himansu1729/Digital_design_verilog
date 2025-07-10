module testbench;
    reg clk, in, reset;
    wire out;
    sequence_detector DUT(in, clk, reset, out);

    initial
        begin
            $dumpfile("fsm.vcd");
            $dumpvars(0, testbench);
            clk = 1'b0; reset = 1'b1;
            #15  reset = 1'b0;
        end

    always #5 clk= ~clk;
    
    always 
        begin
            #10
            $display($time, " in = %b, reset = %b, out = %b", in , reset, out);
    end
    initial
        begin
            #12 in =0 ;#10 in=0; #10 in = 1; #10 in = 1; #10 in = 0;#10 in = 1;
            #10 in=1; #10 in = 0; #10 in = 0; #10 in = 1;#10 in = 1;
            #10 in =0 ;#10 in=1; #10 in = 1; #10 in = 0; #10 in = 1;#10 in = 1;#10 in =0;
            #10 $finish;
        end
endmodule