module testbench;
    wire [7:0]alu_out;
    reg [7:0]A,B;
    reg[2:0]operation;
    reg en;
    ALU DUT(alu_out, A,B,operation,en);
    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, testbench);
        $monitor($time," alu_out=%h, A=%h,B=%h, operation= %b,en=%b",alu_out, A,B,operation,en);
        #5 A=8'h11;B=8'hff;operation = 3'b000;en=1;
        #5 A=8'h11;B=8'hff;operation = 3'b000;en=0;
        #5 A=8'ha9;B=8'h90;operation = 3'b001;en=1;
        #5 A=8'h11;B=8'hff;operation = 3'b011;en=1;
        #5 $finish;
    end
endmodule
