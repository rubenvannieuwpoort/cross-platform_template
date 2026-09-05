module clock_gen #(
    // the following parameters must be in the range 1-128
    parameter CLKI_DIV,  // D
    parameter CLKFB_DIV, // M
    parameter CLKOP_DIV, // C
    parameter CLK1_DIV   // O1
) (
    input  wire clk_in,
    output wire clk_out
);

// f_VCO needs to be in 400-800 MHz
// generally we want it to be higher to have low jitter

// f_in is 25 MHz for the ULX3S
// f_VCO = f_in * M * C / D
// f_1 = f_VCO / O1

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