;--------------------------------------------------------------------
; MRPT: A program to demonstrate loops.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib
ExitProcess PROTO

rpt MACRO reg, num
	REPEAT num		; Increment reg, num number of times.
	INC reg
	ENDM
ENDM

itr MACRO reg, num
LOCAL count
count = num
	WHILE count LE 100		; Set limit.
	count = count + 27		; Increment counter by 27.
	MOV reg, count
		IF count MOD 2 EQ 0	; Exit if counter is even number.
		EXITM
		ENDIF
	ENDM
ENDM

.DATA


.CODE
main PROC
MOV RAX, 10
MOV RCX, RAX
rpt RAX, 10		; Pass 2 args.
itr RCX, 10		; Pass 2 args.
CALL ExitProcess
main ENDP

END