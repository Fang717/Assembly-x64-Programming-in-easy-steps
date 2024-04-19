;--------------------------------------------------------------------
; INCNEG: A program to demonstrate inc/decrement & negation.
;--------------------------------------------------------------------



section .data
var dq 99          ; Define var as a quadword (QWORD) with initial value 99

section .text
    global _start

_start:
    xor rcx, rcx            ; Clear reg.
    inc qword [var]                     ; Increment mem.
    mov rcx, 51             ; Copy reg/imm.
    dec rcx                     ; Decrement reg.
    neg rcx                  ; Negate reg.

    ; Call ExitProcess equivalent for Linux
    mov eax, 60         ; System call number for exit
    xor edi, edi        ; Exit code 0
    syscall             ; Invoke syscall to exit

