;--------------------------------------------------------------------
; SCAS: A program to demonstrate string scanning.
;--------------------------------------------------------------------

section .data
src db 'abc', 0 ; Null-terminated string

found db 0

section .text
global _start

_start:
    xor rax, rax

    mov al, 'b' ; Character to seek.
    lea rdi, [src] ; Start address of string to scan.
    mov rcx, 3 ; Number of bytes in string (excluding null terminator).
    cld ; Clear direction flag.
    repne scasb ; Seek character in string.
    jnz absent ; If absent branch to location #1.

    mov byte [found], 1 ; Else assign 1 if found...
    jmp finish ; Then branch to location #2.

absent: ; Location #1.
    mov byte [found], 0 ; Assign 0 if not found.

finish: ; Location #2.
    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80