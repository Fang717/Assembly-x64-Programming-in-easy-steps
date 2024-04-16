;--------------------------------------------------------------------
; SCALAR: A program to demonstrate scalar floating-point arithmetic.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
num REAL4 16.0
factor REAL4 2.5

.CODE
main PROC
MOVSS XMM0, num		; Assign 32-bit scalar values.
MOVSS XMM1, factor
ADDSS XMM0, XMM1	; Assign results to XMM0.
MULSS XMM0, XMM1
SUBSS XMM0, XMM1
DIVSS XMM0, XMM1
CALL ExitProcess
main ENDP

END