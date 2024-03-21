;--------------------------------------------------------------------
; MASM: A barebones template for Assembly programming.
;--------------------------------------------------------------------

INCLUDELIB kernel32.lib	; Import a standard Windows library.
ExitProcess PROTO			; Define an imported function.

.DATA								; Start of the data section.
										; <- Variable declarations go here.

.CODE								; Start of the code section.
main PROC						; Program entry procedure.
										; <- Assembly instructions go here.
CALL ExitProcess				; Execute the imported library function.
main ENDP						; End of the main procedure.
END									; End of the program.