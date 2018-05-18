// CSE141L Spring 2018 Nguyen Bui - Richard Chum
// top-level design connects all pieces together
import definitions::*;
module top(
  input        clk,
               reset,
  output logic done);

  wire[7:0] PCOUT;
  wire[8:0] IMEMOUT;
  wire[7:0] MUX2_A;
  wire[7:0] MUX2_B;
  wire[7:0] MUX2_C;
  wire[7:0] MUX2_OUT;
  wire[1:0] MUX2_SEL;
  wire[3:0] SC;
  wire[7:0] TOP_ST;
  wire[7:0] SND_ST;

  wire[1:0] SC_OP; 

  //ALU wires
  wire[1:0] ALU_OP;
  wire[7:0] ALU_OUT;


  logic rf_we;


  assign MUX2_A = IMEMOUT[7:0]; // Imm
  assign MUX2_B = ALU_OUT;
  assign done = IMEMOUT==9'b111111111; // halt & hit done flag

  pc pc1(
    .clk (clk),
    .reset,
    .PC (PCOUT));

  imem imem1(
    .PC (PCOUT),
    .inst (IMEMOUT));

  dc dc1(
    .tosc (SC_OP),
    .instruction (IMEMOUT),
    .toalu (ALU_OP),
    .tomux2 (MUX2_SEL),
    .towe (rf_we));

 rf rf1(
    .clk,
    .op (SC_OP),
    .di (MUX2_OUT),
    .we (rf_we),
    .sc (SC),
    .do_a (TOP_ST),
    .do_b (SND_ST));

 sc sc1(
    .op (SC_OP),
    .clk,
    .reset,
    .SC);

  mux2 mux21(
    .A (MUX2_A),
    .B (MUX2_B),
    .C (MUX2_C),
    .SEL (MUX2_SEL),
    .Z (MUX2_OUT));

  alu alu1(
    .in_a (TOP_ST),
    .in_b (SND_ST),
    .op   (ALU_OP),
    .rslt (ALU_OUT));

endmodule

  