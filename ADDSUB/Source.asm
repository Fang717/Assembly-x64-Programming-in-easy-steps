;--------------------------------------------------------------------
; ADDSUB: A program to demonstrate addition and subtraction.
;--------------------------------------------------------------------

.DATA
var QWORD 64		; Initialize mem variable.
num QWORD 12		; Initialize mem variable.

.CODE
main PROC
XOR RCX, RCX		; Clear regs.
XOR RDX, RDX		; Clear regs.
MOV RCX, 36			; Copy reg/imm.
ADD RCX, var			; Add reg/mem.
MOV RDX, 400			; Copy reg/imm.
ADD RDX, RCX		; Add reg/reg.
SUB RCX, 100			; Subtract reg/imm.
CALL ExitProcess
main ENDP

END
