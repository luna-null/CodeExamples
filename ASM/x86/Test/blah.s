.text
	.globl _start
_start:
	xorl %eax, %eax
	movl $49, %eax
	int  $0x80

	movl (%eax), %ecx
	movl $4, %eax
	movl $1, %ebx
	int  $0x80
	

