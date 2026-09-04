module top (
    input clk,
    output reg [7:0] led,
    output wifi_gpio0
);

  assign wifi_gpio0 = 1'b1;  // keep board from rebooting

  reg[25:0] ctr = 0;

  always @(posedge clk) begin
    ctr <= ctr + 1;
    led[7:0] <= ctr[25:18];
  end

endmodule
