;--------------------------------------------------------------------
; ARGS: A program to demonstrate register arguments.
;--------------------------------------------------------------------

section .data
arr dq 100, 150, 250

section .text
global _start

sum:
    xor rax, rax

.loop:
    add rax, [rdx] ; Assign data from address.
    add rdx, 8 ; Increment address for qword size.
    dec rcx ; Decrement array length counter.
    jnz .loop ; Repeat if not final element.
    ret

_start:
    mov rcx, 3 ; Store array length.
    lea rdx, [arr] ; Store array address.
    call sum

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80