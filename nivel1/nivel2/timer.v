//`include "countermod6.v"
//`include "countermod10.v"

module timer (input wire  loadn, clrn, clock, en, input wire[3:0] data,
                          output wire zero, output wire [3:0] sec_ones, sec_tens, mins);
    
    wire zero1, zero2, zero3;
    wire tc1, tc2, tc3;
    countermod10 DUT1(.loadn(loadn), .clrn(clrn), .clock(clock), .enable(en), .data(data), .tc(tc1), .zero(zero1), .ones(sec_ones));
    countermod6 DUT2(.loadn(loadn), .clrn(clrn), .clock(clock), .enable(tc1), .data(sec_ones), .tens(sec_tens), .tc(tc2), .zero(zero2));
    countermod10 DUT3(.loadn(loadn), .clrn(clrn), .clock(clock), .enable(tc2), .data(sec_tens), .tc(tc3), .zero(zero3), .ones(mins));
    assign zero = zero1 && zero2 && zero3;

endmodule