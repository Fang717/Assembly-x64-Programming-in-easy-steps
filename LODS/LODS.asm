;--------------------------------------------------------------------
; LODS: A program to demonstrate loading strings.
;--------------------------------------------------------------------

section .data
    src db 'abc'

section .text
    global _start

_start:
    xor rdx, rdx
    xor r8, r8
    xor r9, r9

    lea rsi, [rel src]  ; Source address of string
    mov rdi, rsi        ; Copy source address to destination
    mov rcx, 3          ; Number of bytes in source string

    cld                 ; Clear direction flag (increment addresses)

loop_start:
    lodsb               ; Load byte from source into al
    sub al, 32          ; Deduct for uppercase ASCII code
    stosb               ; Store byte in destination
    dec rcx             ; Decrement loop counter
    jnz loop_start      ; Jump if not zero (loop)

    mov dl, byte [rel src]     ; Copy characters to registers
    mov r8b, byte [rel src+1]
    mov r9b, byte [rel src+2]

    ; Exit the program
    mov eax, 60         ; sys_exit system call number
    xor edi, edi        ; exit status 0
    syscall