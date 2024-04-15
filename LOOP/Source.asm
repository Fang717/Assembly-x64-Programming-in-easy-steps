;--------------------------------------------------------------------
; LOOP: A program to demonstrate loop structures.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA


.CODE
main PROC
XOR RDX, RDX
MOV RCX, 0
start:			; Location #1.
MOV RDX, RCX	;0, 1, 2.
INC RCX			;1, 2, 3.
CMP RCX, 3		;3 == 3 ?
JE finish		; Branch to location #2.
JMP start		; Else branch to location #1.
finish:			; Location #2.
CALL ExitProcess
main ENDP

END