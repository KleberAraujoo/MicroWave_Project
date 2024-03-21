`timescale 1ps/1ps
`include "timer.v"

module timer_tb();

    reg loadn, clrn, clock, en; 
    reg[3:0] data;
    wire zero;
    wire [3:0] sec_ones, sec_tens, mins;


    timer DUT(.loadn(loadn), .clrn(clrn), .clock(clock), .en(en), .data(data),
                            .zero(zero), .sec_ones(sec_ones), .sec_tens(sec_tens), .mins(mins));


    initial begin
        $dumpfile("timer_tb.vcd");
        $dumpvars(0, timer_tb);
        clock  = 1'b0;
        en = 1'b0; 
        loadn  = 1'b0;
    end

    always begin
        #1 clock = loadn? ~clock : clock;
    end

    initial begin    

        clrn = 1'b1; #0.5
        clrn = 1'b0; #0.5
        clrn = 1'b1; #0.5

        data =  2;   #0.04;
        clock = 1'b1;   #0.01;
        clock = 1'b0;   #0.95;

        data =  1;   #0.04;
        clock = 1'b1;   #0.01;
        clock = 1'b0;   #0.95;

        data =  5;   #0.04;
        clock = 1'b1;   #0.01;
        clock = 1'b0;   #0.95;

        data =  9;   #0.04;
        clock= 1'b1;   #0.01;
        clock = 1'b0;   #0.95;

        en = 1; loadn = 1; #1000;

        $finish();
    end


endmodule