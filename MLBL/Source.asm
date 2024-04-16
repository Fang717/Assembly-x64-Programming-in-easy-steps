;--------------------------------------------------------------------
; MLBL: A program to demonstrate local labels.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

power MACRO base:REQ, exponent:REQ
LOCAL start, finish		; Local symbols.
MOV RAX, 1
MOV RCX, exponent		; Load count.
CMP RCX, 0				; Test for end...
JE finish				; Branch to location #2.
MOV RBX, base			; Else load factor.
start:					; Location #1.
MUL RBX					; Multiply factor times exponent.
LOOP start				; Branch to location #1.
finish:					; Location #2.
ENDM

.DATA



.CODE
main PROC
power 4,2			; Pass 2 args.
power 4,3			; Pass 2 args.
CALL ExitProcess
main ENDP


END