;--------------------------------------------------------------------
; STOS: A program to demonstrate storing strings.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
dst BYTE 3 dup(?)

.CODE
main PROC
XOR RDX, RDX
XOR R8, R8
XOR R9, R9
MOV AL, 'A'			; Initialize source.
LEA RDI, dst		; Address of desination.
MOV RCX, SIZEOF dst	; Number of bytes in destination.

CLD					; Clear direction flag.
REP STOSB			; Store bytes from source to destination.

MOV DL, dst[0]		; Assign stored character to registers.
MOV R8B, dst[1]
MOV R9B, dst[2]


CALL ExitProcess
main ENDP

END