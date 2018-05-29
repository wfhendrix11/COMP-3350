TITLE Question1
; Question 1, from HW8

INCLUDE Irvine32.inc

.data

.code
	main PROC
		
		xor eax, eax
		xor ecx, ecx

		mov cl, 3
		mov al, 45h			
		rol al, cl		; 	 al = 
		mov al, 7Ah
		mov cl, 1
		ror al, Cl 		; 	 al = 
		stc
		mov al, 64h
		mov cl, 2
		rcl al, cl		; 	 al = 
		stc
		mov al, 3Dh
		mov cl, 1
		rcr al, cl		; 	 al = 

	exit
	main ENDP
END main

