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

// Put your code here.

(LOOP)
	@SCREEN // first pixel
	D=A
	@addr
	M=D

	@KBD
	D=M
	@BLACK // if user input == 1 .. goto BLACK
	D;JGT

	(WHITE)
		@color
		M=0
		@COLORSCREEN
		0;JMP

	(BLACK)
		@color
		M=-1

	(COLORSCREEN)
		@color
		D=M
		@addr
		A=M
		M=D

		D=A+1
		@32
		D=D+A
		@addr
		M=D

		@24576 // 16384 + 32*16
		D=D-A
		@COLORSCREEN
		D;JLT

	@LOOP
	0;JMP
