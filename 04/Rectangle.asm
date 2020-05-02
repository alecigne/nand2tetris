// Rectangle.asm
// Draw a rectangle 16 px wide and RAM[0] px long in the screen's top left
// corner

// parameter height: height of the rectangle
// value read from RAM[0]
@R0
D=M
@height
M=D

// var address: pointer to current row
// initial value SCREEN
@SCREEN
D=A
@address
M=D

// var i: memory offset relative to arr
// initial value 0 (first row)
@i
M=0

(LOOP)
  // if (i > height) then stop
  @i
  D=M
  @height
  D=D-M
  @END
  D;JGT

  // set first register of current row to -1
  @address
  A=M
  M=-1

  // store next row
  @i
  M=M+1
  @32
  D=A
  @address
  M=M+D

  @LOOP
  0;JMP

(END)
  @END
  0;JMP
