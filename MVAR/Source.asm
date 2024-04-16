;--------------------------------------------------------------------
; MVAR: A program to demonstrate parameter for various arguments.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

sumArgs MACRO arglist:VARARG
sum = 0
i = 0
FOR arg, <arglist>
i = i + 1 
sum = sum + arg
ENDM
MOV RCX, i
EXITM <sum>							; Return the sum total of all args.
ENDM

.DATA



.CODE
main PROC
MOV RAX, sumArgs(1,2,3,4)			; Pass 4 args.
MOV RAX, sumArgs(1,2,3,4,5,6,7,8)	; Pass 8 args.
CALL ExitProcess
main ENDP

END