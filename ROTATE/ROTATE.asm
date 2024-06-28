; ----------------------------------------------------------
; ROTATE: A program to demonstrate bit rotation.
; ----------------------------------------------------------

section .text
global _start

_start:
    ; Clear RCX register
    xor rcx, rcx

    ; Assign ASCII 'A' (65) to CL (lower byte of RCX)
    mov cl, 65

    ; Assign ASCII 'Z' (90) to CH (second byte of RCX)
    mov ch, 90

    ; Rotate CX (16-bit part of RCX) left by 8 bits
    ; This swaps CL and CH
    rol cx, 8

    ; Rotate CX left by 8 bits again
    ; This brings CL and CH back to their original positions
    rol cx, 8

    ; Shift CX right by 8 bits
    ; This moves CH to CL and clears CH
    shr cx, 8

    ; Exit the program
    mov rax, 60     ; syscall number for exit
    xor rdi, rdi    ; exit status 0
    syscall


;Key differences and explanations:

;YASM uses section .text instead of .CODE to define the code section.
;The entry point in Linux is typically _start instead of main.
;YASM doesn't use PROC and ENDP. Functions are simply labeled.
;Instead of using ExitProcess, we use a Linux syscall to exit the program.
;The INCLUDELIB and ExitProcess PROTO lines are removed as they are specific to Windows.
;There's no need for an END directive in YASM.
;The .DATA section is omitted as it's not used in this program.

;This program demonstrates bit rotation and shifting operations:

;It starts by setting CL to 'A' (65) and CH to 'Z' (90).
;It then rotates CX left twice by 8 bits each time, effectively swapping CL and CH and then bringing them back.
;Finally, it shifts CX right by 8 bits, which moves the value from CH to CL and clears CH.

;To assemble and link this program on a Linux system, you would use:
;yasm -f elf64 rotate.asm
;ld rotate.o -o rotate