module countermod10 (input wire loadn, clrn, clock, enable, input wire [3:0] data,
                        output wire tc, zero, output reg [3:0] ones);



    initial ones = 0;

    assign zero = (ones == 0)? 1:0;
    assign tc = enable && zero;

    always@(posedge clock, negedge clrn) begin
	 
		  if(clrn == 0)
				ones = 0;
		  else
			begin
			  if(enable == 1)
					if(ones == 0)
						 ones <= 9;
					else
						 ones <= ones -1;
			  else
					begin
						 if(loadn == 0)
							  ones <= data;
					end
			end
    end

endmodule