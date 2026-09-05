module top (
    input clk_sys,
    output reg[7:0] led,
    output wifi_gpio0
);

  assign wifi_gpio0 = 1'b1;  // keep board from rebooting

  soc soc (
    .clk(clk_sys),
    .led(led)
  );

endmodule
