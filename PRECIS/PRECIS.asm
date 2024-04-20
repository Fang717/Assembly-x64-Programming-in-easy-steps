;--------------------------------------------------------------------
; PRECIS: A program to demonstrate single/double precision.
;--------------------------------------------------------------------

section .data
	align 16                    ; Align the data on a 16-byte boundary
    nums dd 1.5, 2.5, 3.5, 3.1416 ; 4 * 32-bit single-precision numbers = 128-bits
    dubs dq 1.5, 3.1415926535897932 ; 2 * 64-bit double-precision numbers = 128-bits

section .text
	global _start
_start:	
	movaps xmm0, [nums]		; Copy aligned packed single-precision number.
	movapd xmm1, [dubs]		; Copy aligned packed double-precision number.
 ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80