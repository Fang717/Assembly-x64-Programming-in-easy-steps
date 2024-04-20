;--------------------------------------------------------------------
; SPECS: A program to demonstrate special instructions.
;--------------------------------------------------------------------

section .data
    align 16
    nums1 dd 44.5, 58.25, 32.6, 19.8
    nums2 dd 22.7, 73.2, 66.15, 12.3

section .text
    global _start

_start:
    ; Load nums1 into xmm1
    movdqa xmm1, [rel nums1]

    ; Load nums2 into xmm2
    movdqa xmm2, [rel nums2]

    ; Maximum of each pair of element values
    maxps xmm1, xmm2

    ; Minimum of each pair of element values
    movdqa xmm1, [rel nums1]
    minps xmm1, xmm2

    ; Round floats to integers
    roundps xmm1, xmm1, 0  ; Round towards nearest
    roundps xmm2, xmm2, 0  ; Round towards nearest

    ; Average of each pair of element values
    pavgw xmm1, xmm2

    ; Exit the program
    mov eax, 60  ; sys_exit system call number
    xor edi, edi ; exit status 0
    syscall