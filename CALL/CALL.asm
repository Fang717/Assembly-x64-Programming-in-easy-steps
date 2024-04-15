;--------------------------------------------------------------------
; A file providing a function to return the sum of 2 arguments.
;--------------------------------------------------------------------
section .text
    global DoSum

DoSum:
    mov rax, rdi    ; Move the first argument to rax
    add rax, rsi    ; Add the second argument to rax
    ret             ; Return the result in rax