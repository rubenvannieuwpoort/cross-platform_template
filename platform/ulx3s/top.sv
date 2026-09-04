module top (
    input clk_25mhz,
    output [7:0] led,
    output wifi_gpio0
);

  wire i_clk;

  // Tie GPIO0, keep board from rebooting
  assign wifi_gpio0 = 1'b1;
  assign i_clk = clk_25mhz;
  reg [7:0] o_led;
  assign led = o_led;

  localparam ctr_width = 32;
  reg [ctr_width-1:0] ctr = 0;

  always @(posedge i_clk) begin
    ctr <= ctr + 1;
    o_led[7] <= 1;
    o_led[6:0] <= ctr[24:18];
  end

endmodule
