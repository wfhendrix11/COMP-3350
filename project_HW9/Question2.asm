; Question 2, HW9

INCLUDE Irvine32.inc

.data
auburnID BYTE 00h, 09, 00h, 02h, 08h, 00h, 09h, 05h, 07h, 06h
auburnIDRev BYTE 10 DUP(0)
result BYTE 10 DUP(0)

.code
main proc
	mov esi, offset auburnID
	mov edi, offset auburnIDRev
	mov ecx, lengthof auburnID

	call reverse
	call addID

	mov esi, offset auburnID
	call print
	call crlf

	mov esi, offset auburnIDRev
	call print
	call crlf

	mov esi, offset result
	call print
	call crlf

	invoke ExitProcess,0
main endp

reverse proc
	push ecx
	xor eax, eax

	L1:
		dec ecx
		mov ebx, ecx
		mov al, [esi[ebx]]
		mov byte ptr [edi[ebx]], al
		inc ecx
	loop L1

	pop ecx
	push ecx
	dec ecx
	mov eax, ecx
	L2:
		push ecx
		mov edx, ecx
		L3:
			mov ebx, eax
			add ebx, ecx
			sub ebx, edx
			dec ebx
			ror word ptr [edi[ebx]], 8
		loop L3
		pop ecx
	loop L2

	pop ecx
	ret
reverse endp

AddID proc
	push ecx
	clc
	pushf
	xor eax, eax

	L1:
		dec ecx
		mov ebx, ecx
		mov al, [esi[ebx]]
		popf
		adc al, [edi[ebx]]
		aaa
		pushf
		mov result[ebx], al

		inc ecx
	loop L1

	popf
	pop ecx

	ret
addID endp

print proc
	push ecx
	xor eax, eax
	mov edx, ecx

	L1:
		mov ebx, edx
		sub ebx, ecx
		mov al, [esi[ebx]]
		call writeInt
	loop L1
	pop ecx

	ret
print endp

end main
