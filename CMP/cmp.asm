; This code demonstrates conditional branching using the CMP and Jxx instructions.
;--------------------------------------------------------------------
; JCOND: A program to demonstrate conditional branching.
;--------------------------------------------------------------------
;
; So in summary, this code:
; 1. Compares values using CMP 
; 2. Jumps to different locations based on the comparison results
; 3. Demonstrates how to conditionally branch code execution based on comparisons

global _start  ; global _start declares _start as a global symbol, which is the entry point of the program

section .data

section .text

_start:
                    ;  It initializes some registers:
    xor rdx, rdx    ;  rdx = 0      This instruction clears the RDX register.
    mov rbx, 100    ;  rbx = 100    This instruction moves the value 100 into the RBX register.
    mov rcx, 200    ;  rcx = 200    This instruction moves the value 200 into the RCX register.
    cmp rcx, rbx ; 200 > 100?   ; It then compares rcx to rbx using CMP.If the above comparison is true (200 > 100), the program jumps to the label "above".
    ja above        ; Branch to location #1.
    mov rdx, 100    ; Omitted. MOV RDX, 1: This instruction is skipped because the jump condition was met.
above:              ; Location #1.  above: This is the label for the location where the program jumps if the condition is true.
    mov rcx, 50 ; At the "above" label, it compares 50 to 100 using CMP. Since 50 < 100, the JB instruction will jump to the "below" label.
    cmp rcx, rbx ; 50 > 100 ?
    jb below    ; Branch to location #2.
    mov rdx, 2 ; Omitted.  This instruction is skipped because the jump condition was met.
below:         ; Location #2. JB below: If the comparison result is true (50 < 100), the program jumps to the label "below".
    mov rcx, 100 
    cmp rcx, rbx ; 100 == 100 ? Here CMP compares rcx (100) to rbx (100). Since 100 == 100, the next line JBE jumps to the "equal" label. 
    jbe equal   ; Branch to location #3.
    mov rdx, 3 ; Omitted. This instruction is skipped because the jump condition was met.
equal:         ; Location #3.  At the "equal" label, it exits the program by calling the exit syscall.
    mov rax, 60 ; exit system call, this moves the exit syscall number into rax to prepare for the exit syscall
    mov rdi, 0  ; exit code 0  ; This moves the exit code 0 into rdi to exit with return code 0 
    syscall     ; invoke operating system to exit
                ;  This makes the syscall to exit the program and return control to the operating system

