;------------------------------------------------------------------------------
; MULDIV: A program to demonstrate unsigned multiplication & division.
;------------------------------------------------------------------------------

.DATA
var QWORD 2		; Initialize mem.

.CODE
main PROC
MOV RAX, 10		; Copy reg/imm multiplicand.
MOV RBX, 5			; Copy reg/imm multiplier.
MUL RBX				; Multiply reg(rax)/reg(rbx).
MUL var				; Multiply reg/mem.
MOV RBX, 8			; Assign reg/imm.
DIV RBX				; Divide reg(rax)/reg(rbx) - remainder in rdx.
CALL ExitProcess
main ENDP
END