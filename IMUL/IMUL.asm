;--------------------------------------------------------------------
; IMUL: A program to demonstrate signed number multiplication.
;--------------------------------------------------------------------


section .data
var dq 4			; Initialize mem.

section .text
	global _start
_start:	
	xor rax, rax		; Clear reg.
	xor rbx, rbx		; Clear reg.
	mov rax, 10			; Copy reg/imm multiplicand.
	mov rbx, 2				; Copy reg/ imm multiplier.
	imul rbx				; Multiply reg(rax)/reg(rbx);
	imul rax, [var]			; Multiply reg(rax)/mem.
	imul rax, rbx, -3	; Multiply reg(rbx)/imm - result in reg(rax).
	; Exit system call
    mov eax, 60
    xor edi, edi
    syscall
