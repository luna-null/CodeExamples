.section .data

.section .text

	.globl _start
	.globl square

_start:
	pushl $8	# first arg
	call square	# first call
	addl $4, %esp	# wipe function data from stack
	pushl %eax	# push return value in %eax onto stack
	pushl $4	# first arg
	call square	# second call
	addl $4, %esp	# wipe function
	pop %ebx	# pop first call's return value into 
			# %ebx
	subl %eax, %ebx	# subtract second call's return value
			# from first call's, and put result in
			# %ebx
	movl $1, %eax	# end program call in %eax
	int $0x80

	.type square, @function
square:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %eax
	imull %eax, %eax
	movl %ebp, %esp
	popl %ebp
	ret
