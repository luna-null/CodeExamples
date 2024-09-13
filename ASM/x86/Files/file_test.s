.section .data

#######CONSTANTS########
#system call numbers
.equ SYS_OPEN, 5
.equ SYS_WRITE, 4
.equ SYS_READ, 3
.equ SYS_CLOSE, 6
.equ SYS_EXIT, 1
#options for open (look at
#/usr/include/asm/fcntl.h for
#various values. You can combine them
#by adding them or ORing them)
#This is discussed at greater length
#in "Counting Like a Computer"
.equ O_RDONLY, 0
.equ O_CREAT_WRONLY_TRUNC, 03101
#standard file descriptors
.equ STDIN, 0
.equ STDOUT, 1
.equ STDERR, 2
#system call interrupt
.equ LINUX_SYSCALL, 0x80

.equ ST_SIZE_RESERVE, 8
.equ ST_FD_IN, -4
.equ ST_FD_OUT, -8
.equ ST_ARGC, 0 #Number of arguments
.equ ST_ARGV_0, 4 #Name of program
.equ ST_ARGV_1, 8 #Input file name
.equ ST_ARGV_2, 12 #Output file name

.globl _start
_start:
	movl %esp, %ebp
	subl $ST_SIZE_RESERVE, %esp

open_file:
open_fd_in:
	movl $SYS_OPEN, %eax
	movl ST_ARGV_1(%ebp), %ebx
	movl $O_RDONLY, %ecx
	movl $0666, %edx
	int $LINUX_SYSCALL

store_fd_in:
	# save file descriptor
	movl %eax, ST_FD_IN(%ebp)

close_file:
	movl $SYS_CLOSE, %eax
	int $LINUX_SYSCALL

_exit:
	movl ST_FD_IN(%ebp), %ebx
	movl $SYS_EXIT, %eax
	int $LINUX_SYSCALL
