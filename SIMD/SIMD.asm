;--------------------------------------------------------------------
; SIMD: A program to demonstrate parallel addition processing.
;--------------------------------------------------------------------

section .data
    align 16
    nums0 dd 1, 2, 3, 4
    nums1 dd 1, 3, 5, 7

section .text
    global _start

_start:
    ; Move the first array into XMM0 register
    movdqa xmm0, [nums0]

    ; Add the second array to the first array
    paddd xmm0, [nums1]

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80