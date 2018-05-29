TITLE Question3.asm
INCLUDE Irvine32.inc

; HW6 Question 3



.data
	oranges SWORD 10 DUP(?)
	minVal SWORD 7FFFh
	nextToMin SWORD ?
	minIndex BYTE ?
	nextToMinIndex BYTE ?
	maxVal SWORD 8000h
	nextToMax SWORD ?
	nextToMaxIndex BYTE ?
	maxIndex BYTE ?

	prompt  BYTE "Please input a value: ",0
	spacing BYTE ", ",0
	minV BYTE "The next to minimum value of inputs is: ",0
	minL BYTE "and is located at index: ",0
	maxV BYTE "The next to maximum value of inputs is: ",0
	maxL BYTE "and is located at index: ",0

.code
	; find next to min and next to max
	MinMax proc
		xor ebx, ebx
		xor ecx, ecx
		xor edx, edx
		mov cx, LENGTHOF oranges
		traverse:
			mov bx, SIZEOF oranges
			sub bx, cx
			sub bx, cx

			mov ax, oranges[bx]

			; if current < min
			cmp ax, minVal 
			jl changeMin 		

			; if current < nextToMin
			cmp ax, nextToMin
			jl changeNextToMin ; jump if ax < nextToMin

			jmp compareMax

			changeNextToMin:
				mov nextToMin, ax
				mov minIndex, bl
				jmp compareMax

			changeMin:
				mov dx, minVal ; move current min value to dx
				mov nextToMin, dx ; move current min value to nextToMin
				mov minVal, ax
				jmp compareMax

			compareMax:
				; if current > max
				cmp ax, maxVal
				jg changeMax
				jmp doNothing
				
			changeMax:
				mov dx, maxVal
				mov nextToMax, dx
				mov maxIndex, bl
				mov maxVal, ax
				jmp doNothing


			doNothing:
		loop traverse

		xor eax, eax
		xor edx, edx
		mov ah, maxIndex
		mov al, minIndex
		mov ebx, 2
		div ebx
		mov maxIndex, ah
		mov minIndex, al
		ret
	MinMax endp

	main proc
		xor ebx, ebx
		xor ecx, ecx

		mov cl, LENGTHOF oranges

		; get user input
		promptUser:
			mov bx, SIZEOF oranges
			sub bx, cx
			sub bx, cx

			mov edx, OFFSET prompt
			call WriteString

			call ReadInt
			mov oranges[bx], ax
		loop promptUser

		call MinMax

		; print text and next to min with index
		mov edx, OFFSET minV
		movsx eax, nextToMin
		call WriteString
		call WriteInt
		mov edx, OFFSET spacing
		call WriteString
		mov edx, OFFSET minL
		movzx eax, minIndex
		call WriteString
		call WriteDec
		call crlf

		; print text with next to max with index
		mov edx, OFFSET maxV
		movsx eax, nextToMax
		call WriteString
		call WriteInt
		mov edx, OFFSET spacing
		call WriteString
		mov edx, OFFSET maxL
		movzx eax, maxIndex
		dec eax
		call WriteString
		call WriteDec
		call crlf
	main endp
	end main