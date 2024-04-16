;--------------------------------------------------------------------
; CREATE: A program to demonstrate file creation.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

CreateFileA PROTO						; Import function.

GENERIC_READ		EQU 080000000h		; File modes.
GENERIC_WRITE		EQU 040000000h
FILE_SHARE_READ		EQU 1
FILE_SHARE_WRITE	EQU 2
OPEN_ALWAYS			EQU 4
FILE_ATTRIBUTE_NORMAL	EQU 128

.DATA
filePath BYTE "C:\Users\mike_\Desktop\Quote.txt" ; Path for new file.
fileHandle QWORD ?								 ; Variable to store file handle.

.CODE
main PROC
XOR RAX, RAX		; Clear regs.
XOR RCX, RCX
XOR RDX, RDX
XOR R8, R8
XOR R9, R9

SUB RSP, 64										; Create shadow space for up to 8 args.

LEA RCX, filePath								; Pass path - arg1.
MOV RDX, GENERIC_READ OR GENERIC_WRITE			; Pass read/write mode - arg2.
MOV R8, FILE_SHARE_WRITE						; Pass share mode - arg3.
MOV R9, 0										; Pass security mode - arg4.
MOV DWORD PTR [RSP+32], OPEN_ALWAYS				; Pass creation mode - arg5.
MOV DWORD PTR [RSP+40], FILE_ATTRIBUTE_NORMAL	; Pass attributes - arg6.
MOV DWORD PTR [RSP+48], 0						; Pass no template - arg7.
CALL CreateFileA								; Create the file.

MOV fileHandle, RAX								; Store the returned file handle.

ADD RSP, 64										; Restore the stack.

CALL ExitProcess
main ENDP

END