// CSE141L Spring 2018 Nguyen Bui - Richard Chum
// program counter control block
import definitions::*;
module sc (
  input        [1:0] op, 
  input              clk,	     // clk -- PC advances and memory/reg_file writes are clocked 
  input              reset,		 // overrides all else, forces PC to 0 (start of program)
  output logic [3:0] SC);		 // 

  always_ff @(posedge clk)
    begin 
      if(reset)				
        SC <= 4'b0000;
      else if (op==DES_2)
        SC <= SC - 2;
      else if (op==DES_1)
        SC <= SC - 1;
      else if (op==ADV_1)
        SC <= SC + 1;
    end
endmodule
