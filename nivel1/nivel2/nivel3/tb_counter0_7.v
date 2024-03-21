`timescale 1ns/1ns
`include "counter0_7.v"

module counter0_7_teste;

    reg clock_TB, clear_TB, contador_TB;
  	wire  Q_TB;

  	counter0_7 DUT(.clock(clock_TB), .clear(clear_TB), .non_recycling_counter_output(Q_TB));

    initial
        begin

            $dumpfile("counter0_7_teste.vcd");
            $dumpvars(0, counter0_7_teste);

                clock_TB = 1; clear_TB=1; contador_TB = 0;
            #5   contador_TB = 3;
            #5   clear_TB = 0; 
          
            repeat(8)
                begin
                    #10 clock_TB = ~clock_TB;
                end

        end
endmodule