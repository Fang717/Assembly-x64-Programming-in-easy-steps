INCLUDELIB kernel32.lib
ExitProcess PROTO
ReadFile PROTO			; Import functions.
GetStdHandle PROTO
WriteConsoleA PROTO
CreateFileA PROTO

clearRegisters MACRO
XOR RAX, RAX
XOR RCX, RCX
XOR RDX, RDX
XOR R8, R8
XOR R9, R9
ENDM

GENERIC_READ		EQU 080000000h	; File modes.
GENERIC_WRITE		EQU 040000000h
FILE_SHARE_READ		EQU 1
FILE_SHARE_WRITE	EQU 2
OPEN_ALWAYS			EQU 4
FILE_ATTRIBUTE_NORMAL	EQU 128

.DATA
filePath BYTE "C:\Users\mike_\Desktop\Quote.txt"	; Path of file to read.
fileHandle QWORD ?									; Variable to store file handle.
buffer BYTE 100 DUP (?)								; Variable to store bytes read.
num DWORD ?												; Variable to store number of bytes read.

.CODE
main PROC

clearRegisters

SUB RSP, 64									; Create shadow space for up to 8 args.

LEA RCX, filePath							; Pass path to file - arg1.
MOV RDX, GENERIC_READ OR GENERIC_WRITE		; Pass read/write modes - arg2.
MOV R8, FILE_SHARE_READ OR FILE_SHARE_WRITE	; Pass share modes - arg3.
MOV R9, 0									; Pass security mode - arg4.
MOV DWORD PTR [RSP+32], OPEN_ALWAYS			; Pass creation mode - arg5.
MOV DWORD PTR [RSP+40], FILE_ATTRIBUTE_NORMAL	; Pass attribs - arg6.
MOV DWORD PTR [RSP+48], 0					; Pass no template - arg7.
CALL CreateFileA							; Create or open existing file.
MOV fileHandle, RAX							; Store the returned file handle.

clearRegisters

MOV RCX, fileHandle			; Pass file handle - arg1.
LEA RDX, buffer				; Pass pointer to variable to store bytes read - arg2.
MOV R8, LENGTHOF buffer		; Pass length of bytes to read - arg3.
LEA R9, num					; Pass pointer for number bytes read - arg4.
MOV QWORD PTR [RSP+32], 0	; Pass no overlapped structure - arg5.
CALL ReadFile				; Receive bytes read.

clearRegisters

MOV RCX, -11				; Device code for console output.
CALL GetStdHandle			; Pass device code arg to receive device handle.
MOV RCX, RAX				; Pass device handle - arg1.
LEA RDX, buffer				; Pass pointer to read string - arg2.
MOV R8, LENGTHOF buffer		; Pass number of bytes to write - arg3.
							; Omit optional pointer for number of bytes written (arg4).
CALL WriteConsoleA			; Write into the console.

ADD RSP, 64					; Restore the stack.

CALL ExitProcess
main ENDP

END