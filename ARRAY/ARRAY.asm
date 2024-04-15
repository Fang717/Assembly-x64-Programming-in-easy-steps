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

; 1. The INCLUDELIB and ExitProcess PROTO lines are removed since they are specific to Microsoft's MASM syntax.
; 2. The .DATA section is renamed to section .data.
; 3. The REAL4 and REAL8 data types are replaced with dd (define double-word) and dq (define quad-word), respectively, since NASM uses a different syntax for defining data.
; 4. The XMMWORD PTR is removed since NASM does not require this syntax for accessing vector registers.
; 5. The main PROC and main ENDP lines are removed since NASM does not use this syntax for defining procedures.
; 6. The END statement is removed since it is not required in NASM.
; 7. The _start label is added, which is the entry point for Linux executables.
; 8. The ExitProcess call is replaced with a Linux system call (syscall) to exit the program. The system call number for exit is 60, and the exit status is set to 0 (success) using xor edi, edi.
