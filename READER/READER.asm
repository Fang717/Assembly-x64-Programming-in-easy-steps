section .text
    global _start

_start:
    ; clearRegisters MACRO
    xor rax, rax
    xor rcx, rcx
    xor rdx, rdx
    xor r8, r8
    xor r9, r9

    ; Define constants
    %define GENERIC_READ 0x80000000
    %define GENERIC_WRITE 0x40000000
    %define FILE_SHARE_READ 1
    %define FILE_SHARE_WRITE 2
    %define OPEN_ALWAYS 4
    %define FILE_ATTRIBUTE_NORMAL 128

SECTION .data
    filePath db '/home/mike_/Desktop/Quote.txt', 0 ; Path of file to read
    fileHandle dq 0 ; Variable to store file handle
    buffer times 100 db 0 ; Variable to store bytes read
    num dd 0 ; Variable to store number of bytes read

SECTION .text
    ; clearRegisters MACRO
    xor rax, rax
    xor rcx, rcx
    xor rdx, rdx
    xor r8, r8
    xor r9, r9

    ; Allocate space for arguments
    sub rsp, 64

    ; Open or create the file
    lea rcx, [rel filePath] ; Pass path to file - arg1
    mov rdx, GENERIC_READ | GENERIC_WRITE ; Pass read/write modes - arg2
    mov r8, FILE_SHARE_READ | FILE_SHARE_WRITE ; Pass share modes - arg3
    xor r9, r9 ; Pass security mode - arg4
    mov dword [rsp + 32], OPEN_ALWAYS ; Pass creation mode - arg5
    mov dword [rsp + 40], FILE_ATTRIBUTE_NORMAL ; Pass attribs - arg6
    xor r9, r9 ; Pass no template - arg7
    mov rax, 2 ; syscall number for open
    syscall ; Open or create the file

    mov [rel fileHandle], rax ; Store the returned file handle

    ; clearRegisters MACRO
    xor rax, rax
    xor rcx, rcx
    xor rdx, rdx
    xor r8, r8
    xor r9, r9

    ; Read from the file
    mov rdi, [rel fileHandle] ; Pass file handle - arg1
    lea rsi, [rel buffer] ; Pass pointer to variable to store bytes read - arg2
    mov rdx, 100 ; Pass length of bytes to read - arg3
    lea r10, [rel num] ; Pass pointer for number bytes read - arg4
    xor r8, r8 ; Pass no overlapped structure - arg5
    mov rax, 0 ; syscall number for read
    syscall ; Read from the file

    ; clearRegisters MACRO
    xor rax, rax
    xor rcx, rcx
    xor rdx, rdx
    xor r8, r8
    xor r9, r9

    ; Write to the console
    mov rax, 1 ; syscall number for write
    mov rdi, 1 ; File descriptor for stdout
    lea rsi, [rel buffer] ; Pass pointer to read string - arg2
    mov rdx, 100 ; Pass number of bytes to write - arg3
    syscall ; Write to the console

    ; Exit the program
    mov rax, 60 ; syscall number for exit
    xor rdi, rdi ; Exit status 0
    syscall