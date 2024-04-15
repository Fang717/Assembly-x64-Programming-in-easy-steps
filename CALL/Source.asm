;--------------------------------------------------------------------
; A file providing a function to return the sum of 2 arguments.
;--------------------------------------------------------------------

.CODE

DoSum PROC
MOV RAX, RCX
ADD RAX, RDX
RET
DoSum ENDP

END