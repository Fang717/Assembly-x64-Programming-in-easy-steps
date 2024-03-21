;--------------------------------------------------------------------
; CMPS: A program to demonstrate string comparison.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
src BYTE 'abc'
dst BYTE 'abc'
match BYTE ?

.CODE
main PROC
LEA RSI, src		; Address of 1st string.
LEA RDI, dst		; Address of 2nd string.
MOV RCX, SIZEOF src	; Number of bytes in 1st string.

CLD					; Clear direction flag.
REPE CMPSB			; Compare characters. 

JNZ differ			; If zero flag is set, branch to location #1.
MOV match, 1		; Else assign 1 if zero flag is not set...
JMP finish			; Then branch to location #2.

differ:				; Location #1.
MOV match, 0		; Assign 0 if different.
finish:				; Location #2.

CALL ExitProcess
main ENDP

END