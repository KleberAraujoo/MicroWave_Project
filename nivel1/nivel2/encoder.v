//`include "counterdiv100.v"
//`include "encoder_dec_bcd.v"
//`include "counter0_7.v"
//`include "mux.v"

module encoder (keypad, enablen, clk, D, loadn, pgt_1Hz);
       
    input wire[9:0] keypad;
    input wire enablen, clk;

    output [3:0] D;
    output wire loadn;
    output pgt_1Hz;

    wire clk_1Hz, single_edge;

       encoder_dec_bcd encoder_dec_bcd(keypad, enablen, D, loadn);
       counterdiv100 counterdiv100(clk, clk_1Hz);
       counter0_7 counter0_7(clk, loadn, single_edge);
       mux mux(enablen, single_edge, clk_1Hz, pgt_1Hz);

endmodule