module gcd_top #(parameter NUM_WIDTH = 16)(
    input clk , rst ,
    input [NUM_WIDTH-1 : 0] A_in , B_in ,
    output [NUM_WIDTH-1 : 0] result
);

wire a_sub_b , n_rst , found , equal , a_gt_b;

gcd_cont controller (
    .clk(clk) , 
    .rst(rst), 
    .equal(equal) , 
    .a_gt_b(a_gt_b), 
    .a_sub_b(a_sub_b) , 
    .n_rst(n_rst) , 
    .found(found)
);

gcd_dp dp (
    .clk(clk) ,  
    .equal(equal) , 
    .a_gt_b(a_gt_b), 
    .a_sub_b(a_sub_b) , 
    .n_rst(n_rst) , 
    .found(found),
    .A_in(A_in) , 
    .B_in(B_in),
    .result(result)
);

endmodule //gcd_top