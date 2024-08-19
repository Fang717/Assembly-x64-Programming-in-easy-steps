; SATUR: A program to demonstrate saturation arithmetic using SIMD instructions
; Adapted for YASM assembler on Linux

; Define the exit system call number
SYS_EXIT equ 60

section .data
    ; Define two arrays of signed bytes (8-bit integers)
    nums db 16 dup(50)   ; Array of 16 elements, each initialized to 50
    tons db 16 dup(100)  ; Array of 16 elements, each initialized to 100

section .text
global _start

_start:
    ; Load the first 16 bytes of 'nums' into XMM0
    movdqa xmm0, [nums]

    ; Perform saturated addition of 'tons' to 'nums'
    ; This will demonstrate upper limit saturation (max value: 127)
    paddsb xmm0, [tons]
    ; At this point, all values in XMM0 will be 127 (saturated)

    ; Load 'nums' into XMM0 again for the subtraction demonstration
    movdqa xmm0, [nums]

    ; Perform saturated subtraction of 'tons' from 'nums'
    ; This will demonstrate lower limit saturation (min value: -128)
    psubsb xmm0, [tons]
    ; Subtract 'tons' again to ensure we hit the lower limit
    psubsb xmm0, [tons]
    ; At this point, all values in XMM0 will be -128 (saturated)

    ; Exit the program
    mov rax, SYS_EXIT    ; System call number for exit
    xor rdi, rdi         ; Exit code 0
    syscall              ; Invoke the system call