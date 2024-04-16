;--------------------------------------------------------------------
; INCNEG: A program to demonstrate inc/decrement & negation.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
var QWORD	99			; Initialize mem.

.CODE
main PROC
XOR RCX, RCX			; Clear reg.
INC var						; Increment mem.
MOV RCX, 51				; Copy reg/imm.
DEC RCX						; Decrement reg.
NEG RCX						; Negate reg.
CALL ExitProcess
main ENDP
END