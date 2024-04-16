;--------------------------------------------------------------------
; JMP: A program to demonstrate unconditional branching.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA


.CODE
main PROC
XOR R14, R14
XOR R15, R15
JMP next		; Jump over the next instruction.
MOV R14, 100	; Omitted.
next:
MOV R15, final	; Assign reg/location.
JMP R15			; Jump to location.
MOV R14, 100	; Omitted.
final:			; Location.
CALL ExitProcess
main ENDP

END