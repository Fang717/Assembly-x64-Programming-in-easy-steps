;--------------------------------------------------------------------
; MRTN: A program to demonstrate macro functions.
;--------------------------------------------------------------------

%macro factorial 1
    %xdefine factor %1
    %xdefine i 1
    %rep (%1 - 1)
        %xdefine i (i * factor)
        %xdefine factor (factor - 1)
    %endrep
    %xdefine result i
%endmacro

section .text
    global _start

_start:
    factorial 4
    mov rax, result     ; Load factorial of 4 into rax

    factorial 5
    mov rbx, result     ; Load factorial of 5 into rbx

    ; Exit the program
    mov eax, 60         ; sys_exit system call number
    xor edi, edi        ; exit status 0
    syscall