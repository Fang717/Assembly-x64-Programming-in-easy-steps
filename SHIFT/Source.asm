;--------------------------------------------------------------------
; SHIFT: A program to demonstrate shifting bit values.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib		
ExitProcess PROTO			

.DATA						
unum BYTE  10011001b	; Unsigned number, 153d.				
sneg SBYTE 10011001b	; Signed negative number, -39d.
snum SBYTE 00110011b	; Signed positive number, 51d.

.CODE						
main PROC
XOR RCX, RCX		; Clear reg.
XOR RDX, RDX		; Clear reg.
XOR R8, R8			; Clear reg.
MOV CL, unum		; Assign reg/mem.
MOV DL, sneg		; Assign reg/mem.
MOV R8B, snum		; Assign reg/mem.

SHR CL, 2		; Shift right 2 bits.
SAR DL, 2		; Shift right 2 bits, preseving sign.
SAR R8, 2		; Shift right 2 bits, preserving sign.

CALL ExitProcess			
main ENDP					
END							