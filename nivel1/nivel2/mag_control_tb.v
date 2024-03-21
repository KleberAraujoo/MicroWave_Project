`timescale 1ps/1ps
`include "mag_control.v"

module mag_control_tb();

    reg startn, stopn, clearn, door_closed, timer_done;
    wire mag_on;

    Controle_magnetron DUT(.startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(timer_done),
                            .mag_on(mag_on));

    initial begin
        $dumpfile("mag_control_tb.vcd");
        $dumpvars(0, mag_control_tb);

        startn = 0; door_closed = 1; timer_done = 0;
        stopn = 1; clearn = 1;  

        #10 door_closed = 0; //abriu a porta

        #5 door_closed = 1; // fechou a porta

        #5 stopn = 0; //deu stop

        #5 stopn = 1; //tirou stop

        #5 timer_done = 1; // tempo acabou

    end


endmodule