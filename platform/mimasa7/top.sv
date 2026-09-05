module top (
    input clk_sys,
    output reg[7:0] led
);

  soc soc (
    .clk(clk_sys),
    .led(led)
  );

endmodule
