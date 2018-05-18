// CSE141L Spring 2018 Nguyen Bui - Richard Chum
// 14-element reg_file -  This is the stack
import definitions::*;
module rf(
  input             clk,
  input             [1:0]op,
  input  [7:0]      di,					// data to load into reg_file
  input             we,				    // write enable
  input  logic[3:0]      sc,				// address to write to
  output logic[7:0] do_a,                       // 2 data values to be read from reg_file
                    do_b);

  reg [7:0] core[13];                        // our reg_file itself -- 8x4 2-dimensional array
  always_ff @(posedge clk)
    if(we)		// write only on posedge clock and only if we=1
      begin
        case (op) // TODO: Add more case
          DES_1: core[sc-2] <= di;
          ADV_1: core[sc] <= di;
        endcase
      end
  always_comb do_a = core[sc-1];		// reads are continuous/combinational instead of 
  always_comb do_b = core[sc-2];       //   clocked/sequential


endmodule
