// edge_detect.v - Edge detection module
// Detects rising edge of button signal and generates single clock cycle pulse

module edge_detect (
    input wire clk,           // Low frequency clock (1kHz)
    input wire signal_in,     // Debounced button input
    output reg pulse_out      // Single pulse output on rising edge
);

    // =============================================
    // Internal Registers
    // =============================================
    
    reg signal_prev;          // Previous state of input signal

    // =============================================
    // Edge Detection Logic
    // =============================================

    always @(posedge clk) begin
        // Store previous state for edge detection
        signal_prev <= signal_in;
        
        // Detect rising edge: previous=0, current=1
        if (signal_prev == 1'b0 && signal_in == 1'b1) begin
            pulse_out <= 1'b1;
        end else begin
            pulse_out <= 1'b0;
        end
    end

endmodule