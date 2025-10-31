// debounce.v - Button debounce module
// Eliminates mechanical bouncing from button presses

module debounce (
    input wire clk,
    input wire btn_in,
    output reg btn_out
);
    parameter DEBOUNCE_COUNT = 5'd20;
    reg [4:0] counter = 5'd0;
    reg btn_prev = 1'b0;

    always @(posedge clk) begin
        btn_prev <= btn_in;
        
        if (btn_in != btn_prev) begin
            counter <= 5'd0;
        end else if (counter < DEBOUNCE_COUNT) begin
            counter <= counter + 5'd1;
        end
        
        // 确保输出正确更新
        if (counter == DEBOUNCE_COUNT) begin
            btn_out <= btn_prev;
        end
    end
endmodule