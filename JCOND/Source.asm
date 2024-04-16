;--------------------------------------------------------------------
; JCOND: A program to demonstrate conditional branching.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib	
ExitProcess PROTO			

.DATA						
							

.CODE						
main PROC					
XOR RDX, RDX
MOV CL, 255	
ADD CL, 1		; Exceed positive limit to set carry flag.
JC carry		; Branch to location #1.
MOV RDX, 1		; Omitted.
carry:			; Location #1.
MOV CL, -128	
SUB CL, 1		; Exceed negative limit to set overflow flag.
JO overflow		; Branch to location #2.
MOV RDX, 2		; Omitted.
overflow:		; Location #2.
MOV CL, 255		
AND CL, 10000000b	; Swap to positive to unset the sign flag.
JS sign				; Branch to location #3.
MOV RDX, 3			; Omitted.
sign:				; Location #3.
JNZ notZero			; Branch to location #4.
MOV RDX, 4			; Omitted.
notZero:			; Location #4.		
CALL ExitProcess			
main ENDP					
END							