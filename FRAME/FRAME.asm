;--------------------------------------------------------------------
; FRAME: A program to demonstrate stack frame.
;--------------------------------------------------------------------

section .text
    global total, _start

; total function
total:
    push rbp                    ; Save base pointer
    mov rbp, rsp                ; Set up new base pointer
    sub rsp, 16                 ; Reserve space for local variables

    mov rax, [rbp + 16]         ; Copy argument to rax
    mov [rbp - 8], rax          ; Store in first local variable
    mov [rbp - 16], rax         ; Store in second local variable

    add rax, [rbp - 8]          ; Add first local variable to rax
    add rax, [rbp - 16]         ; Add second local variable to rax

    mov rsp, rbp                ; Restore stack pointer
    pop rbp                     ; Restore base pointer
    ret                         ; Return to caller

_start:
    xor rax, rax                ; Clear rax
    push 100                    ; Push argument (100) to stack
    call total                  ; Call total function
    add rsp, 8                  ; Rebalance the stack

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80