module testbench;
    reg [15:0]A, B;
    wire lt, gt, eq;
    n_bit_comparator DUT(A,B,lt,gt,eq);

    initial begin 
        $dumpfile("compare.vcd");
        $dumpvars(0, testbench);
        $monitor($time, " A =%h, B= =%h, lt=%b, gt = %b, eq=%b", A, B, lt, gt, eq);
        #5 A= 16'h0000;B= 16'h0001;
        #5 A= 16'hff00;B= 16'hffff;
        #5 A= 16'h1001;B= 16'h1001;
        #5 A= 16'hb000;B= 16'ha019;
        #5 $finish;
    end
endmodule