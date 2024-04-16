;--------------------------------------------------------------------
; ENTER: A program to demonstrate input from the console.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO
GetStdHandle PROTO
ReadConsoleA PROTO
deviceCode EQU -10		; Code for console input.

.DATA
txt BYTE 100 DUP (?)	; Array to store input.
handle QWORD ?			; Variable to store device handle.
num BYTE ?				; Variable tyo store number of bytes read.

.CODE
main PROC
XOR RAX, RAX			; Clear regs.
XOR RCX, RCX
XOR RDX, RDX
XOR R8, R8
XOR R9, R9

SUB RSP, 32				; Create shadow space for 4 args.
MOV RCX, deviceCode		; Move device code to reg.
CALL GetStdHandle		; Receive the console input handle.
MOV handle, RAX			; Store the console input handle.

MOV RCX, handle			; Pass in 4 args.
LEA RDX, txt
MOV R8, LENGTHOF txt
LEA R9, num
CALL ReadConsoleA		; Receive input.
ADD RSP, 32				; Restore stack.

CALL ExitProcess
main ENDP

END