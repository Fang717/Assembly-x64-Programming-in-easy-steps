;--------------------------------------------------------------------
; FILL: A program to demonstrate addressing via destination index.
;--------------------------------------------------------------------


INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
arr QWORD 0, 0, 0
cpy QWORD 3 dup (0)

.CODE
main PROC

LEA RDI, arr	; Copy address of 1st array start into rdi.
MOV RCX, 0		; Initialize loop counter.
MOV RDX, 10		; Initialize data values of zero.

start:						; Location #1.
MOV [RDI + RCX * 8], RDX	; Copy data value into array element.
ADD RDX, 10					; Increase data value.
INC RCX						; Increment loop counter.
CMP RCX, LENGTHOF arr		; Test for end of array.
JNE start					; Else branch to location #1.

MOV R10, arr[0*8]			; Copy 1st array elements into registers.
MOV R11, arr[1*8]
MOV R12, arr[2*8]

LEA RSI, arr				; Copy address of 1st array start into rsi.
LEA RDI, cpy				; Copy address of 2nd array start into rdi.
MOV RCX, LENGTHOF arr		; Reset loop counter.
CLD							; Clear direction flag.
REP MOVSQ					; Copy element values from 1st array to 2nd array.

MOV R13, cpy[0*8]			; Copy 2nd array elements into registers.
MOV R14, cpy[1*8]
MOV R15, cpy[2*8]

CALL ExitProcess
main ENDP

END