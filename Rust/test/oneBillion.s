	.text
	.file	"oneBillion.e8b6f950d58c8dba-cgu.0"
	.section	.text._ZN3std2rt10lang_start17h8f2fc3ab6696d485E,"ax",@progbits
	.hidden	_ZN3std2rt10lang_start17h8f2fc3ab6696d485E
	.globl	_ZN3std2rt10lang_start17h8f2fc3ab6696d485E
	.p2align	4, 0x90
	.type	_ZN3std2rt10lang_start17h8f2fc3ab6696d485E,@function
_ZN3std2rt10lang_start17h8f2fc3ab6696d485E:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%ecx, %r8d
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movq	%rdi, (%rsp)
	leaq	.L__unnamed_1(%rip), %rsi
	movq	%rsp, %rdi
	callq	*_ZN3std2rt19lang_start_internal17h5329f7bb6557d2edE@GOTPCREL(%rip)
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	_ZN3std2rt10lang_start17h8f2fc3ab6696d485E, .Lfunc_end0-_ZN3std2rt10lang_start17h8f2fc3ab6696d485E
	.cfi_endproc

	.section	".text._ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h3ef32e508ef1db54E","ax",@progbits
	.p2align	4, 0x90
	.type	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h3ef32e508ef1db54E,@function
_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h3ef32e508ef1db54E:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	callq	_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hf23688900c1e8befE
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h3ef32e508ef1db54E, .Lfunc_end1-_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h3ef32e508ef1db54E
	.cfi_endproc

	.section	.text._ZN3std3sys9backtrace28__rust_begin_short_backtrace17hf23688900c1e8befE,"ax",@progbits
	.p2align	4, 0x90
	.type	_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hf23688900c1e8befE,@function
_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hf23688900c1e8befE:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	*%rdi
	#APP
	#NO_APP
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hf23688900c1e8befE, .Lfunc_end2-_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hf23688900c1e8befE
	.cfi_endproc

	.section	".text._ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h4e206f9b8d84e233E","ax",@progbits
	.p2align	4, 0x90
	.type	_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h4e206f9b8d84e233E,@function
_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h4e206f9b8d84e233E:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rdi
	callq	_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hf23688900c1e8befE
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h4e206f9b8d84e233E, .Lfunc_end3-_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h4e206f9b8d84e233E
	.cfi_endproc

	.section	.text._ZN10oneBillion4main17h471922d29c242b3fE,"ax",@progbits
	.p2align	4, 0x90
	.type	_ZN10oneBillion4main17h471922d29c242b3fE,@function
_ZN10oneBillion4main17h471922d29c242b3fE:
	.cfi_startproc
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movq	$1000000000, (%rsp)
	movq	%rsp, %rax
	movq	%rax, 8(%rsp)
	movq	_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h65c6bfd8ea719576E@GOTPCREL(%rip), %rax
	movq	%rax, 16(%rsp)
	leaq	.L__unnamed_2(%rip), %rax
	movq	%rax, 24(%rsp)
	movq	$2, 32(%rsp)
	movq	$0, 56(%rsp)
	leaq	8(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	$1, 48(%rsp)
	leaq	24(%rsp), %rdi
	callq	*_ZN3std2io5stdio6_print17h10324956ce9bdc19E@GOTPCREL(%rip)
	addq	$72, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	_ZN10oneBillion4main17h471922d29c242b3fE, .Lfunc_end4-_ZN10oneBillion4main17h471922d29c242b3fE
	.cfi_endproc

	.section	.text.main,"ax",@progbits
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, %rcx
	movslq	%edi, %rdx
	leaq	_ZN10oneBillion4main17h471922d29c242b3fE(%rip), %rax
	movq	%rax, (%rsp)
	leaq	.L__unnamed_1(%rip), %rsi
	movq	%rsp, %rdi
	xorl	%r8d, %r8d
	callq	*_ZN3std2rt19lang_start_internal17h5329f7bb6557d2edE@GOTPCREL(%rip)
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc

	.type	.L__unnamed_1,@object
	.section	.data.rel.ro..L__unnamed_1,"aw",@progbits
	.p2align	3, 0x0
.L__unnamed_1:
	.asciz	"\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.quad	_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h4e206f9b8d84e233E
	.quad	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h3ef32e508ef1db54E
	.quad	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h3ef32e508ef1db54E
	.size	.L__unnamed_1, 48

	.type	.L__unnamed_3,@object
	.section	.rodata..L__unnamed_3,"a",@progbits
.L__unnamed_3:
	.byte	10
	.size	.L__unnamed_3, 1

	.type	.L__unnamed_2,@object
	.section	.data.rel.ro..L__unnamed_2,"aw",@progbits
	.p2align	3, 0x0
.L__unnamed_2:
	.quad	1
	.zero	8
	.quad	.L__unnamed_3
	.asciz	"\001\000\000\000\000\000\000"
	.size	.L__unnamed_2, 32

	.ident	"rustc version 1.83.0-nightly (f79a912d9 2024-09-18)"
	.section	".note.GNU-stack","",@progbits
