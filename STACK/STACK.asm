;--------------------------------------------------------------------
; STACK: A program to demonstrate stack operations.
;--------------------------------------------------------------------



section .data
    var     dw 256     ; Assign initial value to memory.

section .text
    global _start

_start:
    mov rax, 64         ; Assign initial value to register.
    push rax            ; Copy register value onto the top of the stack.
    mov rax, 25         ; Overwrite initial register value.
    push word [var]     ; Copy memory value onto the top of the stack.
    mov word [var], 75  ; Overwrite initial memory value.
    pop word [var]      ; Move stack top to resume initial memory value.
    pop r10             ; Move stack top to other register.
    
    ; Call ExitProcess equivalent for Linux
    mov eax, 60         ; System call number for exit
    xor edi, edi        ; Exit code 0
    syscall             ; Invoke syscall to exit

