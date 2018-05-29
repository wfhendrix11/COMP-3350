; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

.code
main proc
	
	mov eax, 0
	mov al, -1
	add al, 130

	invoke ExitProcess,0
main endp
end main