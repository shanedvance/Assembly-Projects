; Name:       Shane Vance
; Instructor: Dr. Donald Davendra
; Course:     Computer Architecture I (CS-311)
; Date:       December 1, 2016
                segment .data
x               dq      0               ; the number for comparison
scanf_format    db  "%ld", 0
printf_format   db  "The number less than or equal to fib(%ld) is = %ld", 0x0a, 0

                segment .text
                global  main            ; let the linker know about main
                global  fibonacci       ; declaration of fibonacci function
                extern  scanf           ; resolve write and exit from libc
                extern  printf           
main:
                push    rbp
                mov     rbp, rsp
                lea     rcx, [scanf_format]
                lea     rdx, [x]
                xor     eax, eax
                call    scanf           ; gets user input
                call    fibonacci       ; go to the fibonacci method
                lea     rcx, [printf_format]  
                mov     rdx, [x]
                mov     r8, rbx         ; loads RBX into R8 for printing purposes
                xor     eax, eax        ; resets EAX
                call    printf          ; prints the stack
                xor     eax, eax
                leave                   ; leaves the code
                ret                     ; returns

fibonacci:
n               equ     8
                push    rbp
                mov     rbp, rsp
                sub     rsp, 16
                xor     rax, rax        ; sets RAX to 0
                mov     rbx, 1          ; sets RBX to 1
                mov     rdx, qword [x]  ; puts [X] into rdx for it to be restored later
                cmp     rdx, 3          ; compares if RDX > 3
                jg      if_1
                cmp     rdx, 3          ; compares if RDX is = 3
                je      equal3                        
                cmp     rdx, 3          ; compares if RDX is < 3
                jl      less3
                
equal3:
                mov     ebx, 2          ; moves 2 into EBX for printing
                leave                   ; leaves the code
                ret                     ; returns
less3: 
                mov     ebx, 1          ; moves 1 into EBX for printing
                leave                   ; leaves the code
                ret                     ;returns
if_1:        
                add     rax, rbx        ; add RAX to RBX
                mov     [rsp + n], rax  ; stores RAX in the stack
                jmp     compare         ; jumps to compare
                
swap:
                mov     rax, rbx        ; stores RBX in RAX
                mov     rbx, [rsp + n]  ; stores whats in the stack to RBX
                jmp     if_1
    
compare: 
                mov     rcx, rax        ; moves RAX to RCX
                mov     qword [x], rdx  ; moves original [X] back to its original state
                sub     qword [x], rcx  ; subtracts to get difference in numbers
                cmp     qword [x], 0    ; compares [X] >= 0
                jge     swap                         
end:
                mov     qword [x], rdx  ; moves original [X] back to its original state
                leave                   ; leaves the code
                ret                     ; returns
