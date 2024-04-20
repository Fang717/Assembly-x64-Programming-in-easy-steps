;--------------------------------------------------------------------
; LOOP: A program to demonstrate loop structures.
;--------------------------------------------------------------------

section .data


section .text
	global _start
_start:	

	xor rdx, rdx
	mov rcx, 0
start:			; Location #1.
	mov rdx, rcx	;0, 1, 2.
	inc rcx			;1, 2, 3.
	cmp rcx, 3		;3 == 3 ?
	je finish		; Branch to location #2.
	jmp start		; Else branch to location #1.
finish:			; Location #2.
; Exit the program
    mov eax, 60  ; sys_exit system call number
    xor edi, edi ; exit status 0
    syscall					