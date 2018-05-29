TITLE HW7 Question 3 part B
; Question 3 part B, from Homework 7

INCLUDE Irvine32.inc

.data
	Pear BYTE ? ; Pear 
	val1 WORD 0h ; val1
	message BYTE "Pear is: ", 0

.code
	main PROC

		xor ebx, ebx
		xor ecx, ecx

		; 0 0 0
		mov cx, 0
		mov bx, 0
		mov val1, 0
		call B

		; 0 0 1
		mov cx, 0
		mov bx, 0
		mov val1, 1
		call B

		; 0 1 0 
		mov cx, 0
		mov bx, 1
		mov val1, 0
		call B

		; 0 1 1 
		mov cx, 0
		mov bx, 1
		mov val1, 1
		call B

		; 1 0 0 
		mov cx, 1
		mov bx, 0
		mov val1, 0
		call B

		; 1 0 1 
		mov cx, 1
		mov bx, 0
		mov val1, 1
		call B

		; 1 1 0 
		mov cx, 1
		mov bx, 1
		mov val1, 0
		call B

		; 1 1 1 
		mov cx, 1
		mov bx, 1
		mov val1, 1
		call B
	
		exit
		main ENDP
	
	B PROC
		; if (bx = cx) then Pear = 1
		cmp bx, cx
		je setToOne

		; if (cx >= val1) then Pear = 1
		cmp cx, val1
		jge setToOne

		; else Pear = 0
		mov Pear, 0
		jmp done

	setToOne:
		mov Pear, 1

	done:
		mov edx, OFFSET message
		call writestring

		xor eax, eax
		mov al, Pear
		call writeint
		call crlf
		ret

	exit 
	B ENDP
	END main
