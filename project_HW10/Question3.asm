; HW10, Question 1

INCLUDE Irvine32.inc

.data
	celsiusIs BYTE " Celsius is ",0
	space BYTE " ",0
	slash BYTE "/",0
	Farhenheit BYTE " Farhenheit.",0

.code
	main proc
		; Freezing
		mov eax, 0
		call convert

		; Boiling
		mov eax, 100
		call convert

		; Room Temp
		mov eax, 23
		call convert

		; Human Temp
		mov eax, 37
		call convert

		exit
	main endp

	convert proc
		mov edx, offset celsiusIs
		call writeInt
		call writeString

		mov ebx, 9
		imul ebx
		mov ebx, 5
		idiv ebx
		add eax, 32

		call writeInt

		cmp edx, 0
		jz skipFraction

		mov eax, edx
		mov edx, offset space
		call writeString
		call writeDec
		mov edx, offset slash
		call writeString
		mov eax, 5
		call writeDec

		skipFraction:
		mov edx, offset Farhenheit
		call writeString
		call crlf

		ret
	convert endp
end main