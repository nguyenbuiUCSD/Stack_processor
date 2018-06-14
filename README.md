# Introduction:
This is stack like processor that is designed to solve encrypt and decrypt a message as a requirement of UCSD 141L course.
In the constrain of 9-bit instruction memory, we design a stack like processor that get rid of register addressing so that we can support a larger number of instructions.

# Lab 4 result
We use the test bench that is given by professor without any modification (except we wire the 'init' to 'reset')
Programs are coded in imem3.sv which is used to demo to TA.
Only program 1 that passed the test bench. We have not finished the coding part for program 2 and 3 (We already have all needed instructions)
To run the test bench:
 - Create a new project in ModelSim
 - Add all .sv files in this folder to project
 - Compile all
 - Run simulation, chose program_all_tb (or program1_tb), Run all
 - Check output messages at console windows (or add waves to simulation to see actual waves)

# ISA
Our ISA is going to follow a stack architecture that supports: 

PUSH
Description: Push a 8 bits immediate into stack
Operation: Data<$sp+1> = imm; $sp=$sp+1; $pc = $pc + 1
Syntax: push imm
Encoding: 0 xxxx xxxx

ADD
Description: Add 2 number on top of stack
Operation: Data<$sp-1> = Data<$sp> + Data<$sp-1>; $sp=$sp-1; $pc = $pc + 1
Syntax: add
Encoding: 1 0000 0000

XOR
Description: Exclusive or the top two numbers on the stack
Operation: Data<$sp-1> = Data<$sp> ^ Data<$sp-1>; $sp = $sp - 1; $pc = $pc + 1;
Syntax: xor
Encoding: 1 0000 0001


AND
Description: Ands the top two number of the stack
Operation: Data<$sp-1> = Data<$sp> & Data<$sp-1>; $sp = $sp - 1; $pc = $pc + 1;
Syntax: add
Encoding: 1 0000 0010


SHIFT LEFT
Description: Shift the number on the top of the stack n bits
Operation: Data<$sp> = Data<$sp>  <<  n; $pc = $pc + 1;
Syntax: sln imm
Encoding: 1 1000 xxxx


SHIFT RIGHT
Description: Shift the number on the top of the stack n bits
Operation: Data<$sp> = Data<$sp> >> n; $pc = $pc + 1
Syntax: srn imm
Encoding: 1 1001 xxxx

Load To Stack
Description: Load from memory onto stack
Operation: Data<$sp> = Mem<$MAR>; $pc = $pc + 1;$sp = $sp + 1
Syntax: lds 
Encoding: 1 0000 0011

STORE TO DMEM
Description: Stores the top of stack into memory
Operation: Mem<$MAR> = Data<$sp>; $pc = $pc + 1
Syntax: st
Encoding: 1 0000 0100


BRANCH EQUAL COUNTER
Description: Branch if the counter is equal to the top of stack
Operation: If $cr == Data<$sp>: $pc = Data<$sp-1> else $pc = $pc +1, $sp = $sp-2
Syntax: be
Encoding: 1 0000 0101

BRANCH NOT EQUAL COUNTER
Description: Branch if the counter is not zero
Operation: If $cr != Data<$sp>: $pc = Data<$sp-1> else $pc = $pc +1, $sp = $sp-2
Syntax: bne
Encoding: 1 0000 0110

ADD COUNTER
Description: Adds 0-15 to the counter
Operation: Data<$cr> = Data<$cr> + imm, $pc = $pc +1
Syntax: addc imm
Encoding: 1 1011 xxxx

PUSH IMM TO MAR
Description: Push the value on top of stack to $MAR 
Operation: $MAR = Data<$sp>, <$sp = $sp - 1, $pc = $pc + 1
Syntax: pmar
Encoding: 1 0000 0111

PUSH IMM TO CNT
Description: Push the value on top of stack to $CNT 
Operation: $CNT = Data<$sp>, <$sp = $sp - 1, $pc = $pc + 1
Syntax: pcnt
Encoding: 1 0000 1000

SUB
Description: Ands the top two number of the stack
Operation: Data<$sp-1> = Data<$sp> - Data<$sp-1>; $sp = $sp - 1; $pc = $pc + 1;
Syntax: sub
Encoding: 1 0000 1001

COPY
Description: Make a copy of number on top of the stack
Operation: Data<$sp+1> = Data<$sp>; $sp = $sp + 1; $pc = $pc + 1;
Syntax: cpy
Encoding: 1 0000 1011

LOAD FROM CNT
Description: Load a number from counter register to top of the stack
Operation: Data<$sp+1> = $cr; $sp = $sp + 1; $pc = $pc + 1;
Syntax: ldcnt
Encoding: 1 0000 1100
