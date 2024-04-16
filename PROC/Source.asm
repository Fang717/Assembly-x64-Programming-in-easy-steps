;--------------------------------------------------------------------
; PROC: A program to demonstrate procedures.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
var QWORD ?

.CODE
zeroRAX PROC
XOR RAX, RAX		; Clear reg.
RET
zeroRAX ENDP


main PROC

MOV RAX, 8			; Assign imm.
CALL zeroRAX		; Call proc.

CALL ExitProcess
main ENDP

END