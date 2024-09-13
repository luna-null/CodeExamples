	#PURPOSE: This program finds the maximum number of a set of data items.
	#

	#VARIABLES:  The registers have the following uses:
	#
	# %edi - Holds the index of the data item being examined
	# %ebx - Largest data item found
	# %eax - Current data item
	#
	# The following memory locations are used:
	#
	# data_items - contains the item data. A 0 is used to terminate the data.
	#

	.section .data

data_items:	# These are the data items
	.long 3,67,34,222,45,75,54,34,44,33,22,11,66	# 0, 255

	.section .text
	
	.globl _start
_start:
	movl $0, %edi			# IMMEDIATE MODE: move 0 into the index register
	movl data_items(,%edi,4), %eax	# INDEXED ADDRESSING MODE: load the first byte of data
	movl %eax, %ebx			# INDIRECT ADDRESSING MODE: since this is the first item, %eax is the biggest

start_loop:				# start loop
	# check to see if we've hit the end (with a 255 instead of a 0)
	# cmpl $0, %eax			# ORIGINAL
	# cmpl $255, %eax		# For USING 255 INSTEAD OF 0
	# cmpl [data_items + 12], %eax	# For ENDING ADDRESS
	cmpl $12, %edi			# For USING LENGTH COUNTER
	je loop_exit			
	incl %edi			# BASE POINTER ADDRESSING MODE (?): load next value
	movl data_items(,%edi,4), %eax	# INDEXED ADDRESSING MODE: (each number is 4 bits)
	cmpl %ebx, %eax			# compare values
	# jge start_loop		# For MINIMUM
	jle start_loop			# jump to loop beginning if the new one isn't bigger
	movl %eax, %ebx			# INDIRECT ADDRESSING MODE: move the value as the largest
	jmp start_loop			# jump to loop beginning

loop_exit:
	# %ebx is the status code for the exit system call and it already has the maximum value
	movl $1, %eax			# IMMEDIATE MODE: 1 is the exit() syscall [in x86 assembly]
	# int $0x80
