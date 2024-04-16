;--------------------------------------------------------------------
; MOV: A program to demonstrate basic data transfer.
;--------------------------------------------------------------------

section .data
    var dq 100 ; Initialize mem variable.

section .text
    global _start

_start:
    xor rcx, rcx    ; Clear reg.
    xor rdx, rdx    ; Clear reg.
    mov rcx, 33     ; Copy reg/imm.
    mov rdx, rcx    ; Copy reg/reg.
    mov rcx, [var]  ; Copy reg/mem.
    mov [var], rdx  ; Copy mem/reg.

    ; Exit system call
    mov rax, 60     ; Exit syscall number
    xor rdi, rdi    ; Set exit status to 0
    syscall