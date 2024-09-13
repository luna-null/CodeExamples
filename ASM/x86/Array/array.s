
data_items: 	#These are the data items
	.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text
.globl _start

_start:
    leal data_items, %esi            # Load the address of the array into ESI
    xorl %eax, %eax             # Clear the EAX register (to store the sum)

sum_loop:
    movl (%esi), %eax            # Add the byte at ESI (data_items element) to AL
    incl %esi                   # Increment ESI to point to the next byte
    cmp $0, (%esi)
    jne sum_loop              # Decrement ECX and loop if ECX != 0

    # EAX now contains the sum of the data_items elements

    # Exit the program using a Linux syscall
    movl %eax, %ebx
    movl $1, %eax               # syscall: exit
    int $0x80                   # make syscall

