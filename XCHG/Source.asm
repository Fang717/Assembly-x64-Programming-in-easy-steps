;--------------------------------------------------------------------
; XCHG: A program to demonstrate data exchange.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
var QWORD ?			; Declare variable mem.

.CODE
main PROC
XOR RCX, RCX		; Clear reg.
XOR RDX, RDX		; Clear reg.
MOV RCX, 5				; Copy reg/ imm.
XCHG RCX, var		; Exchange reg/mem
MOV DL, 3				; Copy reg/ imm.
XCHG DH, DL			; Exchange reg/reg.
CALL ExitProcess
main ENDP
END