`timescale 1ns/100ps

module gcd_tb;

reg clk_tb =0;
localparam clk_period =2;
always #(clk_period) clk_tb = ~clk_tb;

reg rst_tb ;
reg [15:0] A_tb , B_tb;
wire [15:0] result_tb;

gcd_top dut (
    .clk(clk_tb),
    .rst(rst_tb),
    .A_in(A_tb),
    .B_in(B_tb),
    .result(result_tb)
);


task gcd_check (
    input [15:0] A , B 
);begin
    A_tb=A;
    B_tb=B;

    rst_tb = 1;
    #(clk_period);
    rst_tb = 0;
    #(30*clk_period);
    $display("The gcd is %d" , result_tb);
  


end
endtask

initial begin
    gcd_check(20,30);
    gcd_check(10,2);

    $finish;

end

endmodule