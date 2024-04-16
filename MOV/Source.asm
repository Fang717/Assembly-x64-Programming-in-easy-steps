;--------------------------------------------------------------------
; 	MOV: A program to demonstrate basic data transfer.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
var QWORD 100		; Initialize mem variable.

.CODE
main PROC
XOR RCX, RCX		; Clear reg.
XOR RDX, RDX		; Clear reg.
MOV RCX, 33			; Copy reg/imm.
MOV RDX, RCX		; Copy reg/reg.
MOV RCX, var			; Copy reg/mem.
MOV var, RDX			; Copy mem/reg.
main ENDP
END