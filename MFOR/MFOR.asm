;--------------------------------------------------------------------
; MFOR: A program to demonstrate iterating loops.
;--------------------------------------------------------------------

%macro nums 3
    push %3
    push %2
    push %1
    pop rax
    pop rbx
    pop rcx
%endmacro

%macro chars 1
    push %1
    pop rax
    shr rax, 24         ; Get the first character
    push %1
    pop rbx
    shr rbx, 16
    and rbx, 0xff       ; Get the second character
    push %1
    pop rcx
    shr rcx, 8
    and rcx, 0xff       ; Get the third character
%endmacro

section .text
    global _start

_start:
    nums 1, 2, 3       ; Load integers into registers
    chars 0x41424344   ; Load characters into registers

    ; Exit the program
    mov eax, 60        ; sys_exit system call number
    xor edi, edi       ; exit status 0
    syscall