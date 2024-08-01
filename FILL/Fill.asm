; FILL: A program to demonstrate addressing via destination index (Linux version)
; Assembled with: yasm -f elf64 -g dwarf2 source.asm
; Linked with: ld -o fill source.o

BITS 64                     ; Specify 64-bit mode

section .data
    arr     dq 0, 0, 0      ; Define array 'arr' with 3 quadwords, initialized to 0
    cpy     dq 0, 0, 0      ; Define array 'cpy' with 3 quadwords, initialized to 0

section .text
    global _start           ; Entry point for the linker

    ; System call numbers for Linux x86_64
    SYS_EXIT    equ 60

_start:
    ; Initialize registers
    lea rdi, [arr]          ; Load effective address of 'arr' into rdi
    xor rcx, rcx            ; Initialize loop counter to 0
    mov rdx, 10             ; Initialize data value to 10

.fill_loop:                 ; Label for the start of our filling loop
    mov [rdi + rcx * 8], rdx ; Store rdx value into arr[rcx]
    add rdx, 10             ; Increase data value by 10
    inc rcx                 ; Increment loop counter
    cmp rcx, 3              ; Compare loop counter with array length (3)
    jne .fill_loop          ; If not equal, continue loop

    ; Copy array elements to registers (for demonstration)
    mov r10, [arr + 0*8]    ; Copy arr[0] to r10
    mov r11, [arr + 1*8]    ; Copy arr[1] to r11
    mov r12, [arr + 2*8]    ; Copy arr[2] to r12

    ; Prepare for array copy
    lea rsi, [arr]          ; Load address of source array (arr) into rsi
    lea rdi, [cpy]          ; Load address of destination array (cpy) into rdi
    mov rcx, 3              ; Set counter to array length (3)
    cld                     ; Clear direction flag (ensure forward copying)
    rep movsq               ; Repeat move string quadword (copy arr to cpy)

    ; Copy second array elements to registers (for demonstration)
    mov r13, [cpy + 0*8]    ; Copy cpy[0] to r13
    mov r14, [cpy + 1*8]    ; Copy cpy[1] to r14
    mov r15, [cpy + 2*8]    ; Copy cpy[2] to r15

    ; Exit program
    mov rax, SYS_EXIT       ; System call for exit
    xor rdi, rdi            ; Exit code 0
    syscall                 ; Make system call

; End of program