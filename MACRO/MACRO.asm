;--------------------------------------------------------------------
; MACRO: A program to demonstrate macro expansion.
;--------------------------------------------------------------------
%define clrRAX xor rax, rax    ; Text macro
%macro clrRCX 0                ; Macro procedure
    xor rcx, rcx
%endmacro

section .text
    global _start

_start:
    clrRAX                     ; Expand text macro
    clrRCX                     ; Expand macro procedure

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80