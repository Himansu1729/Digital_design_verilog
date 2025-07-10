module serial_adder (
    input clk,
    input rst,
    input a,
    input b,
    output reg sum_bit,
    output reg [3:0] result,
    output reg done
);
    reg carry;
    reg [1:0] count;  // For 4-bit numbers, count 0 to 3

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            carry <= 0;
            count <= 0;
            result <= 0;
            done <= 0;
        end else begin
            if (!done) begin
                {carry, sum_bit} <= a + b + carry;
                result[count] <= sum_bit;
                count <= count + 1;
                if (count == 3)
                    done <= 1;
            end
        end
    end
endmodule
