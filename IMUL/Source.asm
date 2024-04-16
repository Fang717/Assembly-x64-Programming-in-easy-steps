;--------------------------------------------------------------------
; IMUL: A program to demonstrate signed number multiplication.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
var QWORD 4			; Initialize mem.

.CODE
main PROC
XOR RAX, RAX		; Clear reg.
XOR RBX, RBX		; Clear reg.
MOV RAX, 10			; Copy reg/imm multiplicand.
MOV RBX, 2				; Copy reg/ imm multiplier.
IMUL RBX				; Multiply reg(rax)/reg(rbx);
IMUL RAX, var			; Multiply reg(rax)/mem.
IMUL RAX, RBX, -3	; Multiply reg(rbx)/imm - result in reg(rax).
CALL ExitProcess
main ENDP

END