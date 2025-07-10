module adder_subtractor(in1,in2,mode,out,carry);
    input [3:0]in1,in2;
    input mode;
    output [3:0] out;
    output carry;
    wire [3:0]b;
    wire [2:0]c;

    xor G1(b[0],in2[0],mode);
    xor G2(b[1],in2[1],mode);
    xor G3(b[2],in2[2],mode);
    xor G4(b[3],in2[3],mode);
    full_adder inst1(in1[0],b[0],mode,out[0],c[0]);
    full_adder inst2(in1[1],b[1],c[0],out[1],c[1]);
    full_adder inst3(in1[2],b[2],c[1],out[2],c[2]);
    full_adder inst4(in1[3],b[3],c[2],out[3],carry);
endmodule

