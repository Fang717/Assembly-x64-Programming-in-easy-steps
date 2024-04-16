;--------------------------------------------------------------------
; PARAMS: A program to demonstrate passing stack arguments.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA


.CODE

max PROC
MOV RCX, [RSP+16]	; Copy 1st arg. value.
MOV RDX, [RSP+8]	; Copy 2nd arg. value.
CMP RCX, RDX		; Find largest value.
JG large			; Branch to location #1.
MOV RAX, RDX		; Else copy 2nd arg. as result...
JMP finish			; Then branch to location #2.
large:				; Location #1.
MOV RAX, RCX		; Copy 1str arg. as result.
finish:				; Location #2.
RET					; Automatically Pop return address.
max ENDP

main PROC
XOR RAX, RAX
PUSH 100		; Add 1st arg. to stack.
PUSH 500		; Add to stack.
CALL max		; Get largest value.

ADD RSP, 16		; Rebalance stack.

CALL ExitProcess
main ENDP

END