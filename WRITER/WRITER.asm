; --------------------------------------------------------------------
; WRITER: A program to demonstrate writing output in a file.
; --------------------------------------------------------------------

section .data
    filePath db "/home/user/Desktop/Quote.txt", 0 ; Path of file to write into.
    fileHandle dq 0 ; Variable to store file handle.
    txt db "The truth is rarely pure and never simple.", 0 ; String to write.
    txt_len equ $ - txt ; Length of the string (excluding null terminator)
    num dd 0

section .text
    global _start

_start:
    ; Create file
    mov rax, 2          ; sys_open syscall
    mov rdi, filePath   ; path
    mov rsi, 0x241      ; O_CREAT | O_WRONLY
    mov rdx, 0644o      ; file mode
    syscall
    mov [fileHandle], rax ; store file handle

    ; Write to file
    mov rax, 1          ; sys_write syscall
    mov rdi, [fileHandle] ; file handle
    mov rsi, txt        ; pointer to string
    mov rdx, txt_len    ; number of bytes to write
    syscall
    mov [num], eax      ; store bytes written

    ; Close file
    mov rax, 3          ; sys_close syscall
    mov rdi, [fileHandle] ; file handle
    syscall

    ; Exit
    mov rax, 60         ; sys_exit syscall
    xor rdi, rdi        ; exit status 0
    syscall