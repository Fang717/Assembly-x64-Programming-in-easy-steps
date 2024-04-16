;--------------------------------------------------------------------
; FLAGS: A program to demonstrate setting flags.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib	
ExitProcess PROTO		

.DATA			
			

.CODE				
main PROC			
XOR RCX, RCX
MOV CL, 255		; Maximum unsigned register limit.
ADD CL,1		; Exceed unsigned register limit.
DEC CL			; Return to unsigned maximum.
MOV CL, 127		; Assign positive signed register limit.
ADD CL, 1		; Assume negative signed register limit.
CALL ExitProcess			
main ENDP					
END							