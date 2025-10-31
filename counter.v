// counter.v - 4-bit counter module (0-15)
// This module implements the core counting logic

module counter (
    input wire clk,           // Clock input (low frequency)
    input wire rst_n,         // Reset signal (active low)
    input wire enable,        // Enable pulse from button press
    output reg [3:0] count    // 4-bit counter output (0-15)
);

    // =============================================
    // Counter Logic
    // =============================================

    // Sequential always block for counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset counter to 0 when reset is active
            count <= 4'b0;
        end else begin
            // When enable pulse is received, increment counter
            if (enable) begin
                // If counter reaches 15, wrap around to 0
                // Otherwise, increment by 1
                if (count == 4'd15) begin
                    count <= 4'b0;
                end else begin
                    count <= count + 4'b1;
                end
            end
        end
    end

endmodule