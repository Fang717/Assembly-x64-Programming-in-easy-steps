;--------------------------------------------------------------------
; JSIGN: A program to demonstrate conditional branching.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib		
ExitProcess PROTO		

.DATA						
						

.CODE						
main PROC					
XOR RDX, RDX
MOV RBX, -4

MOV RCX, -1
CMP RCX, RBX	; -1 > -4 ?
JG greater		; Branch to location #1.
MOV RDX, 1		; Omitted.
greater:		; Location #1.

MOV RCX, -16
CMP RCX, RBX	; -1 < -16 ?
JL less			; Branch to location #2.
MOV RDX, 2		; Omitted.
less:			; Location #2.

MOV RCX, -4
CMP RCX, RBX	; -4 == -4 ?
JLE equal		; Branch to location #3.
MOV RDX, 3		; Omitted.
equal:			; Location #3.

CMP RCX, RBX		; -4 !<= -4 ?
JNLE notLessOrEqual	; No branch to location #4.
MOV RDX, 4			; Implemented.
notLessOrEqual:		; Location #4.
CALL ExitProcess			
main ENDP				
END						