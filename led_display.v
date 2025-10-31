// led_display.v - LED display controller
// Converts 4-bit counter value to LED patterns
// Based on Tang Nano 9K example code style


module led_display (

    input [3:0] count,      // 4-bit counter input (0-15)
    output reg [5:0] leds   // 6 LED outputs

);

    // =============================================
    // LED Display Logic
    // =============================================

    always @(*) begin
        // First 4 LEDs (LSB to MSB): Binary representation of counter
        leds[3:0] = ~count[3:0];

        // LED4: ON when count is ODD (LSB = 1)
        leds[5] = count[0];

        // LED5: ON when count is EVEN (LSB = 0)
        leds[4] = ~count[0];
    end

endmodule