;--------------------------------------------------------------------
; AVX: A program to demonstrate 256-bit parallel arithmetic.
;--------------------------------------------------------------------


INCLUDELIB kernel32.lib
ExitProcess PROTO

.DATA
vec1 REAL4 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0
vec2 REAL4 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0

.CODE
main PROC
VMOVAPS YMM1, YMMWORD PTR [vec1]
VMOVAPS YMM2, YMMWORD PTR [vec2]

VMULPS YMM0, YMM1, YMM2
VADDPS YMM0, YMM1, YMM2

VSUBPS YMM0, YMM2, YMM1
VDIVPS YMM0, YMM2, YMM1

CALL ExitProcess
main ENDP

END