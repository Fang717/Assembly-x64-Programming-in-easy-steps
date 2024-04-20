;--------------------------------------------------------------------
; CREATE: A program to demonstrate file creation.
;--------------------------------------------------------------------



section .data
    filePath db "/home/user/Quote.txt", 0 ; Path of file to write into.
    fileHandle dq 0 ; Variable to store file handle.

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


; Close file
    mov rax, 3          ; sys_close syscall
    mov rdi, [fileHandle] ; file handle
    syscall




; Exit the program
    mov rax, 60             ; sys_exit system call
    xor rdi, rdi            ; Exit status 0
    syscall
