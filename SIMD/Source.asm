;--------------------------------------------------------------------
; SIMD: A program to demonstrate parallel addition processing.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
nums0 DWORD 1,2,3,4
nums1 DWORD 1,3,5,7

.CODE
main PROC
MOVDQA XMM0, XMMWORD PTR [nums0]	; Copy all 1st array elems into reg.
PADDD XMM0, XMMWORD PTR [nums1]		; Add all 2nd array elems to 1st array elems.
CALL ExitProcess
main ENDP

END