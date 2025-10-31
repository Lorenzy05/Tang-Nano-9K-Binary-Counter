// clk_div.v - Clock divider module
// Divides high frequency system clock to lower frequency for button processing



module clk_div (
    input wire clk_in,
    output reg clk_out
);
    parameter DIVIDER = 24'd13_500;
    reg [23:0] counter = 24'd0;

    always @(posedge clk_in) begin
        if (counter >= DIVIDER - 1) begin
            counter <= 24'd0;
            clk_out <= ~clk_out;
        end else begin
            counter <= counter + 24'd1;
        end
    end
endmodule