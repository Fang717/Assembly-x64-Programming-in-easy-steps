;--------------------------------------------------------------------
; FRAME: A program to demonstrate stack frame.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA

.CODE

total PROC
PUSH RBP			; Add base pointer to stack.
MOV RBP, RSP		; Copy stack pointer to base - rbp remains unchanged throughout.
SUB RSP, 16			; Reserve space for 2 quad word local variables.

MOV RAX, [RBP+16]	; Copy arg. to reg.
MOV [RBP-8], RAX	; Copy arg. to 1st local variable.
MOV [RBP-16], RAX	; Copy arg. to 2nd local variable.
ADD RAX, [RBP-8]	; Add 1st local variable value to reg.
ADD RAX, [RBP-16]	; Add 2nd local variable value to reg.

MOV RSP, RBP		; Restore stack pointer.
POP RBP				; Restore base pointer.
RET					; Automatically pop return address.
total ENDP

main PROC
XOR RAX, RAX
PUSH 100			; Add a stack arg.
CALL total			; Add copies of stack arg.
ADD RSP, 8			; Rebalance the stack.
CALL ExitProcess
main ENDP

END