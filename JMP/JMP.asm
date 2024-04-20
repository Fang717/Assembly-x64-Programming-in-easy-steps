;--------------------------------------------------------------------
; JMP: A program to demonstrate unconditional branching.
;--------------------------------------------------------------------

section .data
section .text
	global _start
_start:	


	xor r14, r14
	xor r15, r15
	jmp next		; Jump over the next instruction.
	mov r14, 100	; Omitted.
next:
	mov r15, final	; Assign reg/location.
	jmp r15			; Jump to location.
	mov r14, 100	; Omitted.
final:			; Location.
; Exit the program
    mov eax, 60  ; sys_exit system call number
    xor edi, edi ; exit status 0
    syscall					