;--------------------------------------------------------------------
; RECUR: A program to demonstrate recursive calling function.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA


.CODE

fib PROC
MOV RCX, RDX	; Only to display BOTH previous numbers.
XADD RAX, RDX	; Exchange and add repeatedly.
CMP RAX, 5		; Test for end.
JG finish		; Branch to location #1 if end.
CALL fib		; Else recursive call this function.
finish:			; Location #1.
RET
fib ENDP

main PROC
MOV RAX, 1		; Initialize sequence with 1, 0.
MOV RDX, 0
CALL fib		; Run sequence.
CALL ExitProcess
main ENDP

END