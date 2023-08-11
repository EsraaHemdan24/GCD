module gcd_dp #(parameter NUM_WIDTH = 16) (
    input [NUM_WIDTH-1 : 0] A_in , B_in,
    input clk , n_rst, a_sub_b , found,                //a_sub_b = 1 -> a-b , a_sub_b = 0 -> b-a
    output equal , a_gt_b,                            //a_gt_b = 1 -> A>B , a_gt_b = 0 -> B>A
    output reg [NUM_WIDTH-1 :0] result 
);

reg [NUM_WIDTH-1:0] A , B ;

always @(posedge clk or negedge n_rst) begin

    if (!n_rst) begin
        A <= 0;
        B <= 0;
    end
    else begin
        A <= A_in;
        B <= B_in;

        if(found) begin
            result <= A;
        end
        else begin
            result = 0;
            if(a_sub_b) begin
                A <= A-B;
            end
            else begin
                B <= B-A;
            end

        end
    end
end

assign equal = (A==B) ? 1:0;
assign a_gt_b = (A>B) ? 1:0;

endmodule