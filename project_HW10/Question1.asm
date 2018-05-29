; HW10, Question 1

INCLUDE Irvine32.inc

.data
	table BYTE 89, 'A',0
					rowSize = ($ - table)
			   BYTE 79, 'B',0
			   BYTE 69, 'C',0
			   BYTE 59, 'D',0
			   BYTE  0, 'F',0
	numRows = ($ - table) / rowSize

	input BYTE "Enter a score: ",0
	original BYTE "Original Score: ",0
	final BYTE "Final Score: ",0
	letter BYTE "Letter Grade: ",0

.code
	main proc

		mov edx, offset input
		call writeString
		call readDec

		mov edx, offset original
		call writeString
		call writeDec
		call crlf

		add eax, 1
		mov edx, offset final
		call writeString
		call writeDec
		call crlf

		mov edx, offset letter
		call writeString

		mov ebx, offset table
		mov ecx, numRows
		L1:
			cmp al, BYTE PTR [ebx]
			jb next

			mov edx, ebx
			inc edx
			jmp quit

			next:
				add ebx, rowSize
		loop L1
		quit:

		call writeString
		call crlf

	exit
main endp
end main