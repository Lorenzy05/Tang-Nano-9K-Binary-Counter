// top.v - Top level module for Tang Nano 9K counter project
// This module connects all sub-modules and defines FPGA I/O pins

module top (
    // Clock input - 27MHz from onboard oscillator
    input wire clk,           // System clock (27MHz)
    
    // Button inputs
    input wire rst_n,         // Reset button (active low, S1 on Tang Nano 9K)
    input wire enable_btn,    // Enable button for counting
    
    // LED outputs - 6 LEDs on Tang Nano 9K
    output wire [5:0] leds    // LEDs: [3:0] = binary count, [4] = odd, [5] = even
);

    // Internal wire declarations
    wire clk_low;           // Low frequency clock for button processing
    wire enable_debounced;  // Debounced enable button signal
    wire enable_pulse;      // Single pulse on enable button press
    wire [3:0] count_value; // 4-bit counter value (0-15)

    // =============================================
    // Module Instantiations
    // =============================================

    // Clock divider - reduces 27MHz to lower frequency for button processing
    clk_div clock_divider_inst (
        .clk_in(clk),        // Input: 27MHz system clock
        .clk_out(clk_low)    // Output: Low frequency clock
    );

    // Button debounce - removes mechanical bouncing from enable button
    debounce enable_debounce_inst (
        .clk(clk_low),       // Input: Low frequency clock
        .btn_in(enable_btn), // Input: Raw enable button signal
        .btn_out(enable_debounced) // Output: Stable button signal
    );

    // Edge detector - generates single pulse on button press
    edge_detect enable_edge_inst (
        .clk(clk_low),       // Input: Low frequency clock
        .signal_in(enable_debounced), // Input: Debounced button signal
        .pulse_out(enable_pulse) // Output: Single clock cycle pulse
    );

    // Counter logic - 4-bit counter (0-15)
    counter counter_inst (
        .clk(clk_low),       // Input: Low frequency clock
        .rst_n(rst_n),       // Input: Reset signal (active low)
        .enable(enable_pulse), // Input: Enable pulse from button press
        .count(count_value)  // Output: 4-bit counter value
    );

    // LED display controller - converts count to LED patterns
    led_display display_inst (
        .count(count_value), // Input: 4-bit counter value
        .leds(leds)          // Output: 6 LED control signals
    );

endmodule