; Name:       Shane Vance
; Instructor: Donald Davendra
; Course:     Computer Architecture I (CS-311)
; Date:       November 10, 2016
    segment .data
p1  dq      3, 2        ; this saves x1 and y1 into the label p1
p2  dq      5, 6        ; this saves x2 and y2 into the label p2
    segment .text
    global  main    
main:
    mov rax, [p2]       ; moves x2 into RAX register
    sub rax, [p1]       ; subtracts x2 from x1 and stores it back into the RAX register
    imul rax, rax       ; this multiplies RAX to itself to get the value stored there squared
    mov rbx, [p2 + 8]   ; moves y2 into RBX register
    sub rbx, [p1 + 8]   ; subtracts y2 from y1 and stores it back into the RBX register
    imul rbx, rbx       ; this multiplies RBX to itself to get the value stored there squared 
    add rax, rbx        ; this adds RAX and RBX together and stores the result into the RAX register
    xor rdx, rdx        ; this zeroes out the RDX register
    ret                 ; returns the value
