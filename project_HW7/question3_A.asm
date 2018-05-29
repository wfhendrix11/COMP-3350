TITLE HW7 Question 1
; Question 2, from Homework 7

INCLUDE Irvine32.inc

.data
	Apple BYTE ? ; Apple
	val1 WORD 0h ; val1
	message BYTE "Apple is: ", 0

.code
	main PROC

		; zero out
		xor ebx, ebx
		xor ecx, ecx

		; 0 0 0 
		mov cx, 0
		mov bx, 0
		mov val1, 0
		call A

	    ; 0 0 1
		mov cx, 0
		mov bx, 0
		mov val1, 1
		call A

		; 0 1 0
		mov cx, 0
		mov bx, 1
		mov val1, 0
		call A

		; 0 1 1 
		mov cx, 0
		mov bx, 1
		mov val1, 1
		call A

		; 1 0 0 
		mov cx, 1
		mov bx, 0
		mov val1, 0
		call A

		; 1 0 1
		mov cx, 1
		mov bx, 0
		mov val1, 1
		call A

		; 1 1 0 
		mov cx, 1
		mov bx, 1
		mov val1, 0
		call A

		; 1 1 1 
		mov cx, 1
		mov bx, 1
		mov val1, 1
		call A
	
		exit
		main ENDP
	
	; compare procedure for A
	A PROC
		; if (cx = bx) then Apple = 1
		cmp bx, cx
		jne setToOne ; jmp if not equal

		; if (cx >= val1) then Apple = 1
		cmp cx, val1
		jl setToOne ; jmp if less

		; else Apple = 1
		mov Apple, 1
		jmp done

	setToOne:
		mov Apple, 0

	done:
		mov edx, OFFSET message
		call writestring

		mov eax, 0
		mov al, Apple
		call writeint
		call crlf
		ret

		exit 
	A ENDP
END main
