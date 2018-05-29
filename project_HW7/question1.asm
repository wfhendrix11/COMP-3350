TITLE HW7 Question 1
; Question 1, from Homework 7

INCLUDE Irvine32.inc

.data
	array1 SWORD -2, -4, -6, -8, -10, -12, -14, -16			; all negative even values
	array2 SWORD 1, 3, 5, 7, 9, 11, 13, 15					; all positive odd values
	array3 SWORD 3, -1, 6, -4, -7, 2, 9, -5					; mixed negative and positive values 1
	array4 SWORD -4, 8, -9, 3, -1, 4, -5, 7					; mixed negative and positive values 2

	; prompts to the user
	message1  BYTE "Positive even number found: ", 0
	message2  BYTE "No positive even number found...", 0

.code
	main PROC

		; test array1
		mov esi, OFFSET array1
		mov ecx, LENGTHOF array1

		call findPosEvenNum
		
		; test array2
		mov esi, OFFSET array2
		mov ecx, LENGTHOF array2

		call findPosEvenNum

		; test array3
		mov esi, OFFSET array3
		mov ecx, LENGTHOF array3

		call findPosEvenNum

		; test array4
		mov esi, OFFSET array4
		mov ecx, LENGTHOF array4

		call findPosEvenNum

		exit
	main ENDP

; find the first positive even number 
findPosEvenNum PROC

	mov eax, 1

	L1:
		test BYTE PTR [esi], 080h
		jz isZero ; jmp if 0


		; not found...
		notFOund:
		add esi, TYPE array1
		loop L1
		mov edx, OFFSET message2 ; print NOT found
		call writestring
		call crlf
		ret

	isZero:
		AND eax, [esi]
		jz done ; jmp if 0
		jnz notFound ; jmp if not 0

	; if positive even number is found...
	done:
		mov edx, OFFSET message1 ; print FOUND
		call writestring
		xor eax, eax ; zero out
		mov al, [esi]
		call writeint
		add edi, TYPE array1
		call crlf
		ret

	findPosEvenNum ENDP

END main
