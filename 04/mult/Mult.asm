// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Initialize answer to 0
@R2
M=0

// R0 will drive the main loop. If R1 >= R0, then go to LOOP, else flip
// them first. This avoids looping 5000 times if R0 = 5000 and R1 = 1 (or
// "worse", R1 = 0).
@R1
D=M
@R0
D=D-M
@LOOP
D;JGE // R1 - R0 >= 0

// Else flip R0 and R1
@R0
D=M
@tmp
M=D
@R1
D=M
@R0
M=D
@tmp
D=M
@R1
M=D

(LOOP)
  // if R0 = 0, stop
  @R0
  D=M
  @END
  D;JEQ

  @R1
  D=M
  @R2
  M=M+D

  @R0
  M=M-1

  @LOOP
  0;JMP

(END)
  @END
  0;JMP
