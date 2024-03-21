`timescale 1ms/1ns
`include "encoder.v"

module tb_encoder;
    reg[9:0] keypad;
    reg enablen;
    reg clk;
    wire[3:0] D_tb;
    wire loadn;
    wire pgt_1Hz;

    encoder DUT
    (
        .keypad (keypad),
        .enablen (enablen),
        .clk (clk),
        .D (D_tb),
        .loadn (loadn),
        .pgt_1Hz (pgt_1Hz)
    );

    initial begin
        $dumpfile("tb_encoder.vcd");
        $dumpvars(0, tb_encoder);

        clk = 0;
        enablen = 0;
        keypad = 0;

        repeat(2) begin
            enablen = ~enablen;
            for (integer i = 0; i < 10; i = i+1) begin   
                keypad = 1 << i;
                repeat(20) #5 clk =~clk;
                keypad = 0;
                repeat(20) #5 clk =~clk;
            end
        end
        keypad = 10'h80;
        repeat(4) #5 clk =~clk;
        keypad = 10'h84;
        repeat(6) #5 clk =~clk;

    end

endmodule