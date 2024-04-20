;--------------------------------------------------------------------
; PARAMS: A program to demonstrate passing stack arguments.
;--------------------------------------------------------------------

section .data

section .text

global _start

max:
    mov rcx, [rsp+16]     ; Copy 1st arg. value.
    mov rdx, [rsp+8]      ; Copy 2nd arg. value.
    cmp rcx, rdx          ; Find largest value.
    jg large              ; Branch to location #1.
    mov rax, rdx          ; Else copy 2nd arg. as result...
    jmp finish            ; Then branch to location #2.
large:                    ; Location #1.
    mov rax, rcx          ; Copy 1st arg. as result.
finish:                   ; Location #2.
    ret                   ; Automatically Pop return address.

_start:
    xor rax, rax
    push 0x64             ; Add 1st arg. to stack.
    push 0x1f4            ; Add 2nd arg. to stack.
    call max              ; Get largest value.
    add rsp, 16           ; Rebalance stack.

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80