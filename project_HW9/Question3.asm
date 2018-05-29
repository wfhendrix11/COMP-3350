; Question 3, HW9

INCLUDE Irvine32.inc

.data
area = 12 * 20 / 2

.code
main proc
	call firstTwo
	call writeInt
	call crlf

	call closedForm
	call writeInt
	call crlf

	invoke ExitProcess,0
main endp

firstTwo proc
	mov eax, area
	mov ebx, eax
	shr ebx, 2
	add eax, ebx

	ret
firstTwo endp

closedForm proc
	mov eax, area
	push eax

	L1:
		pop ebx
		shr ebx, 2
		jz quit
		add eax, ebx
		push ebx
	jmp L1

	quit:
		ret
closedForm endp

end main
