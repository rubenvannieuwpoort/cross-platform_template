module top (
    input clk_sys,
    output reg[7:0] led,
    output wifi_gpio0
);

  assign wifi_gpio0 = 1'b1;  // keep board from rebooting

  wire clk;

  clock_gen #(
    .CLKI_DIV(1),
    .CLKFB_DIV(4),
    .CLKOP_DIV(4),
    .CLK1_DIV(8),
  ) clock_gen (
    .clk_in(clk_sys),
    .clk_out(clk)
  );

  soc soc (
    .clk(clk),
    .led(led)
  );

endmodule
