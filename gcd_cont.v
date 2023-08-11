module gcd_cont (
    input clk , rst, equal , a_gt_b,  
    output reg a_sub_b , n_rst , found
);

localparam STATE_REG_WIDTH = 3;
localparam [STATE_REG_WIDTH-1 : 0] s0 = 3'd0,    //start state
                                   s1 = 3'd1,   //equality check
                                   s2 = 3'd2,   // A>B
                                   s3 = 3'd3;   //B>A

reg [STATE_REG_WIDTH-1 : 0] curr_state , next_state;

always @(posedge clk , negedge rst) begin
    if (rst) begin
        curr_state <= s0;
    end
    else begin
        curr_state <= next_state ;
    end
end

always @(*) begin
    a_sub_b = 0;
    n_rst = 0;
    found = 0;

    case (curr_state)
        s0 : begin
           n_rst =1; 

           next_state = s1 ;

        end
        s1 : begin
           if (equal) begin
            found = 1;
           end
           else begin
            if (a_gt_b) begin
                next_state = s2;
            end
            else begin
                next_state = s3;
            end
           end
        end
        s2 : begin
           a_sub_b =1; 

           next_state = s1;
        end
        s3 : begin
           a_sub_b =0; 

           next_state = s1;
        end
        default : next_state = s0;
    endcase

end

endmodule