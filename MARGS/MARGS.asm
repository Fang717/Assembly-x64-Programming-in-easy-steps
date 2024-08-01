; MARGS: A program to demonstrate macro parameters (Linux version)
; Assembled with: yasm -f elf64 -g dwarf2 source.asm
; Linked with: ld -o margs source.o

BITS 64                     ; Specify 64-bit mode

; Macro to clear a register
%macro clrReg 1
    xor %1, %1              ; XOR the register with itself to clear it
%endmacro

; Macro to sum values with default parameters
; %1 = destination register (required)
; %2 = first value (default 2)
; %3 = second value (default 8)
%macro sum 1-3 2, 8
    mov %1, %2              ; Move the first value to the destination register
    add %1, %3              ; Add the second value to the destination register
%endmacro

section .text
    global _start           ; Entry point for the linker

    ; System call numbers for Linux x86_64
    SYS_EXIT    equ 60

_start:
    ; Demonstrate macro usage
    clrReg rax              ; Clear rax register

    sum rbx                 ; Use sum macro with default values (2 and 8)
    sum rbx, 12             ; Use sum macro with one custom value (12 and default 8)
    sum rbx, 18, 12         ; Use sum macro with two custom values (18 and 12)

    ; Exit program
    mov rax, SYS_EXIT       ; System call for exit
    xor rdi, rdi            ; Exit code 0
    syscall                 ; Make system call

; End of program