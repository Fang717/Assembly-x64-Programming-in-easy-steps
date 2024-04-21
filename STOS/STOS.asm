;--------------------------------------------------------------------
; STOS: A program to demonstrate storing strings.
;--------------------------------------------------------------------

section .data
dst times 3 db 0 ; Reserve 3 bytes for destination

section .text
global _start

_start:
    xor rdx, rdx
    xor r8, r8
    xor r9, r9

    mov al, 'A' ; Initialize source.
    lea rdi, [dst] ; Address of destination.
    mov rcx, 3 ; Number of bytes in destination.
    cld ; Clear direction flag.
    rep stosb ; Store bytes from source to destination.

    mov dl, [dst] ; Assign stored character to registers.
    mov r8b, [dst + 1]
    mov r9b, [dst + 2]

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80