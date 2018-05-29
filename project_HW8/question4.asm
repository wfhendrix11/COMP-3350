TITLE Question4
; Question 4, from HW8

INCLUDE Irvine32.inc

.data
	X SWORD 2
	Y SWORD 4
	Z SWORD ?

	expression1 BYTE "Expression 1 answer: ",0
	expression2 BYTE "Expression 2 answer:", 0

.code
	main PROC
		
		; Expression 1 Implementation
		xor eax, eax

		mov ax, X
		imul ax, ax		; X^2
		mov Z, ax		; Z = X^2

		mov ax, 2
		imul ax, X		; 2X
		imul ax, Y		; 2XY

		add Z, ax		; Z = X^2 + Y^2

		mov ax, Y
		imul ax, ax		; Y^2

		add Z, ax		; Z = X^2 + 2XY + Y^2

		mov ax, Z

		mov edx, OFFSET expression1
		Call WriteString
		mov edx, OFFSET Z
		call WriteInt

		; Expression 2 Implementation
		xor eax, eax

		mov ax, X
		add ax, Y		; (X+Y)
		imul ax, ax		; (X+Y)^2

		call crlf
		mov edx, OFFSET expression2
		Call WriteString
		mov edx, OFFSET Z
		call WriteInt
		call crlf		

	exit
	main ENDP
END main

