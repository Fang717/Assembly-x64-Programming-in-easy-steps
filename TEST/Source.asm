;--------------------------------------------------------------------
; TEST: A program to demonstrate testing bits.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA


.CODE
main PROC
XOR RCX, RCX
MOV  RCX, 0111b	
TEST RCX, 0001b		; Test parity.
MOV  RCX, 1000b
TEST RCX, 0001b		; Test parity.
MOV  RCX, 0111b
TEST RCX, 0100b		; Test bit set.
MOV  RCX, 1000b
TEST RCX, 0100b		; Test bit set.
CALL ExitProcess
main ENDP

END