TITLE Question5
; Question 5, from HW8

INCLUDE Irvine32.inc

.data
	Apple	WORD 	1214h, 3423h, 6578h, 5699h, 2005h
	Berry	WORD 	4125h, 2345h, 12BCh, 0CDF1h, 1009h
	Cherry	WORD 	5 dup(0)

	Apples	BYTE	"Apple: ", 0
	Berrys	BYTE	"Berry: ", 0
	Cherrys	BYTE	"Cherry: ", 0
	space	BYTE	" ", 0
	var WORD 0

.code
	main PROC

		xor eax, eax
		xor ebx, ebx
		xor esi, esi

		mov ecx, LENGTHOF Apple

		L1:
			mov si, var
			mov ax, Apple[si] 
			mov bx, Berry[si]

			sbb eax, ebx
			mov Cherry[si], ax
			add si, 2
			mov var, si
			loop L1

		xor eax, eax
		xor esi, esi
		mov var, 0

		mov ecx, LENGTHOF Apple
		mov edx, OFFSET Apples
		call WriteString
		L2:
			mov si, var
			mov ax, Apple[si]

			call WriteHex
			add si, 2
			mov var, si

			mov edx, OFFSET space
			call WriteString
			loop L2
		call crlf

		
		xor eax, eax
		xor esi, esi
		mov var, 0

		mov ecx, LENGTHOF Berry
		mov edx, OFFSET Berrys
		call WriteString
		L3:
			mov si, var
			mov ax, Berry[si]

			call WriteHex
			add si, 2
			mov var, si

			mov edx, OFFSET space
			call WriteString
			loop L3
		call crlf

		
		xor eax, eax
		xor esi, esi
		mov var, 0

		mov ecx, LENGTHOF Cherry
		mov edx, OFFSET Cherrys
		call WriteString
		L4:
			mov si, var
			mov ax, Cherry[si]

			call WriteHex
			add si, 2
			mov var, si

			mov edx, OFFSET space
			call WriteString
			loop L4
		call crlf

	exit
	main ENDP
END main

