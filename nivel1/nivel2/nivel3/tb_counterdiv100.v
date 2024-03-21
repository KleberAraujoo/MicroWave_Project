`timescale 1ms/1ns
`include "counterdiv100.v"

module tb_counterdiv100;
    reg clk;
    reg clk_1Hz;

    counterdiv100 DUT
    (
        .clk (clk),
        .clk_1Hz (clk_1Hz_tb)
    );

    initial begin
        $dumpfile("tb_counterdiv100.vcd");
        $dumpvars(0, tb_counterdiv100);

        clk = 1'b0;
        repeat(200)
            #5 clk = ~clk;
    end

endmodule