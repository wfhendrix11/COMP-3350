TITLE My first assembly program
INCLUDE Irvine32.inc
.DATA
Array DWORD 15 dup(?), 0

.CODE
main PROC
	mov bx, 0
	mov bx, lengthof array
	exit
main ENDP
END main
