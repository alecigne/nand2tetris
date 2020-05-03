// Array.asm
// Set 10 first value of an array stored in RAM[100] to -1

// parameter arr: pointer to array in memory
// value 100
@100
D=A
@arr
M=D

// parameter n: max number of iterations
// value 10
@10
D=A
@n
M=D

// var i: memory offset relative to arr
// initial value 0
@i
M=0

(LOOP)
  // if (i == n) then stop
  @i
  D=M
  @n
  D=D-M
  @END
  D;JEQ

  // RAM[arr+i] = -1
  @arr
  D=M
  @i
  A=D+M
  M=-1

  // i++
  @i
  M=M+1

  @LOOP
  0;JMP

(END)
  @END
  0;JMP
