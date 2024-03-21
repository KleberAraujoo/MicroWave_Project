//`include "mag_control.v"
//`include "encoder.v"
//`include "timer.v"
//`include "seg7_driver.v"

module controler(input wire startn, stopn, clearn, door_closed, clock, input wire [9:0] keypad,
                                            output wire mag_on, output wire[6:0] sec_ones_segs, sec_tens_segs, mins_segs);

    wire[3:0] data, sec_ones, sec_tens, mins;
    wire loadn, pgt_1Hz, timer_done; 
    wire saida_controle;
    assign mag_on = saida_controle;

    mag_control DUT1(.startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .mag_on(saida_controle), .timer_done(timer_done));
    encoder DUT2(.keypad(keypad), .enablen(saida_controle), .clk(clock), .D(data), .loadn(loadn), .pgt_1Hz(pgt_1Hz));
    timer DUT3(.loadn(loadn), .clrn(clearn), .clock(pgt_1Hz), .en(saida_controle), .data(data), .zero(timer_done),.sec_ones(sec_ones), .sec_tens(sec_tens), .mins(mins));
    seg7_driver DUT4(.sec_ones(sec_ones), .sec_tens(sec_tens), .mins(mins), .sec_ones_segs(sec_ones_segs), .sec_tens_segs(sec_tens_segs), .mins_segs(mins_segs));


endmodule