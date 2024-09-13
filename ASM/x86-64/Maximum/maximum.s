
	section .data
data_items: dq 3, 67, 34, 222, 45, 75, 54, 34, 44, 33, 22, 11, 0
	section .text
	global _start

_start:
	mov rdi, 0
	mov rax, [data_items + rdi * 8]
	mov rbx, rax

start_loop:
	cmp rax, 0	; Note that cmp doesn't work if the
			; constant comes first. 'cmp 0, rax'
			; will throw an error
	je loop_exit
	inc rdi
	mov rax, [data_items + rdi * 8]
	
	cmp rax, rbx	; These two lines represent the
	jle start_loop	; conditional rax <= rbx. In GAS,
			; it would represent rbx <= rax.
			; NASM order is more intuitive for
			; once.
	mov rbx, rax
	jmp start_loop

loop_exit:
	mov rax, 60
	mov rdi, rbx
	syscall

