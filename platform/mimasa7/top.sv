module top (
    input clk,
    output [7:0] led
);

  wire i_clk;

  assign i_clk = clk;
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
