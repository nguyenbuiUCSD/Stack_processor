module mux2(
    input [7:0] A,B,C,
    input [1:0] SEL,
    output logic [7:0] Z
    );

  always_comb begin
    case(SEL)
      2'b00: Z = A;
      2'b01: Z = B;
      2'b10: Z = C;	
    endcase
  end

endmodule
