// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(CLEAR)
// Init program by clearing the screen
@state
M=0
@SCREEN_TO_STATE
0;JMP

(LISTEN_KBD)
// Listen to the kbd: if a key is pressed, set screen to state -1 (black)
@KBD
D=M
@LISTEN_KBD
D;JEQ
@state
M=-1

(SCREEN_TO_STATE)
// var word: pointer to selected word in screen memory map
// initial value 24575 (last word of screen memory map)
@24575
D=A
@word
M=D

(DRAW_LOOP)
// Get state
@state
D=M
// Write state in selected word
@word
A=M
M=D
// Decrement pointer
@word
M=M-1
// Compare pointer value to first word in screen memory map
D=M
@SCREEN
D=D-A
// Loop if not reached
@DRAW_LOOP
D;JGE

// If we're clearing the screen (state 0), no need to check if a key is still
// pressed, go back to listening for kbd input
@state
D=M
@LISTEN_KBD
D;JEQ

// Otherwise we wait for the key to be released then we clear the screen
(STILL_PRESSED)
@KBD
D=M
@STILL_PRESSED
D;JNE
@CLEAR
0;JMP
