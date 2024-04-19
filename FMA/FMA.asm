;--------------------------------------------------------------------
; FMA: A program to demonstrate fused multiply-add operations.
;--------------------------------------------------------------------
section .data
    numA dd 2.0           ; Define numA as single-precision float (REAL4)
    numB dd 8.0           ; Define numB as single-precision float (REAL4)
    numC dd 5.0           ; Define numC as single-precision float (REAL4)

section .text
    global _start

_start:
    ; Load numA, numB, and numC into XMM registers
    movss xmm0, dword [numA]
    movss xmm1, dword [numB]
    movss xmm2, dword [numC]

    ; Fused Multiply-Add operations
    vfmadd132ss xmm0, xmm1, xmm2  ; xmm0 = xmm1 * xmm2 + xmm0
    movss dword [numA], xmm0      ; Store the result back to numA
    movss xmm0, dword [numA]      ; Reload numA
    vfmadd213ss xmm0, xmm1, xmm2  ; xmm0 = xmm0 * xmm2 + xmm1
    movss dword [numA], xmm0      ; Store the result back to numA
    movss xmm0, dword [numA]      ; Reload numA
    vfmadd231ss xmm0, xmm1, xmm2  ; xmm0 = xmm1 * xmm0 + xmm2

    ; Call ExitProcess equivalent for Linux
    mov eax, 60             ; System call number for exit
    xor edi, edi            ; Exit code 0
    syscall                 ; Invoke syscall to exit
