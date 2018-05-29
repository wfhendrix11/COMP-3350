TITLE Question_4.asm
INCLUDE Irvine32.inc

; HW 6, question 4

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	myArray SWORD 10, 20 , 30, 40, 50
	arrayLength WORD ?
	index WORD ?
	spacing BYTE ", ",0
	original BYTE "The original array is: ",0
	swapped BYTE "The swapped array is: ",0

.code
	main proc
		
		xor eax, eax ; 

		; PRINT ORIGINAL ARRAY
		mov edx, OFFSET original
		call WriteString 

		mov edi, 0 ; set index
		mov cx, LENGTHOF myArray ; initialize loop counter
		L1:
			; print element
			mov ax, myArray[edi]
			call WriteInt

			;print space
			mov edx, OFFSET spacing
			call WriteString

			inc edi
			inc edi
			dec cx
			cmp cx, 0		;compare ECX and 0
			jne L1          ;if ECX != 0 jump back and loop
			call crlf
        
		; SWAP ELEMENTS
		xor eax, eax
		xor ebx, ebx
		xor ecx, ecx
		xor edx, edx

		mov cx, LENGTHOF myArray ; initialize loop counter
		mov bx, 2  ; initialize index
		L2:
			mov ax, myArray[bx] ; ax = 20
			mov dx, myArray[bx + 4] ; dx = 40

			mov myArray[bx], dx
			mov myArray[bx + 4], ax

			mov ax, myArray[bx] ; ax = 40
			mov dx, myArray[bx + 4] ; dx = 20

			add bx, 8

			sub cx, 4
			cmp cx, 3		; compare ECX and 3
			jg L2           ; jump if > 3

		; PRINT SWAPPED ARRAY
		xor eax, eax
		xor ebx, ebx
		xor ecx, ecx
		xor edx, edx

		mov edx, OFFSET swapped
		call WriteString 
		mov edi, 0 ; set index
		mov cx, LENGTHOF myArray ; initialize loop counter
		L3:
			; print element
			mov ax, myArray[edi]
			call WriteInt

			;print space
			mov edx, OFFSET spacing
			call WriteString

			inc edi
			inc edi
			dec cx
			cmp cx, 0		;compare ECX and 0
			jne L3          ;if ECX != 0 jump back and loop
			call crlf

				

	invoke ExitProcess,0
	main endp
	end main