# PURPOSE: This program finds the maximum number of a
# set of data items.
#
# VARIABLES: The registers have the following uses:
#
# %edi - Holds the index of the data item being examined
# %ebx - Largest data item found
# %eax - Current data item
#
# The following memory locations are used:
#
# data_items - contains the item data. A 0 is used
# to terminate the data
#
.section .data
data_items: 	#These are the data items
	.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0
length: .long 14

.section .text
.globl _start
.globl maximum

_start:
	movl $length, %edx
	subl (,%edx,4), %esp
	push data_items
	call maximum
	addl $4, %esp
	movl $1, %eax 	#1 is the exit() syscall
	int $0x80

maximum:
	pushl %ebp
	movl %esp, %ebp
	movl $length, %edx
	movl (%ebp,%edx,4), %esi
	movl $0, %edi 	# move 0 into the index register
	movl (%esi,%edi,4), %eax 
			# load the first byte of data
	movl %eax, %ebx # since this is the first item, %eax is
			# the biggest
maximum_loop:		# start loop
	cmpl $0, %eax 	# check to see if we’ve hit the end
	je loop_exit
	incl %edi	# load next value
	movl (%esi,%edi,4), %eax
	cmpl %ebx, %eax		
				# compare values
	jle maximum_loop 	# jump to loop beginning if the
				# new one isn’t bigger
	movl %eax, %ebx	# move the value as the largest
	jmp maximum_loop 	# jump to loop beginning
loop_exit:
			# %ebx is the status code for the exit system call
			# and it already has the maximum number
	movl %ebp, %esp
	popl %ebp
	ret
