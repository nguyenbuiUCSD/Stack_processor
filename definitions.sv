//This file defines the parameters used in every where
// CSE141L Spring 2018 Nguyen Bui - Richard Chum
package definitions;


    // Instruction definitions
    const logic I_ADD  = 8'b00000000;
    const logic I_SUB  = 8'b00001001;

    // Instruction types
    const logic P_TYPE  = 1'b0;      // load reg_file from data_mem
    const logic [1:0] R_TYPE  = 2'b10;      // load reg_file from data_mem

    // Stack pointer operations
    const logic [1:0] DES_2  = 2'b00;      //
    const logic [1:0] DES_1  = 2'b01;      //
    const logic [1:0] ADV_0  = 2'b10;      //
    const logic [1:0] ADV_1  = 2'b11;      //
    // Instruction map to ALU
    const logic [1:0]aluADD  = 2'b00;	  // add A+B w/ carry
    const logic [1:0]aluSUB  = 2'b01;	  // sub A-B w/ carry
    const logic [1:0]aluSL   = 2'b10;	  // shift left 
    const logic [1:0]alsSR   = 2'b11;	  // shift right
    // enum names will appear in timing diagram
    typedef enum logic[1:0] {			  // mnemonic equivs of the above
        ADD, SUB, SL, SR  // strictly for user convnience in timing diagram
         } op_mne;
endpackage // definitions
