;--------------------------------------------------------------------
; ARR2D: A program to demonstrate addressing of 2-dimensional arrays.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib		
ExitProcess PROTO			

.DATA						
rows BYTE 0,1,2,3,10,11,12,13,20,21,22,23	; Row-major order
cols BYTE 0,10,20,1,11,21,2,12,22,3,13,23	; Column-major order

arrA DWORD 0,1,2,3,10,11,12,13,20,21,22,23	; Row-major order
arrB DWORD 0,10,20,1,11,21,2,12,22,3,13,23	; Column-major order							

.CODE						
main PROC					
MOV CL, rows		; Address each 1st element at memory address.
MOV CH, cols
MOV R8D, arrA
MOV R9D, arrB

MOV CL, rows + 5	; Address by offset of 1 for bytes.
MOV CH, cols + 4

MOV R8D, arrA + (8 * 4)	; Address by offset of data size 4 for words.
MOV R9D, arrB + (2 * 4)							
CALL ExitProcess			
main ENDP					
END							
