// CSE141L Spring 2018 Nguyen Bui - Richard Chum
// decoder block decode all instructions and output control signals
import definitions::*;
module dc(
  input[8:0] instruction,
  output logic [1:0] tomux2,
  output logic [1:0] toalu,
  output logic [1:0] tosc,
  output logic towe
               );

    always_comb begin
    
    // P TYPE
    if (instruction[8] == P_TYPE)
      begin
        tomux2 <= 2'b00;
        towe <= 1'b1;
        tosc <= ADV_1;
      end
    else if (instruction[8:7] == R_TYPE)
      begin
        case (instruction[7:0])
          I_ADD:
            begin
              towe <= 1'b1;
              toalu <=aluADD;
              tomux2 <= 2'b01;
              tosc <= DES_1;
            end
        endcase
      end
    end
endmodule
