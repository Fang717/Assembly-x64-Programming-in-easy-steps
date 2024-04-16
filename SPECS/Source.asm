;--------------------------------------------------------------------
; SPECS: A program to demonstrate special instructions.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
nums1 REAL4 44.5, 58.25, 32.6, 19.8
nums2 REAL4 22.7, 73.2, 66.15, 12.3

.CODE
main PROC

MOVDQA XMM1, XMMWORD PTR [ nums1 ]
MOVDQA XMM2, XMMWORD PTR [ nums2 ]
MAXPS XMM1, XMM2						; Maximum of each pair of elem values.

MOVDQA XMM1, XMMWORD PTR [ nums1 ]
MINPS XMM1, XMM2						; Minimum of each pair of elem values.

ROUNDPS XMM1, XMM1,						; Round floats to integers.
ROUNDPS XMM2, XMM2, 00b
PAVGW XMM1, XMM2						; Average of each pair of elem values.

CALL ExitProcess
main ENDP

END