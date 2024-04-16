;--------------------------------------------------------------------
; STACK: A program to demonstrate stack operations.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
 var WORD 256	; Assign initial value to memory.

.CODE
main PROC
MOV RAX, 64		; Assign initial value to register.

PUSH RAX		; Copy register value onto the top of the stack.
MOV RAX, 25		; Overwrite initial register value.

PUSH var		; Copy memory value onto the top of the stack.
MOV var, 75		; Overwrite initial memory value.

POP var			; Move stack top to resume initial memory value.
POP R10			; Move stack top to other register.

CALL ExitProcess
main ENDP

END