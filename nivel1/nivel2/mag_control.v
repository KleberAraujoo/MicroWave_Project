//`include "on_off_logic.v"
//`include "latch_sr.v"

module mag_control (input wire startn, stopn, clearn, door_closed, timer_done,
                            output wire mag_on);

wire set, reset;

on_off_logic DUT1(.startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed),
                        .timer_done(timer_done), .set(set), .reset(reset));
                        
latch_sr DUT2(.set(set), .reset(reset), .mag_on(mag_on));

    
endmodule