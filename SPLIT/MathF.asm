;--------------------------------------------------------------------
; MATHF: A file providing basic arithmetical functions.
;--------------------------------------------------------------------
.CODE

DoAdd PROC
MOV RAX, RCX
ADD RAX, RDX
RET
DoAdd ENDP

DoSub PROC
MOV RAX, RCX
SUB RAX, RDX
RET
DoSub ENDP

DoMul PROC
MUL RCX
RET
DoMul ENDP

DoDiv PROC
SHR RAX, 1
DIV RCX
RET
DoDiv ENDP

END