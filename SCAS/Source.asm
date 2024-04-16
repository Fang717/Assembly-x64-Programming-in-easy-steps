;--------------------------------------------------------------------
; SCAS: A program to demonstrate string scanning.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
src BYTE 'abc'
found BYTE ?

.CODE
main PROC
XOR RAX, RAX
MOV AL, 'b'			; Character to seek.
LEA RDI, src		; Start address of string to scan.
MOV RCX, SIZEOF src	; Number of bytes in string.

CLD					; Clear direction flag.
REPNE SCASB			; Seek character in string.

JNZ absent			; If absent branch to loacation #1.
MOV found, 1		; Else assign 1 if found...
JMP finish			; Then branch to location #2.

absent:				; Location #1.
MOV found, 0		; Assign 0 if not found.
finish:				; Location #2.

CALL ExitProcess
main ENDP

END