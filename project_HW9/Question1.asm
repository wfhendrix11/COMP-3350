; Question 1, HW9

INCLUDE Irvine32.inc

.data
myArray WORD 10 DUP(?)
comma BYTE ", ", 0

.code
main proc
	mov esi, OFFSET myArray
	mov eax, LENGTHOF myArray
	lea ecx, [eax]
		
	call fibonacci

	call printArray

	invoke ExitProcess,0
main endp

fibonacci PROC
	push ecx
	mov edx, ecx
	L1:
		mov ebx, edx
		sub ebx, ecx
		jz continue

		cmp ebx, 1
		je one

		mov al, [esi[ebx-2]]
		mov ah, [esi[ebx-1]]
		mov byte ptr [esi[ebx]], al
		add byte ptr [esi[ebx]], ah
		jmp continue

		one:
			mov byte ptr [esi[ebx]], 1
		continue:
	loop L1

	pop ecx
	ret
fibonacci ENDP 

printArray PROC
	push ecx
	xor eax, eax
	mov edx, ecx

	print:
		mov ebx, edx
		sub ebx, ecx

		mov al, [esi[ebx]]
		call writeInt

		cmp ecx, 1
		je continue

		push edx
		mov edx, offset comma
		call writeString
		pop edx

		continue:
	loop print

	call crlf
	pop ecx
	ret
printArray ENDP

end main
