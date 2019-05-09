; Name:       Shane Vance
; Instructor: Donald Davendra
; Course:     Computer Architecture I (CS-311)
; Date:       November 10, 2016
    segment .data
a   dq      0xaaaaaaaaaaaaaaaa  ; this has 32 ones
    segment .text
    global  main
main:
    mov rax, qword [a]          ; sets RAX to 0xaaaaaaaaaaaaaaaa
    xor ebx, ebx                ; zeroes out EBX
    xor ecx, ecx                ; zeroes out ECX
    xor edx, edx                ; zeroes out EDX
while:
    cmp rcx, 64                 ; this is a compare operand to see if RCX is equal to 64
    jnl end                     ; if it is it jumps to the end label
    bt rax, 0                   ; this sets the byte to zero
    setc bl                     ; this is a conditional set of the flags
    add edx, ebx                ; adds EBX to EDX
    shr rax, 1                  ; shifts RAX right one
    inc rcx                     ; increments RCX by one
    jmp while                   ; jumps to the top of the while loop
end:
    xor eax, eax                ; zeroes out EAX
    ret                         ; returns the value
