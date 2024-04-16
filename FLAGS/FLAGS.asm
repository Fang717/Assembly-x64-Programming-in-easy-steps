;--------------------------------------------------------------------
; FLAGS: A program to demonstrate setting flags.
;--------------------------------------------------------------------

section .data
	

section .text
	global _start
_start:


		
	xor rcx, rcx
	mov cl, 255		; Maximum unsigned register limit.
	add cl,1		; Exceed unsigned register limit.
	dec cl			; Return to unsigned maximum.
	mov cl, 127		; Assign positive signed register limit.
	add cl, 1		; Assume negative signed register limit.
; Exit system call
    mov eax, 60
    xor edi, edi
    syscall