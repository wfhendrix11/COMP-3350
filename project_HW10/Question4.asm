; HW10, Question 4

INCLUDE Irvine32.inc

.data
	string1 BYTE "William Hendrix",0
	string2 BYTE "2001: A Space Odessey",0
	string3 BYTE "Children of Men",0
	string4 BYTE "Ex Machina",0

	array BYTE 50 DUP(?)

	char1 BYTE "u",0
	char2 BYTE "1",0
	char3 BYTE "o",0
	char4 BYTE "z",0

	stringDisplay BYTE "String: ",0
	charIndex BYTE "the index of ",0
	is BYTE " is ",0
	dash BYTE " - ",0
	notFound BYTE " was not found in the string...",0

.code
	main proc
		mov esi, offset string1
		mov eax, offset char1
		mov ecx, lengthof string1
		call find

		mov esi, offset string2
		mov eax, offset char2
		mov ecx, lengthof string2
		call find

		mov esi, offset string3
		mov eax, offset char3
		mov ecx, lengthof string3
		call find

		mov esi, offset string4
		mov eax, offset char4
		mov ecx, lengthof string4
		call find

		exit
	main endp

	find proc
		mov edx, esi
		call writeString
		mov edx, offset dash
		call writeString

		mov edi, offset array
		mov dl, BYTE PTR([eax])
		mov ebx, ecx
		L1:
			movsb
			cmp dl, BYTE PTR([edi - 1])
			jne next

			mov edi, ebx
			sub edi, ecx
			jmp exitLoop
			
			next:
		loop L1
		mov edi, -1

		exitLoop:
		cmp edi, -1
		je indexNotFound

		mov edx, offset charIndex
		call writeString
		mov edx, eax
		call writeString
		mov edx, offset is
		call writeString
		mov eax, edi
		call writeInt
		jmp return

		indexNotFound:
			mov edx, eax
			call writeString
			mov edx, offset notFound
			call writeString

		return:
			call crlf
			ret
	find endp
end main