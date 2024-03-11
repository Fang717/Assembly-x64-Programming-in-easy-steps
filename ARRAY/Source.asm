;--------------------------------------------------------------------
; ARRAY: A program to demonstrate parallel floating-point arithmetic.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
nums REAL4 12.5, 25.0, 37.5, 50.0	; Initialize two 32-bit single-precision arrays.
numf REAL4 2.0, 3.0, 4.0, 5.0

dubs REAL8 12.5, 25.0				; Initialize two 64-bit double-precision arrays.
dubf REAL8 2.0, 3.0

.CODE
main PROC
MOVAPS XMM0, XMMWORD PTR [ nums ]	; Copy elems to 128-bit regs.
MOVAPS XMM1, XMMWORD PTR [ numf ]
DIVPS	XMM0, XMM1					; Perform parallel single-precision division.
MOVAPD XMM2, XMMWORD PTR [ dubs ]	; Copy elems to 128-bit regs.
MOVAPD XMM3, XMMWORD PTR [ dubf ]
DIVPD XMM2, XMM3					; Perform parallel double-precision division.
CALL ExitProcess
main ENDP

END
