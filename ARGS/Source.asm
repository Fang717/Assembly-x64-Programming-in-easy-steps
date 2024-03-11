;--------------------------------------------------------------------
; ARGS: A program to demonstrate register arguments.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
arr QWORD 100, 150, 250

.CODE

sum PROC
XOR RAX, RAX
start:
ADD RAX, [RDX]		; Assign data from address.
ADD RDX, 8			; Increment address for qword size.
DEC RCX				; Decrement array length counter.
JNZ start			; Repeat if not final element.
RET
sum ENDP

main PROC
MOV RCX, LENGTHOF arr	; Store array length.
LEA RDX, arr			; Store array address.
CALL sum				

CALL ExitProcess
main ENDP

END
