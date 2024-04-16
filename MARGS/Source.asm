;--------------------------------------------------------------------
; MARGS: A program to demonstrate macro parameters.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

; Macro procedure with one param.
clrReg MACRO reg
XOR reg, reg
ENDM

; Macro procedure with required and default value params.
sum MACRO reg:REQ, x:=<2>,y:=<8>
MOV reg,x
ADD reg,y
ENDM 

.DATA


.CODE
main PROC
clrReg RAX
sum RBX			; Pass 1 arg.
sum RBX,12		; Pass 2 args.
sum RBX, 18, 12	; Pass 3 args.
CALL ExitProcess
main ENDP

END