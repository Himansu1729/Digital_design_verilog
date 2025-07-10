`timescale 1ns/1ps

module tb_serial_adder;
    reg clk, rst;
    reg [3:0] a_in, b_in;
    wire [3:0] result;
    wire done;
    wire sum_bit;

    reg a_bit, b_bit;
    reg [3:0] a_shift, b_shift;

    integer i;

    serial_adder uut (
        .clk(clk),
        .rst(rst),
        .a(a_bit),
        .b(b_bit),
        .sum_bit(sum_bit),
        .result(result),
        .done(done)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("serial_adder.vcd");
        $dumpvars(0, tb_serial_adder);

        clk = 0;
        rst = 1;
        a_in = 4'b1011; // 11
        b_in = 4'b0101; // 5
        a_shift = a_in;
        b_shift = b_in;

        #10 rst = 0;

        for (i = 0; i < 4; i = i + 1) begin
            a_bit = a_shift[0];
            b_bit = b_shift[0];
            a_shift = a_shift >> 1;
            b_shift = b_shift >> 1;
            #10;
        end

        #20;
        $display("Sum = %b", result);  // Expected: 0000_0000 + 0000_0000 = result[3:0]
        $finish;
    end
endmodule
