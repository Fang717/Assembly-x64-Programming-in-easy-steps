; ENTER: A program to demonstrate input from the console (Linux version)
; Assembled with: yasm -f elf64 -g dwarf2 source.asm
; Linked with: ld -o enter source.o

BITS 64                     ; Specify 64-bit mode

section .data
    txt     resb 100        ; Reserve 100 bytes for input storage
    num     resb 8          ; 8 bytes to store number of bytes read (size_t)

section .text
    global _start           ; Entry point for the linker

    ; System call numbers for Linux x86_64
    SYS_READ    equ 0
    SYS_EXIT    equ 60

    ; File descriptors
    STDIN       equ 0

_start:
    ; Clear registers
    xor rax, rax
    xor rdi, rdi
    xor rsi, rsi
    xor rdx, rdx

    ; Read from stdin
    mov rax, SYS_READ       ; System call for read
    mov rdi, STDIN          ; File descriptor for stdin
    mov rsi, txt            ; Buffer to read into
    mov rdx, 100            ; Number of bytes to read
    syscall                 ; Make system call

    ; Store number of bytes read
    mov [num], rax

    ; Exit program
    mov rax, SYS_EXIT       ; System call for exit
    xor rdi, rdi            ; Exit code 0
    syscall                 ; Make system call

; End of program