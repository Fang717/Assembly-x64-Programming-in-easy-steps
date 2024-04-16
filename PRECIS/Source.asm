;--------------------------------------------------------------------
; PRECIS: A program to demonstrate single/double precision.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
nums REAL4 1.5, 2.5, 3.5, 3.1416		; 4 * 32-bit single-precision numbers = 128-bits.
dubs REAL8 1.5, 3.1415926535897932		; 2 * 64-bit double-precision numbers = 128-bits.

.CODE
main PROC
MOVAPS XMM0, nums		; Copy aligned packed single-precision number.
MOVAPD XMM1, dubs		; Copy aligned packed double-precision number.
CALL ExitProcess
main ENDP

END