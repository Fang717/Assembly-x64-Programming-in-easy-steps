;--------------------------------------------------------------------
; IDIV: A program to demonstrate signed number division.
;--------------------------------------------------------------------

section .data


section .text
	global _start
_start:	
	xor rax, rax		; Clear reg.
	xor rbx, rbx		; Clear reg.
	xor rdx, rdx		; Clear reg.
	mov rax, 100			; Copy reg/imm dividend.
	mov rbx, 3				; Copy reg/imm divisor.
	idiv rbx				; Divide reg(rax)/reg(rbx) - remainder in rdx.
	mov rax, -100		; Copy signed imm.
	CQO							; Change qword to octo word to preserve sign bit.
	idiv rbx				; Divide reg(rax)/reg(rbx) - remainder in rdx.
; Exit system call
    mov eax, 60
    xor edi, edi
    syscall
