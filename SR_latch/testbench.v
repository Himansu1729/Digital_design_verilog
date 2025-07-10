module testbench;
    reg S,R;
    wire Q, Qbar;
    SR_latch DUT(Q,Qbar,S,R);

    initial begin
        $dumpfile("latch.vcd");
        $dumpvars(0,testbench);
        $monitor($time, " S=%b,R=%b, Q=%b, Qbar=%b", S,R,Q,Qbar);
        S=1'b0;R=1'b1;
        #5 S=1'b1;R=1'b1;
        #5 S=1'b1;R=1'b0;
        #5 S=1'b1;R=1'b1;
        // #5 S=1'b0;R=1'b0; //move into infinite loop
        #5 S=1'b1;R=1'b1;
        #5 $finish;
    end
endmodule