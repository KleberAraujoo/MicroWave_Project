`timescale 1ps/1ps
`include "on_off_logic.v"

module on_off_logic_tb ();
    reg starn, stopn, clearn, door_closed, timer_done;
    wireAND_OR_NOT_logic_tb  set, reset;


    on_off_logic DUT(.starn(starn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(timer_done),
                            .set(set), .reset(reset));

    initial begin
        $dumpfile("on_off_logic_tb");
        $dumpvars(0, on_off_logic_tb);

        starn = 0; door_closed = 1; timer_done = 0;
        stopn = 1; clearn = 1; 

        #10 door_closed = 0; //abriu a porta

        #5 door_closed = 1; // fechou a porta

        #5 stopn = 0; //deu stop

        #5 stopn = 1; //tirou stop

        #5 timer_done = 1; // tempo acabou

    end


endmodule