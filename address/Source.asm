;--------------------------------------------------------------------
; ADDRESS: A program to demonstrate indirect memory addressing.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
a BYTE 10
b BYTE 20
c BYTE 30
d BYTE 40

.CODE
main PROC
XOR RDX, RDX
MOV AL, a		; Direct memory addressing.
MOV AH, a + 3	; Direct offset addressing.

LEA RCX, b		; Acquire memory address.

MOV DL, [ RCX ]		; Indirect memory addressing.
MOV DH, [ RCX + 1]	; Indirect memory offset addressing.


CALL ExitProcess
main ENDP

END