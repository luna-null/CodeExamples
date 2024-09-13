	section .text
	global _start
_start:
	push 4
	call factorial
	mov rdi, rax
	mov rax, 60
	syscall

factorial:
	push rbp
	mov rbp, rsp
	mov rax, [rbp + 16]
	mov rbx, 1

factorial_loop:
	cmp rax, 1
	je end_factorial
	imul rbx, rax
	dec rax
	jmp factorial_loop

end_factorial:
	mov rax, rbx
	mov rsp, rbp
	pop rbp
	ret
