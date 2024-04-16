;--------------------------------------------------------------------
; LODS: A program to demonstrate loading strings.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
src BYTE 'abc'

.CODE
main PROC
XOR RDX, RDX
XOR R8, R8
XOR R9, R9
LEA RSI, src		; Source address of string.
MOV RDI, RSI		; Copy source address to be desination.
MOV RCX, SIZEOF src	; Number of bytes in source string.

CLD

start:
LODSB				; Copy from source to destination.
SUB AL, 32			; Deduct for uppercase ASCII code.
STOSB				; Store source in destination.
DEC RCX				; Decrement loop counter.
JNZ start			; Test for end of string.

MOV DL, src[0]		; Copy characters to registers.
MOV R8B, src[1]
MOV R9B, src[2]

CALL ExitProcess
main ENDP

END