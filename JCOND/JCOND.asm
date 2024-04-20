;--------------------------------------------------------------------
; JCOND: A program to demonstrate conditional branching.
;--------------------------------------------------------------------

section .data						
							

section .text
	global _start
_start:						
					
	xor rdx, rdx
	mov cl, 255	
	add cl, 1		; Exceed positive limit to set carry flag.
	jc carry		; Branch to location #1.
	mov rdx, 1		; Omitted.
carry:			; Location #1.
	mov cl, -128	
	sub cl, 1		; Exceed negative limit to set overflow flag.
	jo overflow		; Branch to location #2.
	mov rdx, 2		; Omitted.
overflow:		; Location #2.
	mov cl, 255		
	and cl, 10000000b	; Swap to positive to unset the sign flag.
	js sign				; Branch to location #3.
	mov rdx, 3			; Omitted.
sign:				; Location #3.
	jnz notZero			; Branch to location #4.
	mov rdx, 4			; Omitted.
notZero:			; Location #4.		
exit:
    ; Exit the program
    mov eax, 60  ; sys_exit system call number
    xor edi, edi ; exit status 0
    syscall					