;--------------------------------------------------------------------
; LOGIC: A program to demonstrate logical bitwise operations.
;--------------------------------------------------------------------

section .data

section .text
	global _start
_start:

	xor rcx, rcx		; Clear reg.
	xor rdx, rdx		; Clear reg.
	mov rcx, 0101b		; Assign imm 5d.
	mov rdx, 0011b		; Assign imm 3d.
	xor rcx, rdx		; eXclusive OR -> cl 6d.
	and rcx, rdx		; AND -> cl 2d.
	or  rcx, rdx		; OR -> cl 3d.
						
; Exit the program
    mov eax, 60  ; sys_exit system call number
    xor edi, edi ; exit status 0
    syscall					