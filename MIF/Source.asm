;--------------------------------------------------------------------
; MIF: A program to demonstrate conditional branching.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

scan MACRO num
IF num GT 50
MOV RAX, 1			; num > 50 ?
ELSEIF num LT 50
MOV RAX, 0			; num < 50 ?
ELSE
MOV RAX, num		; num == 50.
ENDIF
ENDM

.DATA



.CODE
main PROC
scan 100			; Test arg. values.
scan 10
scan 50
CALL ExitProcess
main ENDP

END