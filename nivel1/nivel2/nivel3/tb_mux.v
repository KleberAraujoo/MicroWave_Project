`timescale 1ns/1ns
`include "mux.v"

module mux_teste;

    reg sel_TB, saida_contador_TB, clk_TB;
  	wire  Q_TB;

  	mux DUT(.sel(sel_TB), .non_recycling_counter_output(saida_contador_TB), .clk_1Hz(clk_TB), .pgt_1Hz(Q_TB));

    initial
        begin

            $dumpfile("mux_teste.vcd");
            $dumpvars(0, mux_teste);

                sel_TB=1; saida_contador_TB=0; clk_TB=1;
            #5  sel_TB=0; saida_contador_TB=0; clk_TB=1;
         	  #5  sel_TB=1; saida_contador_TB=1; clk_TB=0;
          	#5  sel_TB=0; saida_contador_TB=1; clk_TB=0;
            #5  sel_TB=1; saida_contador_TB=1; clk_TB=1;
          	#5  sel_TB=0; saida_contador_TB=1; clk_TB=1;
            #5  sel_TB=1; saida_contador_TB=0; clk_TB=0;
          	#5  sel_TB=0; saida_contador_TB=0; clk_TB=0;
          
        end
endmodule