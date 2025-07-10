module testbench;
    reg[7:0] in;
    wire [2:0] out;
    priority_encoder DUT(in, out);

    initial 
        begin   
            $dumpfile("pri_en.vcd");
            $dumpvars(0, testbench);
            $monitor($time, " in = %h, out= %h", in , out);
            #5 in = 8'h16;
            #5 in = 8'h00;
            #5 in = 8'hff;
            #5 in = 8'h0e;
            #5 $finish;
    end
endmodule