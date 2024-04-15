;--------------------------------------------------------------------
; nasm: A barebones template for Assembly programming.
;--------------------------------------------------------------------

section .data
    
section .text
    global _start

_start:
   

    ; Exit the program
    mov eax, 60         ; syscall number for exit
    xor edi, edi        ; exit code 0
    syscall
