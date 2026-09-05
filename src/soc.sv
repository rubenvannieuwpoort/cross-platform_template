module soc (
    input clk,
    output reg[7:0] led = 0
);

  reg[24:0] ctr = 0;

  always @(posedge clk) begin
    if (ctr < 24999999)
      ctr <= ctr + 1;
    else begin
      ctr <= 0;
      led <= ~led;
    end
  end

endmodule
