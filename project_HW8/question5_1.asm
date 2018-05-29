TITLE question5
; Question 5, from HW8

INCLUDE Irvine32.inc

.data

.code
	main proc
		push 10
		push 20
		call Ex2Sub
		pop eax
		exit
	main endp

	Ex2Sub PROC
		pop eax
		ret
	Ex2Sub ENDP
end main