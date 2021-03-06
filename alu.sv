// CSE141L Spring 2018 Nguyen Bui - Richard Chum
// ALU
import definitions::*;              // declares ALU opcodes 
module alu (			         
  input       [1:0] op,			    // opcode
  input       [7:0] in_a,		    // operands in
                    in_b,
  output logic[7:0] rslt);		    // result out

  op_mne op_mnemonic;			    // type enum: used for convenient waveform viewing

  always_comb begin			    // defaults
    rslt  = 8'b0;
    case(op)						// selective override one or more defaults
      aluADD: rslt = in_a+in_b;	  // add A+B w/ carry
      aluSUB: rslt = in_a-in_b;	  // sub A-B w/ carry
      aluSL:  rslt = in_a<<in_b;	  // shift left 
      alsSR:  rslt = in_a>>in_b;	  // shift right
    endcase
  end
  assign  op_mnemonic = op_mne'(op);  // creates ALU opcode mnemonics in timing diagram

endmodule