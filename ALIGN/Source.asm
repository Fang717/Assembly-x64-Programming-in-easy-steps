;--------------------------------------------------------------------
; ALIGN: A program to demonstrate alignment to 16-byte boundaries.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
nums0 DWORD 1,2,3,4			; 4 * 4-byte = 16-bytes... in alignment.
snag BYTE 100				; + 1-byte = 17-bytes... out of alignment.
;ALIGN 16					; <- Uncomment this directive for correct alignment.
nums1 DWORD 5,5,5,5

.CODE
main PROC
MOVDQA XMM0, XMMWORD PTR [nums0]
MOVDQA XMM1, XMMWORD PTR [nums1]
PSUBD XMM0, XMM1
CALL ExitProcess
main ENDP

END
