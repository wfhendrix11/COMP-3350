TITLE Question1
; Question 1, from HW8

INCLUDE Irvine32.inc

.data

.code
	main PROC
		
		xor edx, edx
		xor eax, eax

		mov eax, 0A24E6C8Dh

		and al, 11110000b
		mov dl, al
		shr eax, 4
		shr edx, 4
		shr eax, 4
		and al, 11110000b
		add dl, al
		shr eax, 4

		shr eax, 4
		and al, 11110000b
		shr eax, 4
		mov dh, al

		mov eax, edx
		call writehex
		call crlf



	exit
	main ENDP
END main

