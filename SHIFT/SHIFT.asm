;--------------------------------------------------------------------
; SHIFT: A program to demonstrate shifting bit values.
;--------------------------------------------------------------------

			

section .data
    ; Using the 'db' directive is more idiomatic for defining byte values
    unum db 0x99        ; Unsigned number, 153d (0b10011001)

    ; For signed negative numbers, it's better to use the two's complement notation
    sneg db 0xD9        ; Signed negative number, -39d (0b11011001)

    ; For signed positive numbers, you can omit the leading zeros
    spos db 0x33        ; Signed positive number, 51d (0b00110011)

section .text
	global _start
_start:	
	xor rcx, rcx		; Clear reg.
	xor rdx, rdx		; Clear reg.
	xor r8, r8			; Clear reg.
	mov cl, [unum]		; Assign reg/mem.
	mov dl, [sneg]		; Assign reg/mem.
	mov r8b, [spos]		; Assign reg/mem.

	shr cl, 2		; Shift right 2 bits.
	sar dl, 2		; Shift right 2 bits, preseving sign.
	sar r8, 2		; Shift right 2 bits, preserving sign.

; Exit the program
    mov rax, 60             ; sys_exit system call
    xor rdi, rdi            ; Exit status 0
    syscall
