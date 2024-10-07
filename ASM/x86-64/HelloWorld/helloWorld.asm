section .data
hello1:
    db "#    #  ######  #        #        ######        #     #  ######  ####    #        ####   #", 0xA, 0
hello2:                                                                                   
    db "#    #  #       #        #        #    #        #  #  #  #    #  #  #    #        #   #  #", 0xA, 0
hello3:                                                                                   
    db "######  ######  #        #        #    #        #  #  #  #    #  ##      #        #   #  #", 0xA, 0
hello4:                                                                                   
    db "#    #  #       #        #        #    #        #  #  #  #    #  # #     #        #  #    ", 0xA, 0
hello5:                                                                                   
    db "#    #  ######  ######   ######   ######        #######  ######  #   #   ######   ###    #", 0xA, 0


section .text
global _start
_start:
    push hello1
    call print
    add esp, 4
    push hello2
    call print
    add esp, 4
    push hello3
    call print
    add esp, 4
    push hello4
    call print
    add esp, 4
    push hello5
    call print
    add esp, 4

    call exit







print:
    ; args:
    ; 1 - the string to print

    ; registers:
    ; eax - instruction for syscall
    ; ebx - file descriptor to write to
    ; ecx - contains address to string
    ; edx - length of string, determined with length function

    ; create new stack frame
    push ebp
    mov ebp, esp

    ; print
    mov ecx, [ebp+8]
    push ecx
    call length
    add esp, 4
    mov ecx, [ebp+8]
    mov edx, eax
    mov eax, 4      ; write(1, string, length(string))
    mov ebx, 1      ; file_descriptor of stdout
    int 0x80


    ; clean up and return
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret

length:
    ; args:
    ; 1 - the string to take the length of

    ; registers:
    ; edx - counter
    ; ecx - address for string to count

    ; create new stack frame
    push ebp
    mov ebp, esp

    xor edx, edx
    mov ecx, [ebp+8]

length_loop:
    inc edx
    cmp byte [ecx+edx], 0
    jne length_loop

length_done:
    mov eax, edx
    mov esp, ebp
    pop ebp
    ret
    
exit:
    ; registers
    ; eax - instruction for syscall
    mov eax, 1 ; exit(0)
    mov ebx, 0
    int  0x80
