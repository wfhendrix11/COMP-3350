TITLE HW7 Question 1
; Question 2, from Homework 7

INCLUDE Irvine32.inc

.data

myName BYTE "William Hendrix", 0
studentId = 076

.code
	main PROC
		
		; print plain text
		mov edx, OFFSET myName
		call WriteString
		call crlf

		call encode ; encode myName

		; print cipher text
		mov edx, OFFSET myName
		call WriteString
		call crlf

		call encode ; decode myName

		; print decoded text
		mov edx, OFFSET myName
		call WriteString
		call crlf

		exit

	main ENDP

	encode proc
		mov ecx, SIZEOF myName
		xor esi, esi

		; xor each element
		L1: XOR myName[esi], studentID
		inc esi
		loop L1

		ret
	encode endp

end main
