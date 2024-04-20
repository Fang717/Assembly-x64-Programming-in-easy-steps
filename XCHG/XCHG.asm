;--------------------------------------------------------------------
; XCHG: A program to demonstrate data exchange.
;--------------------------------------------------------------------

section .data

var dq 0            ; Declare and initialize variable mem.

section .text
    global _start
_start:    
    xor rcx, rcx        ; Clear reg.
    xor rdx, rdx        ; Clear reg.
    mov rcx, 5                ; Copy reg/ imm.
    xchg rcx, [var]    ; Exchange reg/mem
    mov dl, 3                ; Copy reg/ imm.
    xchg dh, dl            ; Exchange reg/reg.

    ; Exit the program
    mov eax, 60         ; sys_exit system call number
    xor edi, edi        ; exit status 0
    syscall
