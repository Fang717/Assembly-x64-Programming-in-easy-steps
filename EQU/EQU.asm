;--------------------------------------------------------------------
; EQU: A program to demonstrate memory constant.
;--------------------------------------------------------------------
section .data
    con equ 12 ; Initialize memory constant

section .text
    global _start

_start:
    mov rcx, con            ; Copy reg/mem
    mov rdx, con + 8        ; Copy reg/mem + imm
    mov rcx, con + 16       ; Copy unclear expr
    mov rdx, 40             ; Copy clear expr ((con + 8) * 2)
    mov rcx, 2              ; Copy modulo quotient (con mod 5)
    mov rdx, 3              ; Copy division quotient ((con - 3) / 3)

    ; Exit system call
    mov eax, 60
    xor edi, edi
    syscall

;1. The INCLUDELIB and ExitProcess proto lines are removed since they are specific to Microsoft's MASM syntax.
;2 The .DATA section is renamed to section .data.
;3 The EQU directive is used in NASM to define a constant value, similar to MASM.
;4 The main PROC and main ENDP lines are removed since NASM does not use this syntax for defining procedures.
;5 The END statement is removed since it is not required in NASM.
;6 The _start label is added, which is the entry point for Linux executables.
;7 The ExitProcess call is replaced with a Linux system call (syscall) to exit the program. The system call number for exit is 60, and the exit status is set to 0 (success) using xor edi, edi.
;8 The memory addressing and arithmetic expressions are converted to NASM syntax. For example, con + 8 * 2 is converted to con + 16, and (con + 8) * 2 is converted to 40.
;9 The mod and / operators are used directly in NASM for modulo and division operations, respectively.    