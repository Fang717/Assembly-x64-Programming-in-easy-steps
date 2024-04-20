;--------------------------------------------------------------------
; SPEED: A file providing a function for parallel multiplication.
;--------------------------------------------------------------------

.CODE
DoRun PROC
MOV RAX, 1
MOVDQA XMM1, XMMWORD PTR [RCX]
MOVDQA XMM2, XMMWORD PTR [RDX]
start:
MULPS XMM1, XMM2
INC RAX
CMP RAX, R8
JL start
RET
DoRun ENDP
END