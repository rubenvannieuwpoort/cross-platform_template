module clock_gen #(
    parameter CLKI_DIV,
    parameter CLKFB_DIV,
    parameter CLKOP_DIV,
    parameter CLK1_DIV,
) (
    input  wire clk_in,
    output wire clk_out
);

wire clk_ref;

EHXPLLL #(
    .CLKI_DIV(CLKI_DIV),
    .CLKFB_DIV(CLKFB_DIV),
    .CLKOP_DIV(CLKOP_DIV),
    .CLKOS_DIV(CLK1_DIV),
    .CLKOS_ENABLE("ENABLED")
) pll (
    .CLKI(clk_in),
    .CLKFB(clk_ref),
    .CLKOP(clk_ref),
    .CLKOS(clk_out)
);

endmodule