;--------------------------------------------------------------------
; MFOR: A program to demonstrate iterating loops.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

nums MACRO arg1, arg2, arg3
	FOR arg, <arg1, arg2, arg3>	; Iterate through integer list.
	PUSH arg
	ENDM
POP RCX							; Assign each integer to a register.
POP RBX
POP RAX
ENDM

chars MACRO arglist
	FORC arg, arglist			; Iterate through character list.
	PUSH '&arg'
	ENDM
POP RCX							; Assign each character to a register.
POP RBX
POP RAX
ENDM

.DATA



.CODE
main PROC
nums 1,2,3			; Pass integer arguments.
chars <ABC>			; Pass character argument list.
CALL ExitProcess
main ENDP

END