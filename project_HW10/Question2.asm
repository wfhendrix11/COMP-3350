; HW10, Question 2

INCLUDE Irvine32.inc

.data
	source BYTE "Will Hendrix",0
	target BYTE 25 DUP (?)
	sourceString BYTE "Source string: ",0
	targetString BYTE "Target string: ",0

.code
	main proc

		mov esi, offset source
		mov edi, offset target
		mov ecx, lengthof source
		rep movsb

		mov edx, offset sourceString
		call writeString
		mov edx, offset source
		call writeString
		call crlf

		mov edx, offset targetString
		call writeString
		mov edx, offset target
		call writeString
		call crlf

	exit
main endp
end main