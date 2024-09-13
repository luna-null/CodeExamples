;PURPOSE: 	Program to illustrate how functions work
; 		This program will compute the value of
; 		2^3 + 5^2

; Everything in the main program is stored in registers,
; so the data section doesn't have anything.
section .text
global _start
_start:
	push 3		; push second arg
	push 2		; push first arg
	call power	; call the function
	add rsp, 16	; move the stack pointer back
	push rax	; save the first answer before
			; calling the next function

	push 2	; push second arg
	push 5	; push first arg
	call power	; call the function
	add rsp, 16	; move the stack pointer back

	pop rdi	; The second answer is already
			; in %eax. We saved the 
			; first answer onto the stack,
			; so now we can just pop it
			; out into %ebx

	add rdi, rax	; add them together
			; the result is in %ebx

	mov rax, 60	; exit (%ebx is returned)
	syscall

; PURPOSE:	This function is used to compute
; 		the value of a number raised to
; 		a power.
;
; INPUT:	First arg - the base number
;		Second arg - the power to raise it to
;
;
; OUTPUT:	Will give the result as a return value
;
; NOTES:	The power must be 1 or greater
;
; VARIABLES:
;		%ebx - holds the base number
;		%ecx - holds the power
;		-4(%ebp) - holds the current result
;
;		%eax is used for temporary storage
power:
	push rbp		; save old base pointer
	mov rbp, rsp		; make stack pointer the base pointer
	sub rsp, 8		; get room for our local storage

	mov rax, [rbp + 16] 	; put first arg in %eax
	mov rcx, [rbp + 24]	; put second arg in %ecx

	mov [rbp - 8], rax 	; store current result

power_loop_start:
	cmp rcx, 1		; if the power is 1, we are done
	je end_power
	mov rbx, [rbp - 8]	; move the current result into %eax
	imul rbx, rax	; multiply the current result by
				; the base number
	mov [rbp - 8], rbx	; store the current result

	dec rcx		; decrease the power
	jmp power_loop_start	; run for the next power

end_power:
	mov rax, [rbp - 8]	; return value goes in %eax
	mov rsp, rbp		; restore the stack pointer
	pop rbp		; restore the base pointer
	ret
