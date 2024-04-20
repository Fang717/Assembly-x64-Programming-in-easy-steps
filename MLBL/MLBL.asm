%macro power 2
    mov rax, 1
    mov rcx, %2     ; Load exponent
    cmp rcx, 0
    je %%finish     ; Jump to finish if exponent is 0
    mov rbx, %1     ; Load base

%%start:
    mul rbx         ; Multiply rax by base
    loop %%start    ; Decrement rcx and loop if not zero

%%finish:
%endmacro

section .text
    global _start

_start:
    power 4, 2      ; Compute 4^2
    power 4, 3      ; Compute 4^3

    ; Exit the program
    mov eax, 60     ; sys_exit system call number
    xor edi, edi    ; exit status 0
    syscall