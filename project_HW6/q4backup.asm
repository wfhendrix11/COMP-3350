TITLE Question_1.asm
INCLUDE Irvine32.inc

; HW 6, question 1

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	myArray SWORD 10, 20 , 30, 40, 50, 60, 70, 80, 90, 100
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

		mov cx, LENGTHOF myArray
		mov arrayLength, cx ; set arrayLength
		dec arrayLength ; array length = 9

		mov bx, 1 ; index = 1 

		mov ax, myArray[2] ; ax = 20
		mov dx, myArray[6] ; dx = 40

		mov myArray[2], dx
		mov myArray[6], ax

		mov ax, myArray[2] ; ax = 40
		mov dx, myArray[6] ; dx = 20

		mov ax, myArray[10] ; ax = 60
		mov dx, myArray[14] ; dx = 80

		mov myArray[10], dx
		mov myArray[14], ax

		mov ax, myArray[10] ; ax = 80
		mov dx, myArray[14] ; dx = 60

		; PRINT SWAPPED ARRAY
		xor eax, eax
		xor ebx, ebx
		xor ecx, ecx
		xor edx, edx

		mov edx, OFFSET swapped
		call WriteString 
		mov edi, 0 ; set index
		mov cx, LENGTHOF myArray ; initialize loop counter
		L2:
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
			jne L2          ;if ECX != 0 jump back and loop
			call crlf

	invoke ExitProcess,0
	main endp
	end main