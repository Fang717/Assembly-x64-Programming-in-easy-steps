;--------------------------------------------------------------------
; LOGIC: A program to demonstrate logical bitwise operations.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib	
ExitProcess PROTO			

.DATA						
							

.CODE		
main PROC
XOR RCX, RCX		; Clear reg.
XOR RDX, RDX		; Clear reg.
MOV RCX, 0101b		; Assign imm 5d.
MOV RDX, 0011b		; Assign imm 3d.
XOR RCX, RDX		; eXclusive OR -> cl 6d.
AND RCX, RDX		; AND -> cl 2d.
OR  RCX, RDX		; OR -> cl 3d.
						
CALL ExitProcess			
main ENDP					
END							