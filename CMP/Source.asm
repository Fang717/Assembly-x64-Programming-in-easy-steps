;--------------------------------------------------------------------
; JCOND: A program to demonstrate conditional branching.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA


.CODE
main PROC
XOR RDX, RDX
MOV RBX, 100
MOV RCX, 200
CMP RCX, RBX	; 200 > 100?
JA above		; Branch to location #1.
MOV RDX, 1		; Omitted.
above:			; Location #1.
MOV RCX, 50
CMP RCX, RBX	; 50 > 100 ?
JB below		; Branch to location #2.
MOV RDX, 2		; Omitted.
below:			; Location #2.
MOV RCX, 100
CMP RCX, RBX	; 100 == 100 ?
JBE equal		; Branch to location #3.
MOV RDX, 3		; Omitted.
equal:			; Location #3.
CALL ExitProcess
main ENDP
END