;--------------------------------------------------------------------
; TEST: A program to demonstrate testing bits.
;--------------------------------------------------------------------


section .text
    global _start

_start:

XOR RCX, RCX        ; Clear RCX register
MOV  RCX, 0111b     ; Move binary value 0111b into RCX (RCX = 7)
TEST RCX, 0001b     ; Test if the least significant bit of RCX is set
                    ;   (This checks if the number is odd)
MOV  RCX, 1000b     ; Move binary value 1000b into RCX (RCX = 8)
TEST RCX, 0001b     ; Test if the least significant bit of RCX is set
                    ;   (This checks if the number is odd)
MOV  RCX, 0111b     ; Move binary value 0111b into RCX (RCX = 7)
TEST RCX, 0100b     ; Test if the fourth bit of RCX is set
                    ;   (This checks if the number is divisible by 4)
TEST RCX, 0100b     ; Test if the fourth bit of RCX is set (again)
                    ;   (This checks if the number is divisible by 4)
; Exit the program
    mov eax, 60     ; syscall number for exit
    xor edi, edi    ; exit code 0
    syscall         ; invoke syscall


