TITLE Question_2.asm
; HW6 Question 2.

INCLUDE C:/Irvine/Irvine32.inc
INCLUDELIB C:/Irvine/Irvine32.lib

.data
	prompt BYTE "Please enter a value: ",0
	oranges SWORD 15 DUP(?)
	printIntro BYTE "The values you entered are: ",0
	separator BYTE ", ",0

.code
	main proc
		xor ebx, ebx
		xor ecx, ecx

		mov cl, LENGTHOF oranges
		promptUser:
			mov bx, SIZEOF oranges
			sub bx, cx
			sub bx, cx

			mov edx, OFFSET prompt
			call WriteString

			call ReadInt
			mov oranges[bx], ax
		loop promptUser

		xor eax, eax

		call crlf
		mov edx, OFFSET printIntro
		call WriteString

		mov cl, LENGTHOF oranges
		printArray:
			mov bx, SIZEOF oranges
			sub bx, cx
			sub bx, cx

			movsx eax, oranges[bx]
			call WriteInt

			mov edx, OFFSET separator
			call WriteString
		loop printArray
		call crlf

	main endp
	end main