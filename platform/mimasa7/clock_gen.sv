// TODO: WIP
//
// input parameters: CLKFBOUT_MULT, DIVCLK_DIVIDE, CLKOUT0_DIVIDE, CLKOUT1_DIVIDE, CLKOUT2_DIVIDE
// F_VCO = F_in * CLKFBOUT_MULT / DIVCLK_DIVIDE
// F_{out, k} = F_VCO / CLKOUT<k>_DIVIDE = F_in * CLKFBOUT_MULT / (DIVCLK_DIVIDE * CLKOUT<k>_DIVIDE)

// constraints:
// DIVCLK_DIVIDE must be in range 1–56
// CLKFBOUT_MULT must be in range 2–64
// CLKOUT<k>_DIVIDE must be in range 1-128
// VCO frequency must be in range 800-1600 MHz

module clock_gen #(
    // the following parameters must be in the range 1-128
    parameter CLKFBOUT_MULT,
    parameter DIVCLK_DIVIDE,
    parameter CLKOUT0_DIVIDE
) (
    input  wire clk_in,
    output wire clk_out
);

wire clk_buf;
wire clk_in_buf, clk_feedback, clk_feedback_buf;
wire clkout0, clkout1, clkout2;

IBUF input_buffer(.I(clk_in), .O(clk_in_buf));
BUFG clock_buffer(.I(clk_in_buf), .O(clk_buf));

PLLE2_BASE #(
    .CLKFBOUT_MULT(CLKFBOUT_MULT),
    .DIVCLK_DIVIDE(DIVCLK_DIVIDE),
    .CLKFBOUT_PHASE(0),
    .CLKOUT0_DIVIDE(CLKOUT0_DIVIDE),
    .CLKOUT0_PHASE(0),
    .CLKOUT0_DUTY_CYCLE(0.5)
) pll (
    .CLKFBIN(clk_feedback_buf),
    .CLKFBOUT(clk_feedback),
    .CLKIN1(clk_buf),
    .CLKOUT0(clkout0),
    .CLKOUT1(clkout1),
    .CLKOUT2(clkout2),
    .RST(0),
    .PWRDWN(0)
);

BUFG feedback_buffer(.I(clk_feedback), .O(clk_feedback_buf));

BUFG output_buffer0(.I(clkout0), .O(clk_out));

endmodule