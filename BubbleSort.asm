; Name:       Shane D. Vance
; Instructor: Dr. Donald Davendra
; Course:     Computer Architecture I (CS-311)
; Date:       Nombember 18, 2016
            segment .data
a           dd      2,4,1,5,7,8,3,6 ; BubbleSort will result a={1,2,3,4,5,6,7,8}
            segment .text
            global  main
main:
            xor eax, eax            ; resets EAX
            xor ebx, ebx            ; resets EBX    
do_while:       
            xor ecx, ecx            ; resets ECX
            xor edx, edx            ; resets EDX
for:                                ; for(i = 0; i < n-1; i++) {        
            mov eax, [a+4*ecx]      ; puts a[i] in EAX
            mov ebx, [a+4*ecx+4]    ; puts a[i + 1] in EBX
            cmp eax, ebx            ; checks to see if EAX > EBX
            jg if                   ; if (a[i] > a[i + 1])
            inc edx        
            cmp edx, 7
            je end                  ; jumps to end if EDX is a.length - 1
            inc ecx
            cmp ecx, 7                 
            je do_while             ; jumps to do_while if ECX >= a.length - 1                    
            jmp for                            
if:                                 ; if (a[i] > a[i + 1])
            mov [a+4*ecx], ebx
            mov [a+4*ecx+4], eax    ; a[i + 1] = a[i]
            inc ecx
            cmp ecx, 7
            je do_while             ; jumps to do_while if ECX >= a.length - 1  
            jmp for   
end:
            xor eax, eax            ; resets EAX
            xor ebx, ebx            ; resets EBX
            xor ecx, ecx            ; resets ECX
            xor edx, edx            ; resets EDX
            ret                     ; return
