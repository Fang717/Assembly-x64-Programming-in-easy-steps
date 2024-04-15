section .data
    align 16
    nums dd 12.5, 25.0, 37.5, 50.0
    numf dd 2.0, 3.0, 4.0, 5.0
    align 16
    dubs dq 12.5, 25.0
    dubf dq 2.0, 3.0

section .text
    global _start

_start:
    movaps xmm0, [rel nums]
    movaps xmm1, [rel numf]
    divps xmm0, xmm1

    movapd xmm2, [rel dubs]
    movapd xmm3, [rel dubf]
    divpd xmm2, xmm3

    ; Exit system call
    mov eax, 60
    xor edi, edi
    syscall