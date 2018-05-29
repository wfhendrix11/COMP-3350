TITLE Question2
; Question 2, from HW8

INCLUDE Irvine32.inc

.data

.code
	main PROC
		
		xor eax, eax
		xor ebx, ebx

		mov eax, 1h ; EAX

		add ebx, eax
		shl ebx, 2

		shl ebx, 2
		add ebx, eax
	
		mov eax, ebx
		call writeint
		call crlf

	exit
	main ENDP
END main

