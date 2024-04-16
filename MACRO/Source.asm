;--------------------------------------------------------------------
; MACRO: A program to demonstrate macro expansion.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

; Text macro.
clrRAX TEXTEQU <XOR RAX, RAX>

; Macro procedure.
clrRCX MACRO
XOR RCX, RCX
ENDM

.DATA



.CODE
main PROC
clrRAX	; Expand text macro.
clrRCX	; Expand macro procedure.
CALL ExitProcess
main ENDP

END