; -----------------------------------------------------------------------------
; A 64-bit function that returns if a given yeear is a leap year.
; The function has signature:
;
;   int leap_year(int year)
;
; The parameter year is passed in edi
; The return value must be put in eax.
; -----------------------------------------------------------------------------

section .text
global leap_year
leap_year:
    mov r8d, edi ; dividend (year passed as parameter)
    mov r9d, 4   ; divisor

    call is_divisible
    
    jnz is_not_leap
    
    mov r8d, edi ; dividend (year passed as parameter)
    mov r9d, 100 ; divisor
    
    call is_divisible
    
    jnz is_leap

    mov r8d, edi ; dividend (year passed as parameter)
    mov r9d, 400 ; divisor
    
    call is_divisible

    jz is_leap
    jmp is_not_leap

is_divisible:    ; check if value in r8d is divisible by value in r9d
    mov eax, r8d ; dividend (year passed as parameter)
    mov edx, 0   ; dividend high half (not used in this scenario as int size is 32bits) 

    mov ebx, r9d ; divisor

    div ebx      ; execute division, result: edx - remainder, eax - quotient

    cmp edx, 0
    ret

is_not_leap:
    mov eax, 0
    ret

is_leap:
    mov eax, 1
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
