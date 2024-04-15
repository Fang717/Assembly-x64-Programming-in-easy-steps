;--------------------------------------------------------------------
; EQU: A program to demonstrate memory constant.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess proto

.DATA
con EQU 12							; Initialize mem constant.

.CODE
main PROC
MOV RCX, con						; Copy reg/mem.
MOV RDX, con + 8				; Copy reg/mem + imm.
MOV RCX, con + 8 * 2			; Copy unclear expr.
MOV RDX, ( con + 8 ) * 2	; Copy clear expr.
MOV RCX, con mod 5			; Copy modulo quotient.
MOV RDX, ( con - 3 ) / 3		; Copy division quotient.
CALL ExitProcess
main ENDP
END
