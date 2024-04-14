section .data
    align 32            ; Align the data section on a 32-byte boundary for performance optimization
    vec1 dd 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0   ; Define an array vec1 with 8 single-precision floating-point numbers
    vec2 dd 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0   ; Define an array vec2 with 8 single-precision floating-point numbers

section .text
    global _start       ; Declare the entry point of the program

_start:
    vmovaps ymm1, [rel vec1]   ; Load the values of vec1 into YMM1 register using AVX instructions
    vmovaps ymm2, [rel vec2]   ; Load the values of vec2 into YMM2 register using AVX instructions

    vmulps ymm0, ymm1, ymm2    ; Multiply the values in YMM1 and YMM2, store the result in YMM0
    vaddps ymm0, ymm1, ymm2    ; Add the values in YMM1 and YMM2, store the result in YMM0
    vsubps ymm0, ymm2, ymm1    ; Subtract the values in YMM1 from YMM2, store the result in YMM0
    vdivps ymm0, ymm2, ymm1    ; Divide the values in YMM2 by the values in YMM1, store the result in YMM0

    ; Exit system call
    mov eax, 60        ; Load the syscall number for exit into EAX
    xor edi, edi       ; Clear EDI register (exit code 0)
    syscall            ; Invoke the syscall to exit the program
