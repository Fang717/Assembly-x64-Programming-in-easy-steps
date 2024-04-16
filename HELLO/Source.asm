;--------------------------------------------------------------------
; HELLO: A program to demonstrate output to the console.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

GetStdHandle	PROTO
WriteConsoleA	PROTO
deviceCode EQU -11							; Code for console output.

.DATA
txt BYTE 10," Hello World! ",10,10,0		; 10 is ASCII line feed.
handle QWORD ?								; Variable to store handle.
num BYTE ?									; Variable to store number of bytes written.

.CODE
main PROC
XOR RAX, RAX			; Clear regs.
XOR RCX, RCX
XOR RDX, RDX
XOR R8, R8
XOR R9, R9

SUB RSP, 32				; Create shadow space for 4 args.

MOV RCX, deviceCode		; Console device code, to be passed to GetStdHandle.
CALL GetStdHandle		; Receive the console output handle.
MOV handle, RAX			; Store the console output handle..

MOV RCX, handle			; Pass the handle - arg1. 
LEA RDX, txt			; Pass a pointer to the string - arg2.
MOV R8, LENGTHOF txt	; Pass number of characters to write - arg3. 
LEA R9, num				; Pass pointer to variable to store number of bytes written.
CALL WriteConsoleA		; Write the string into the console.
ADD RSP, 32				; Restore the stack.

CALL ExitProcess
main ENDP

END