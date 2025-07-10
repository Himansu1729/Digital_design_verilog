//We are going to detect "11" here. So we are going to 
// implement a mealy type fsm.
module double_one_detector(clk, in, reset, out);
    input in, reset, clk;
    output reg out;
    reg present_st,next_st, data;
    parameter s0=1'b0, s1=1'b1;

    always @(posedge clk or posedge reset)
        if(reset) 
            begin
                present_st <= s0;
                out <= 1'b0;
            end
        else 
            begin
                present_st <= next_st;
                out <= data;
            end
    
    always @(present_st, in)
        case(present_st)
            s0: begin
                data = in ? 0:0;
                next_st = in ? s1:s0;
            end
            s1: begin
                data = in ? 1:0;
                next_st = in ? s1:s0;
            end
        endcase
endmodule
    