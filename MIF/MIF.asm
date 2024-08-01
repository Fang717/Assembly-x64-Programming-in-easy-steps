; MIF: A program to demonstrate conditional branching (Linux version)
; Assembled with: yasm -f elf64 -g dwarf2 source.asm
; Linked with: ld -o mif source.o

BITS 64                     ; Specify 64-bit mode

; Macro to scan a number and set RAX based on its value
; %1 = number to scan
%macro scan 1
    %if %1 > 50
        mov rax, 1          ; If number > 50, set RAX to 1
    %elif %1 < 50
        mov rax, 0          ; If number < 50, set RAX to 0
    %else
        mov rax, %1         ; If number == 50, set RAX to the number itself
    %endif
%endmacro

section .text
    global _start           ; Entry point for the linker

    ; System call numbers for Linux x86_64
    SYS_EXIT    equ 60

_start:
    ; Test macro with different values
    scan 100                ; Test with value > 50
    scan 10                 ; Test with value < 50
    scan 50                 ; Test with value == 50

    ; Exit program
    mov rax, SYS_EXIT       ; System call for exit
    xor rdi, rdi            ; Exit code 0
    syscall                 ; Make system call

; End of program