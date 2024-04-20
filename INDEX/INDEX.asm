;--------------------------------------------------------------------
; INDEX: A program to demonstrate addressing via source index.
;--------------------------------------------------------------------

section .data
    arr dq 10, 20, 30
    arr_size equ ($ - arr) / 8  ; Calculate the number of elements

section .text
    global _start

_start:
    xor rcx, rcx
    xor rdx, rdx
    lea rsi, [arr]  ; Copy address of array start
    mov rcx, 0      ; Initialize counter

start:
    cmp rcx, arr_size  ; Check if we've processed all elements
    je exit            ; If so, jump to 'exit'
    mov rdx, [rsi + rcx * 8]  ; Get element value: base + index * scale
    inc rcx                   ; Increment counter
    jmp start                 ; Jump back to 'start'

exit:
    ; Exit the program
    mov eax, 60  ; sys_exit system call number
    xor edi, edi ; exit status 0
    syscall