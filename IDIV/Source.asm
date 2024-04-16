;--------------------------------------------------------------------
; IDIV: A program to demonstrate signed number division.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA


.CODE
main PROC
XOR RAX, RAX		; Clear reg.
XOR RBX, RBX		; Clear reg.
XOR RDX, RDX		; Clear reg.
MOV RAX, 100			; Copy reg/imm dividend.
MOV RBX, 3				; Copy reg/imm divisor.
IDIV RBX				; Divide reg(rax)/reg(rbx) - remainder in rdx.
MOV RAX, -100		; Copy signed imm.
CQO							; Change qword to octo word to preserve sign bit.
IDIV RBX				; Divide reg(rax)/reg(rbx) - remainder in rdx.
CALL ExitProcess
main ENDP

END