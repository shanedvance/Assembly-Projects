; Name:       Shane Vance
; Instructor: Donald Davendra
; Course:     Computer Architecture I (CS-311)
; Date:       November 10, 2016
        segment .data
p1      dq      2, 15           ; puts x1 and y1 into an array
p2      dq      8, 16           ; puts x2 and y2 into an array
xDiff   dq      0               ; sets xDiff to zero
yDiff   dq      0               ; sets yDiff to zero
        segment .text
        global main
main:
        mov rax, qword [p2]     ; moves x2 into RAX
        sub rax, qword [p1]     ; subtracts x1 from x2 and stores it into RAX
        mov [xDiff], rax        ; moves RAX to xDiff
        xor rax, rax            ; zeroes out RAX
        mov rax, qword [p2 + 8] ; moves y2 into RAX
        sub rax, qword [p1 + 8] ; subtracts y1 from y2 and stores it into RAX
        mov [yDiff], rax        ; moves RAX to yDiff
        mov rbx, 1              ; moves 1 into RBX
        cmove rax, rbx          ; checks to see if RAX is equal to zero if it is it moves RBX into RAX
        mov rbx, 0              ; moves 0 into RBX;
        cmovg rax, rbx          ; checks to see if RAX is greater than zero if it is it moves RBX into RAX
        cmovl rax, rbx          ; checks to see if RAX is less than zero if it is it moves RBX into RAX
        xor rbx, rbx            ; zeroes out the RBX register
        xor rcx, rcx            ; zeroes out the RCX register
        xor rdx, rdx            ; zeroes out the RDX register
        ret                     ; returns the value
