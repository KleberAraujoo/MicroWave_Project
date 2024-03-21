`timescale 1ps/1ps
`include "seg7_driver.v"

module seg7_driver_tb();

    reg[3:0] sec_ones, sec_tens, mins;
    wire[6:0] sec_ones_segs, sec_tens_segs, mins_segs;

    seg7_driver DUT(.sec_ones(sec_ones), .sec_tens(sec_tens), .mins(mins),
                                .sec_ones_segs(sec_ones_segs), .sec_tens_segs(sec_tens_segs), .mins_segs(mins_segs));

    initial begin
        $dumpfile("seg7_driver_tb.vcd");
        $dumpvars(0, seg7_driver_tb);

    /* 0 */ sec_ones = 4'b0000; sec_tens = 4'b0000; mins = 4'b0000;
    #5
    /* 1 */ sec_ones = 4'b0001; sec_tens = 4'b0001; mins = 4'b0001;
    #5
    /* 2 */ sec_ones = 4'b0010; sec_tens = 4'b0010; mins = 4'b0010;
    #5
    /* 3 */ sec_ones = 4'b0011; sec_tens = 4'b0011; mins = 4'b0011;
    #5
    /* 4 */ sec_ones = 4'b0100; sec_tens = 4'b0100; mins = 4'b0100;
    #5
    /* 5 */ sec_ones = 4'b0101; sec_tens = 4'b0101; mins = 4'b0101;
    #5
    /* 6 */ sec_ones = 4'b0110; sec_tens = 4'b0110; mins = 4'b0110;
    #5
    /* 7 */ sec_ones = 4'b0111; sec_tens = 4'b0111; mins = 4'b0111;
    #5
    /* 8 */ sec_ones = 4'b1000; sec_tens = 4'b1000; mins = 4'b1000;
    #5
    /* 9 */ sec_ones = 4'b1001; sec_tens = 4'b1001; mins = 4'b1001;


    


    end



endmodule