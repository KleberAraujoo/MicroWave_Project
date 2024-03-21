module counter0_7(
    input wire clock,
    input wire clear,
    output wire counter0_7
);

    reg [2:0] counter;
    initial counter = 0;

    always @(posedge clock or posedge clear) begin
        if (clear) begin
            counter <= 0;
        end else if (counter < 7) begin
            counter <= counter + 1;
        end
    end

    assign counter0_7 = (counter >= 4);

endmodule