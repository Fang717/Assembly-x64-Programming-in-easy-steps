;--------------------------------------------------------------------
; SATUR: A program to demonstrate saturation arithmetic.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
nums SBYTE 16 DUP(50)
tons SBYTE 16 DUP (100)

.CODE
main PROC

MOVDQA XMM0, XMMWORD PTR [ nums ]
PADDSB XMM0, tons					; Add 2nd array elems to 1st array elems
									; to exceed upper limit of 127.

MOVDQA XMM0, XMMWORD PTR [ nums ]
PSUBSB XMM0, tons					; Subtract 2nd array elems from 1st array elems
PSUBSB XMM0, tons					; to exceed lower limit of -128.

CALL ExitProcess
main ENDP

END