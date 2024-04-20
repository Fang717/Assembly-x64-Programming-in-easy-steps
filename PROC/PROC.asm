;--------------------------------------------------------------------
; PROC: A program to demonstrate procedures.
;--------------------------------------------------------------------

section .data
var: times 8 db 0    ; Reserve 8 bytes (QWORD) of uninitialized space

section .text
global _start

zeroRAX:
    xor rax, rax    ; Clear reg.
    ret

_start:
    mov rax, 8      ; Assign imm.
    push rax        ; Save the value of rax
    call zeroRAX    ; Call proc.
    pop rax         ; Restore the value of rax

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80