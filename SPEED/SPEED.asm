;--------------------------------------------------------------------
; SPEED: A file providing a function for parallel multiplication.
;--------------------------------------------------------------------

section .text
    global DoRun

DoRun:
    mov rax, 1
    movdqa xmm1, [rcx]
    movdqa xmm2, [rdx]

main_loop:
    mulps xmm1, xmm2
    inc rax
    cmp rax, r8
    jl main_loop

    ret

section .text
    global _start

_start:
    ; Your initialization code or call to DoRun can go here
