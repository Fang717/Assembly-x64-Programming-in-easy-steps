;--------------------------------------------------------------------
; ALIGN: A program to demonstrate alignment to 16-byte boundaries.
;--------------------------------------------------------------------
;   This code demonstrates alignment to 16-byte boundaries in assembly language.
;   The purpose of this code is to show how data alignment works and what happens when data is not properly aligned.
;   It declares two blocks of data - nums0 and nums1. Each contains 4 doublewords (4-byte values) for a total of 16 bytes each.
;   This keeps them aligned to a 16-byte boundary which is required for using SIMD instructions like movdqa that need aligned data.
;   The snag variable in between throws off the alignment since it takes up 1 extra byte.
;   This is what causes the issue. When the code tries to use movdqa to load the nums1 data into a register,
;   it will fail since nums1 is no longer aligned to a 16-byte boundary due to snag being in between.
;   To fix this, the align 16 directive can be uncommented which will pad the data after snag to realign nums1 back to a 16-byte boundary.
;   The key steps are:

;   1. Declare aligned 16-byte data block nums0
;   2. Declare 1-byte snag data which throws off alignment
;   3. Declare nums1 data block which is now unaligned due to snag
;   4. Try to load unaligned nums1 using movdqa, which will fail
;   5. Can fix by uncommenting align 16 to pad and realign nums1


section .data
nums0: dd 1,2,3,4			; 4 * 4-byte = 16-bytes... in alignment.  
snag: db 100				; + 1-byte = 17-bytes... out of alignment.
;align 16					; <- Uncomment this directive for correct alignment.
nums1: dd 5,5,5,5

section .text
global _start

_start:

    movdqa xmm0, [nums0]
    movdqa xmm1, [nums1] 
    psubd xmm0, xmm1
    
    
    
    mov eax,1            ; The system call for exit (sys_exit)
    mov ebx,0            ; Exit with return code of 0 (no error)
    int 0x80             ; call Kernel
    
    
    
