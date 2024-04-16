;--------------------------------------------------------------------
; INDEX: A program to demonstrate addressing via source index.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
arr QWORD 10, 20, 30

.CODE
main PROC
XOR RCX, RCX
XOR RDX, RDX
LEA RSI, arr				; Copy address of array start.
MOV RCX, 0					; Initialize counter.
start:						; Location #1.
MOV RDX, [RSI + RCX * 8]	; Get element value: base + index * scale.
INC RCX						; Increment counter.
CMP RCX, LENGTHOF arr		; Test for end of array.
JNE start					; Else branch to location #1.
CALL ExitProcess
main ENDP

END