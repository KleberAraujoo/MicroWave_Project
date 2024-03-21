`timescale 1ps/1ps
`include "countermod6.v"

module countermod6_tb();

    reg loadn, clrn, clock, enable;
    reg [3:0] data;
    wire tc, zero; 
    wire [3:0] tens;
    integer i;


    countermod6 DUT(.loadn(loadn), .clrn(clrn), .clock(clock), .enable(enable), .data(data),
                        .tc(tc), .zero(zero), .tens(tens));
    
    initial begin
        $dumpfile("countermod6_tb.vcd");
        $dumpvars(0, countermod6_tb);

        assign loadn = 1;
        assign enable = 0; 
        assign clrn = 1;
        assign data = 4'b0100;

        #5 assign loadn = 0;

        #5 assign loadn = 1;

        #5 assign enable = 1; 
    end
  
    initial begin
    	clock = 1'b0;
  	end
		
    initial begin
    	#5 clock = ~clock;
      for(i = 0; i < 26; i = i + 1)
        begin
          #5 clock = ~clock;
        end
    end

endmodule