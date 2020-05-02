// Add two numbers
// RAM[2] = RAM[0] + RAM[1]
@R0
D=M

@R1
D=D+M

@R2
M=D

(END)
@END
0; JMP
