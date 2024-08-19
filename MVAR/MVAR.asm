; MVAR: A program to demonstrate handling variable arguments
; Adapted for YASM assembler on Linux

; Define the exit system call number
SYS_EXIT equ 60

section .data
    ; Define arrays for our argument lists
    args1 dd 1, 2, 3, 4
    args1_count equ ($ - args1) / 4
    
    args2 dd 1, 2, 3, 4, 5, 6, 7, 8
    args2_count equ ($ - args2) / 4

section .text
global _start

; Function to sum an array of 32-bit integers
; Input: rsi = pointer to array, rcx = count of elements
; Output: rax = sum
sum_array:
    xor rax, rax  ; Initialize sum to 0
    xor rdx, rdx  ; Clear rdx for loop counter
.loop:
    add eax, [rsi + rdx * 4]  ; Add current element to sum
    inc rdx                   ; Increment counter
    cmp rdx, rcx              ; Compare counter with count
    jl .loop                  ; If counter < count, continue loop
    ret                       ; Return with sum in rax

_start:
    ; Sum the first array
    mov rsi, args1            ; Point to first array
    mov rcx, args1_count      ; Set count of elements
    call sum_array            ; Call sum function
    ; rax now contains the sum of args1

    ; Sum the second array
    mov rsi, args2            ; Point to second array
    mov rcx, args2_count      ; Set count of elements
    call sum_array            ; Call sum function
    ; rax now contains the sum of args2

    ; Exit the program
    mov rax, SYS_EXIT    ; System call number for exit
    xor rdi, rdi         ; Exit code 0
    syscall              ; Invoke the system call