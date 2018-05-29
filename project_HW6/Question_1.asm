TITLE Question_1.asm
INCLUDE Irvine32.inc

; HW 6, question 1

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	dog SWORD	8
	cat SWORD	-25
	mouse SWORD	-36
	horse SWORD -102

.code
	main proc
		xor eax, eax

		mov ax, dog
		add ax, cat
		sub ax, mouse
		add ax, horse

	invoke ExitProcess,0
	main endp
	end main