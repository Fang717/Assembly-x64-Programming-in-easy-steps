;--------------------------------------------------------------------
; MSGBOX: A program to demonstrate receiving input from a dialog.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

INCLUDELIB user32.lib
MessageBoxA PROTO

.DATA
msg BYTE "Are you ready to continue...",0
ttl BYTE "Assembly X64 Programming",0

.CODE
main PROC
XOR RAX, RAX
AND RSP, -16			; Align the stack to 16-bytes.
SUB RSP, 32			; Create shadow space for 4 args.
MOV RCX, 0			; No owner window - arg1.
LEA RDX, msg		; Dialog text - arg2.
LEA R8, ttl			; Title text - arg3.
MOV	R9, 35			; YesNoCancel + ? Icon - arg4.
CALL MessageBoxA	; Pass return address - arg5.
CALL ExitProcess	
ADD RSP, 32			; Restore stack.
main ENDP

END