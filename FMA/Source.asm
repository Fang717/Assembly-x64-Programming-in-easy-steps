;--------------------------------------------------------------------
; FMA: A program to demonstrate fused multiply-add operations.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
numA REAL4 2.0
numB REAL4 8.0
numC REAL4 5.0

.CODE
main PROC

MOVSS XMM0, numA
MOVSS XMM1, numB
MOVSS XMM2, numC

VFMADD132SS XMM0, XMM1, XMM2	; 1st x 3rd + 2nd	
MOVSS XMM0, numA
VFMADD213SS XMM0, XMM1, XMM2	; 2nd x 1st + 3rd	
MOVSS XMM0, numA
VFMADD231SS XMM0, XMM1, XMM2	; 2nd x 3rd + 1st

CALL ExitProcess
main ENDP

END