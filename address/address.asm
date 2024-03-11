;#!/bin/bash
;# Simple assemble/link script.
;if [ -z $1 ]; then
;echo "Usage: ./asm64 <asmMainFile> (no extension)"
;exit
;fi
;# Verify no extensions were entered
;if [ ! -e "$1.asm" ]; then
;echo "Error, $1.asm not found."
;echo "Note, do not enter file extensions."
;exit
;fi
;# Compile, assemble, and link.
;yasm -Worphan-labels -g dwarf2 -f elf64 $1.asm -l $1.lst
;ld -g -o $1 $1.o



;   Addressing modes in NASM x64 assembly.


; NASM / YASM assembly for Linux x64

global _start

;   It starts by declaring _start as a global symbol, making it accessible to the operating system loader.

section .data
a: db 10
b: db 20 
c: db 30
d: db 40

;   The .data section declares 4 byte variables a, b, c, and d initialized to the given values.

section .text

;   The .text section contains the code. _start is the program entry point after the OS loader calls it.

_start:

    ; Initialize registers
    xor rdx, rdx      ;  First it zeroes out rdx register using xor. 
    mov al, [a]       ; Direct memory addressing
;   Then it loads the value from memory address of variable a into al register using direct addressing.


    mov ah, [a+3]     ; Direct offset addressing

; Next it loads the value at offset +3 bytes from a into ah register, demonstrating direct offset addressing.

    
    lea rcx, [b]      ; Get address of b

; It loads the address of variable b into rcx register using the lea instruction.    

    
    mov dl, [rcx]     ; Indirect memory addressing

;   Then it loads the value from memory address in rcx into dl, this is indirect addressing since it uses the address stored in rcx. 

    mov dh, [rcx+1]   ; Indirect offset addressing

; Next it loads the byte at offset +1 from rcx into dh, showing indirect offset addressing.

;So in summary, it initializes some data, registers and shows different addressing modes to access memory - direct,
; direct offset, indirect, indirect offset. This allows loading from static or dynamic addresses stored in registers.

    mov rax, 60
    mov rdi, 0
    syscall

; Exit

