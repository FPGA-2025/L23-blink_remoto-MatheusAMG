module Blink #(
    parameter CLK_FREQ = 25_000_000 
) (
    input wire clk,
    input wire rst_n,
    output reg [7:0] leds
);

localparam ONE_SECOND  = CLK_FREQ;
localparam TWO_SECOND  = 2*CLK_FREQ;
localparam HALF_SECOND = CLK_FREQ / 2;

reg [31:0] counter;

always @(posedge clk ) begin
    if (!rst_n) begin
        counter <= 32'h0;
        leds     <= 8'b0;
    end else begin
        if (counter >= HALF_SECOND - 1) && (leds == 8'h00) begin
            counter <= 32'h0;
            leds[0] <= ~leds[0]; 
            leds[1] <= ~leds[1]; 
            leds[2] <= ~leds[2]; 
            leds[3] <= ~leds[3]; 
            leds[4] <= ~leds[4]; 
            leds[5] <= ~leds[5]; 
            leds[6] <= ~leds[6]; 
            leds[7] <= ~leds[7]; 
        end 
        else if (counter >= TWO_SECOND - 1) && (leds == 8'hFF) begin
            counter <= 32'h0;
            leds[0] <= ~leds[0]; 
            leds[1] <= ~leds[1]; 
            leds[2] <= ~leds[2]; 
            leds[3] <= ~leds[3]; 
            leds[4] <= ~leds[4]; 
            leds[5] <= ~leds[5]; 
            leds[6] <= ~leds[6]; 
            leds[7] <= ~leds[7]; 
        end 
        else begin
            counter <= counter + 1;
        end
    end
end
    
endmodule
