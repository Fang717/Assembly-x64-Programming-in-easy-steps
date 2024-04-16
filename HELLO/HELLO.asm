; --------------------------------------------------------------------
; HELLO: A program to demonstrate output to the console.
; --------------------------------------------------------------------

section .data
    txt db 10, " Hello World! ", 10, 10, 0  ; 10 is ASCII line feed.
    txt_len equ $ - txt                     ; Calculate length of the string
    handle dq 0                             ; Variable to store handle.
    num db 0                                ; Variable to store number of bytes written.

section .bss
    ; No uninitialized data

section .text
    global _start

_start:
    ; Clear registers
    xor rax, rax
    xor rcx, rcx
    xor rdx, rdx
    xor r8, r8
    xor r9, r9

    ; Create shadow space for 4 arguments
    sub rsp, 32

    ; Get the console output handle
    mov rax, 1              ; sys_write system call
    mov rdi, 1              ; stdout file descriptor
    lea rsi, [rel txt]      ; Load the address of the string
    mov rdx, txt_len        ; Length of the string
    syscall

    ; Restore the stack
    add rsp, 32

    ; Exit the program
    mov rax, 60             ; sys_exit system call
    xor rdi, rdi            ; Exit status 0
    syscall