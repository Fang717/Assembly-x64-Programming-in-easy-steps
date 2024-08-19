; RECUR: A program to demonstrate recursive function calls
; Adapted for YASM assembler on Linux

; Define the exit system call number
SYS_EXIT equ 60

section .text
global _start

; Fibonacci function
fib:
    mov rcx, rdx    ; Store the previous number in rcx (for display purposes)
    xadd rax, rdx   ; Exchange and add: rax += rdx, then rdx = old rax
                    ; This generates the next Fibonacci number
    cmp rax, 5      ; Compare the current Fibonacci number with 5
    jg .finish      ; If greater than 5, jump to finish
    call fib        ; Else, make a recursive call
.finish:
    ret             ; Return from the function

_start:
    mov rax, 1      ; Initialize the first Fibonacci number (F1 = 1)
    mov rdx, 0      ; Initialize the second Fibonacci number (F0 = 0)
    call fib        ; Start the Fibonacci sequence generation

    ; Exit the program
    mov rax, SYS_EXIT    ; System call number for exit
    xor rdi, rdi         ; Exit code 0
    syscall              ; Invoke the system call