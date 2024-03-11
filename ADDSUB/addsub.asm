;   #!/bin/bash
;   # Simple assemble/link script.
;   if [ -z $1 ]; then
;   echo "Usage: ./asm64 <asmMainFile> (no extension)"
;   exit
;   fi
;   # Verify no extensions were entered
;   if [ ! -e "$1.asm" ]; then
;   echo "Error, $1.asm not found."
;   echo "Note, do not enter file extensions."
;   exit
;   fi
;   # Compile, assemble, and link.
;   yasm -Worphan-labels -g dwarf2 -f elf64 $1.asm -l $1.lst
;   ld -g -o $1 $1.o




;   https://yasm.tortall.net/
;   The Yasm Modular Assembler Project

;--------------------------------------------------------------------
; ADDSUB: A program to demonstrate addition and subtraction.
;--------------------------------------------------------------------

BITS 64

SECTION .data
var: dq 64
num: dq 12

SECTION .text

global _start


The global directive exports the _start symbol so it can be linked by the linker. This will be the entry point.

_start:

    ; Call main function
    call main


;   _start label defines the entry point that will be called by the linker.
;   It begins by calling the main function using the call instruction. This pushes the return address onto the stack so that main can return here after it is done.    

    ; Exit program
    mov rax, 60
    mov rdi, 0
    syscall

;   After main returns, _start prepares to exit the program:
;   mov rax, 60 - Store the syscall number for exit in rax (60)
;   mov rdi, 0 - Store the exit code (0 for success) in rdi
;   syscall - Execute the exit system call to terminate the program



main:
    xor rcx, rcx
    xor rdx, rdx

;   The main label defines the entry point for the main function called by _start.
;   xor rcx, rcx and xor rdx, rdx clear the RCX and RDX registers by XORing them against themselves.    
    
    mov rcx, 36
    add rcx, [var]  
    mov rdx, 400
    add rdx, rcx
    sub rcx, 100

;   Move immediate values into registers, load from memory variable, perform arithmetic operations to demonstrate addition/subtraction.    

    ; Return to _start
    ret


;   ret returns from main back to the instruction after _start's call main - which will be the exit syscall.    