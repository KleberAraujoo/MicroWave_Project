module mux(
  input wire sel,
  input wire non_recycling_counter_output,
  input wire clk_1Hz,
  output reg pgt_1Hz
);

  always @* begin
    pgt_1Hz = (sel == 0) ? non_recycling_counter_output : clk_1Hz;
  end

endmodule