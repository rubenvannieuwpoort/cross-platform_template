module top (
    input clk_sys,
    output reg[7:0] led
);

  wire clk;

  clock_gen #(
    .CLKFBOUT_MULT(8),
    .DIVCLK_DIVIDE(1),
    .CLKOUT0_DIVIDE(16)
  ) clock_gen (
    .clk_in(clk_sys),
    .clk_out(clk)
  );

  soc soc (
    .clk(clk),
    .led(led)
  );

endmodule
