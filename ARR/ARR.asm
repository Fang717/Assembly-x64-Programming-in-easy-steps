section .data
    arrA db 1, 2, 3          ; Define an array of bytes with values 1, 2, 3
    arrB dw 10, 20, 30        ; Define an array of words with values 10, 20, 30
    arrC dd 100, 200, 300     ; Define an array of double words with values 100, 200, 300
    arrD dq 1000, 2000, 3000  ; Define an array of quad words with values 1000, 2000, 3000

section .text
    global _start

_start:
    ; Direct memory addressing.
    mov cl, byte [arrA]       ; Load the first byte of arrA into the CL register
    mov dx, word [arrB]       ; Load the first word of arrB into the DX register
    mov r8d, dword [arrC]     ; Load the first double word of arrC into the R8D register
    mov r9, qword [arrD]      ; Load the first quad word of arrD into the R9 register

    ; Offset by data size.
    mov cl, byte [arrA + 1]   ; Load the second byte of arrA into the CL register
    mov dx, word [arrB + 2]   ; Load the third word of arrB into the DX register
    mov r8d, dword [arrC + 4] ; Load the second double word of arrC into the R8D register
    mov r9, qword [arrD + 8]  ; Load the second quad word of arrD into the R9 register

    ; Offset by multiples of data size.
    mov cl, byte [arrA + 2 * 1]   ; Load the third byte of arrA into the CL register
    mov dx, word [arrB + 2 * 2]   ; Load the third word of arrB into the DX register
    mov r8d, dword [arrC + 2 * 4] ; Load the third double word of arrC into the R8D register
    mov r9, qword [arrD + 2 * 8]  ; Load the third quad word of arrD into the R9 register

    ; Exit the program
    mov eax, 60         ; syscall number for exit
    xor edi, edi        ; exit code 0
    syscall             ; invoke syscall
