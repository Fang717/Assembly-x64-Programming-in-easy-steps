;--------------------------------------------------------------------
; SPLIT: A program to demonstrate code split into two files.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

DoAdd PROTO			; Define external function name sytmbols.
DoSub PROTO
DoMul PROTO
DoDiv PROTO

.DATA


.CODE
main PROC
MOV RCX, 8
MOV RDX, 16
CALL DoAdd			; Call function from another file.

MOV RCX, 9
MOV RDX, 3
CALL DoSub			; Call function from another file.

CALL DoMul			; Call function from another file.
CALL DoDiv			; Call function from another file.

CALL ExitProcess
main ENDP

END