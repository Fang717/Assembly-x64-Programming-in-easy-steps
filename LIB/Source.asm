;--------------------------------------------------------------------
; LIB: A program to demonstrate custom libaries.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

INCLUDELIB C:\Users\mike_\source\repos\LIB\x64\Debug\MathF.lib 	; Include custom library.
DoAdd PROTO				; Import functions from library.
DoSub PROTO
DoMul PROTO
DoDiv PROTO

.DATA


.CODE
main PROC
MOV RCX, 8
MOV RDX, 16
CALL DoAdd				; Call imported function.

MOV RCX, 9
MOV RDX, 3
CALL DoSub				; Call imported function.

CALL DoMul				; Call imported function.
CALL DoDiv				; Call imported function.

CALL ExitProcess
main ENDP

END