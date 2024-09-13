.text
	.globl _start
_start:
	pushl $4, %eax
	pushl $1, %ebx
	pushl $1, %ecx
	pushl $1, %edx
	int $0x80
