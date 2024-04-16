;----------------------------------------------------------
; ROTATE: A program to demonstrate bit rotation.
;----------------------------------------------------------

INCLUDELIB kernel32.lib		
ExitProcess PROTO			

.DATA						
							

.CODE						
main PROC			
XOR RCX, RCX
MOV CL, 65		; Assign ASCII A.
MOV CH, 90		; Assign ASCII Z.
ROL CX, 8		; Rotate CL, CH.
ROL CX, 8		; Rotate CL, CH.
SHR CX, 8		; Shift out CL.
CALL ExitProcess			
main ENDP					
END							