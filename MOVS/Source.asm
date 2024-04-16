;--------------------------------------------------------------------
; MOVS: A program to demonstrate copying characters.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
src BYTE 'abc'
dst BYTE 3 DUP (?)   

.CODE
main PROC
XOR RDX,RDX		
XOR R8, R8
XOR R9, R9
LEA	RSI, src		; Start address of string.
LEA RDI, dst		; Start address of empty array.
MOV RCX, SIZEOF src	; Number of bytes in string.

CLD					; Clear direction flag.
REP MOVSB			; Copy all characters from source to destination.

MOV DL, dst[0]		; Assign characters to registers.
MOV R8B, dst[1]
MOV R9B, dst[2]

CALL ExitProcess
main ENDP

END