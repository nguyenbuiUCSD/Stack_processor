// CSE141L Spring 2018 Nguyen Bui - Richard Chum
// program counter control block
import definitions::*;
module pc (
  input              clk,	     // clk -- PC advances and memory/reg_file writes are clocked 
  input              reset,		 // overrides all else, forces PC to 0 (start of program)
  output logic [8:0] PC);		 // program count

  always_ff @(posedge clk) 
    if(reset)					 // resetting to start=0
      PC <= 'b0;
    else						 // normal/default operation
      PC <= PC + 'b1;
endmodule