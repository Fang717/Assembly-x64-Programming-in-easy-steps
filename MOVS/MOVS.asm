;--------------------------------------------------------------------
; MOVS: A program to demonstrate copying characters.
;--------------------------------------------------------------------

section .data
    src db 'abc'
    dst times 3 db '?'  ; Allocate 3 bytes for dst, initialized with '?'

section .text
    global _start

_start:
    xor rdx, rdx
    xor r8, r8
    xor r9, r9

    lea rsi, [src]      ; Start address of source string
    lea rdi, [dst]      ; Start address of destination array
    mov rcx, 3          ; Number of bytes to copy

    cld                 ; Clear direction flag (not necessary in this case)
    rep movsb           ; Copy bytes from source to destination

    mov dl, [dst]       ; Assign characters to registers
    mov r8b, [dst + 1]
    mov r9b, [dst + 2]

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80