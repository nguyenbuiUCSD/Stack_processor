# Stack_processor
Our ISA is going to follow a stack architecture that supports: 
PUSH
Description:
 Push a 8 bits immediate into stack
Operation:
Data<$sp+1> = imm; $sp=$sp+1; $pc = $pc + 1
Syntax:
push imm
Encoding:
0 xxxx xxxx

ADD
Description:
 Add 2 number on top of stack
Operation:
Data<$sp-1> = Data<$sp> + Data<$sp-1>; $sp=$sp-1; $pc = $pc + 1
Syntax:
add
Encoding:
1 0000 0000

XOR
Description:
Exclusive or the top two numbers on the stack
Operation:
Data<$sp-1> = Data<$sp> ^ Data<$sp-1>; $sp = $sp - 1; $pc = $pc + 1;
Syntax:
xor
Encoding:
1 0000 0001


AND
Description:
Ands the top two number of the stack
Operation:
Data<$sp-1> = Data<$sp> & Data<$sp-1>; $sp = $sp - 1; $pc = $pc + 1;
Syntax:
add
Encoding:
1 0000 0010


Shift Left n bits
Description:
Shift the number on the top of the stack n bits
Operation:
Data<$sp> = Data<$sp>  <<  n; $pc = $pc + 1;
Syntax:
sln imm
Encoding:
1 1000 xxxx


Shift Right n bits
Description:
Shift the number on the top of the stack n bits
Operation:
Data<$sp> = Data<$sp> >> n; $pc = $pc + 1
Syntax:
srn imm
Encoding:
1 1001 xxxx

Load To Stack
Description:
Load from memory onto stack
Operation:
Data<$sp> = Mem<$MAR>; $pc = $pc + 1;$sp = $sp + 1
Syntax:
lds 
Encoding:
1 0000 0011

Store To Memory
Description:
Stores the top of stack into memory
Operation:
Mem<$MAR> = Data<$sp>; $pc = $pc + 1
Syntax:
st
Encoding:
1 0000 0100


Branch Equal Counter
Description:
Branch if the counter is equal to the top of stack
Operation:
If $cr == Data<$sp>: $pc = Data<$sp-1> else $pc = $pc +1, $sp = $sp-2
Syntax:
be
Encoding:
1 0000 0101

Branch Not Equal Counter
Description:
Branch if the counter is not zero
Operation:
If $cr != Data<$sp>: $pc = Data<$sp-1> else $pc = $pc +1, $sp = $sp-2
Syntax:
bne
Encoding:
1 0000 0110


Branch Equal MAR
Description:
Branch if the counter is zero
Operation:
If $mar == Data<$sp>: $pc = Data<$sp-1> else $pc = $pc +1, $sp = $sp-2
Syntax:
bemar
Encoding:
1 0000 1110

Branch Not Equal MAR
Description:
Branch if the counter is not zero
Operation:
If $mar != Data<$sp>: $pc = Data<$sp-1> else $pc = $pc +1, $sp = $sp-2
Syntax:
bnemar
Encoding:
1 0000 1111


Add Counter
Description:
Adds 0-15 to the counter
Operation:
Data<$cr> = Data<$cr> + imm, $pc = $pc +1
Syntax:
addc imm
Encoding:
1 1011 xxxx

ADD MAR
Description:
 Add 0-15 to MAR
Operation:
$MAR = $MAR + imm, $pc = $pc +1
Syntax:
amar imm
Encoding:
1 1100 xxxx
Push Address to MAR
Description:
 Push the value on top of stack to $MAR 
Operation:
$MAR = Data<$sp>, <$sp = $sp - 1, $pc = $pc + 1
Syntax:
pmar
Encoding:
1 0000 0111


Push Imm to Counter Register
Description:
 Push the value on top of stack to $CNT 
Operation:
$CNT = Data<$sp>, <$sp = $sp - 1, $pc = $pc + 1
Syntax:
pcnt
Encoding:
1 0000 1000

SUB
Description:
Ands the top two number of the stack
Operation:
Data<$sp-1> = Data<$sp> - Data<$sp-1>; $sp = $sp - 1; $pc = $pc + 1;
Syntax:
sub
Encoding:
1 0000 1001

POP
Description:
Removes the value at the top of the stack
Operation:
$sp = $sp - 1; $pc = $pc + 1;
Syntax:
pop
Encoding:
1 0000 1010

COPY
Description:
Make a copy of number on top of the stack
Operation:
Data<$sp+1> = Data<$sp>; $sp = $sp + 1; $pc = $pc + 1;
Syntax:
cpy
Encoding:
1 0000 1011

LOAD from Count Register to stack
Description:
Load a number from counter register to top of the stack
Operation:
Data<$sp+1> = $cr; $sp = $sp + 1; $pc = $pc + 1;
Syntax:
ldcnt
Encoding:
1 0000 1100


LOAD from Memory address Register to stack
Description:
Load a number from memory address register to top of the stack
Operation:
Data<$sp+1> = $mar; $sp = $sp + 1; $pc = $pc + 1;
Syntax:
ldmar
Encoding:
1 0000 1101
