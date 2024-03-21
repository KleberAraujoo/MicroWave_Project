`timescale 1ns/1ns
`include "encoder_dec_bcd.v"

    module tb_encoder_dec_bcd;
    reg [9:0]keypad;
    reg enablen;
    output [3:0]D;
    wire valid;

    encoder_dec_bcd DUT
    (
        .keypad (keypad),
        .enablen (enablen),
        .D (D)
    );

    initial begin
        $dumpfile("tb_encoder_dec_bcd.vcd");
        $dumpvars(0, tb_encoder_dec_bcd);

        enablen = 1'b0;

        repeat (2) begin
            enablen = ~enablen;
            for (integer i = 0; i < 10; i = i+1) begin
                keypad = 10'b0000000001 << i; #5;
            end
            keypad = 10'b00_0000_0000; #5;
            keypad = 10'b00_1000_0100; #5;
        end

    end

endmodule
