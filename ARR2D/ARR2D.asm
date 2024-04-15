;--------------------------------------------------------------------
; ARR2D: A program to demonstrate addressing of 2-dimensional arrays.
;--------------------------------------------------------------------

section .data
    rows db 0, 1, 2, 3, 10, 11, 12, 13, 20, 21, 22, 23  ; Row-major order
    cols db 0, 10, 20, 1, 11, 21, 2, 12, 22, 3, 13, 23  ; Column-major order
    arrA dd 0, 1, 2, 3, 10, 11, 12, 13, 20, 21, 22, 23  ; Row-major order
    arrB dd 0, 10, 20, 1, 11, 21, 2, 12, 22, 3, 13, 23  ; Column-major order

section .text
    global _start

_start:
    mov cl, [rel rows]      ; Address each 1st element at memory address
    mov ch, [rel cols]
    mov r8d, [rel arrA]
    mov r9d, [rel arrB]

    mov cl, [rel rows + 5]  ; Address by offset of 1 for bytes
    mov ch, [rel cols + 4]
    mov r8d, [rel arrA + 32] ; Address by offset of data size 4 for dwords
    mov r9d, [rel arrB + 8]

    ; Exit system call
    mov eax, 60
    xor edi, edi
    syscall