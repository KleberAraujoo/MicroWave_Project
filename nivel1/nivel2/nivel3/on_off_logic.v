module on_off_logic (input wire startn, stopn, clearn, door_closed, timer_done,
                        output wire set, reset);
                        
    assign set = !startn && door_closed && !timer_done;
    assign reset = !stopn | !clearn | !door_closed | timer_done;

endmodule