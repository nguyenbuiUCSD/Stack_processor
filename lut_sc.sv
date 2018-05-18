// CSE141L Spring 2018 Nguyen Bui - Richard Chum
// stack counter lookup table
module lut_sc(
  input[1:0] ptr,					  
  output logic signed[7:0] dout);	  // goes to input port on PC

  always_comb case (ptr)
        2'b00: dout = -8'd2;				  
        2'b01: dout = -8'd1;			 
        2'b10: dout =  8'd0;
        2'b11: dout =  8'd1;			
  endcase

endmodule
