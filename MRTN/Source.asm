;--------------------------------------------------------------------
; MRTN: A program to demonstrate macro functions.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

factorial MACRO num:REQ
factor = num
i = 1
WHILE factor GT 1
i = i * factor
factor = factor - 1
ENDM
EXITM <i>					; Return factorial of arg.
ENDM

.DATA


.CODE
main PROC
MOV RAX, factorial(4)		; Pass arg. in parens.
MOV RBX, factorial(5)		; Pass arg. in parens.
CALL ExitProcess
main ENDP

END