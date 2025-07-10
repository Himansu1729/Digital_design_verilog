module decoder(out, in, select);
    input in;
    input [0:1]select;
    output [0:3];

    assign out[select]=in;
endmodule