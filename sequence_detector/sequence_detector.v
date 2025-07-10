module sequence_detector(in, clk, reset, out);
    input in, clk, reset;
    output reg out;
    parameter s0 = 2'b00, s1= 2'b01, s2=2'b10, s3=2'b11;
    reg [1:0] ps, ns;
    reg data;

    always @(posedge clk or posedge reset)
        begin
            if(reset)
                begin
                    ps <= s0;
                    out<=1'b0;
            end
            else
                begin
                    ps<=ns;
                    out<=data;
            end
    end

    always@ (in or ps)
        begin
            case(ps)
                s0: begin
                    data<= in? 0:0;    
                    ns <= in? s1:s0;
                end
                s1: begin
                    data<= in? 0:0;
                    ns <= in? s2:s1;
                end
                s2: begin
                    data<= in?0:0;
                    ns<= in? s1:s3;
                end
                s3: begin
                    data<= in? 1:0;
                    ns<= in? s1:s0;
                end
                default: begin
                    data<= 1'b0;
                    ns <= s0; 
                end
            endcase
        end
        
endmodule