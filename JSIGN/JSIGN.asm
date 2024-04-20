;--------------------------------------------------------------------
; JSIGN: A program to demonstrate conditional branching.
;--------------------------------------------------------------------

section .text
    global _start

_start:
    xor rdx, rdx        ; Clear rdx register
    mov rbx, -4         ; Move -4 into rbx
    mov rcx, -1         ; Move -1 into rcx

    cmp rcx, rbx        ; Compare -1 and -4
    jg greater          ; Jump to greater if -1 > -4

    mov rdx, 1          ; rdx = 1 (omitted)

greater:
    mov rcx, -16        ; Move -16 into rcx
    cmp rcx, rbx        ; Compare -16 and -4
    jl less             ; Jump to less if -16 < -4

    mov rdx, 2          ; rdx = 2 (omitted)

less:
    mov rcx, -4         ; Move -4 into rcx
    cmp rcx, rbx        ; Compare -4 and -4
    jle equal           ; Jump to equal if -4 <= -4

    mov rdx, 3          ; rdx = 3 (omitted)

equal:
    cmp rcx, rbx        ; Compare -4 and -4
    jnle not_less_or_equal  ; Jump to not_less_or_equal if -4 !<= -4

    mov rdx, 4          ; rdx = 4 (implemented)

not_less_or_equal:
    ; Exit the program
    mov eax, 60         ; sys_exit system call number
    xor edi, edi        ; exit status 0
    syscall