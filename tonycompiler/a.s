	.text
	.file	"GiannSpider42"
	.globl	first                   # -- Begin function first
	.p2align	4, 0x90
	.type	first,@function
first:                                  # @first
	.cfi_startproc
# %bb.0:                                # %first_entry
	movq	$0, -8(%rsp)
	retq
.Lfunc_end0:
	.size	first, .Lfunc_end0-first
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %func_entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	callq	GC_init
	movl	$128, %edi
	callq	GC_malloc
	movq	%rax, 24(%rsp)
	movq	$53, 8(%rsp)
	movq	$0, 16(%rsp)
	movabsq	$-6757718126012409997, %r8 # imm = 0xA237C32B16CFD773
	cmpq	$15, 16(%rsp)
	jg	.LBB1_3
	.p2align	4, 0x90
.LBB1_2:                                # %body
                                        # =>This Inner Loop Header: Depth=1
	imulq	$137, 8(%rsp), %rdi
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rsi
	leaq	220(%rdi,%rbx), %rcx
	addq	%rbx, %rdi
	movq	%rcx, %rax
	imulq	%r8
	leaq	220(%rdx,%rdi), %rax
	movq	%rax, %rdx
	shrq	$63, %rdx
	sarq	$6, %rax
	addq	%rdx, %rax
	imulq	$101, %rax, %rax
	subq	%rax, %rcx
	movq	%rcx, 8(%rsp)
	movq	%rcx, (%rsi,%rbx,8)
	incq	16(%rsp)
	cmpq	$15, 16(%rsp)
	jle	.LBB1_2
.LBB1_3:                                # %endfor
	movq	24(%rsp), %rcx
	movq	%rsp, %rbx
	movl	$.Lstrtmp, %esi
	movl	$16, %edx
	movq	%rbx, %rdi
	callq	writeArray
	movq	24(%rsp), %rdx
	movl	$16, %esi
	movq	%rbx, %rdi
	callq	bsort
	movq	24(%rsp), %rcx
	movl	$.Lstrtmp.3, %esi
	movl	$16, %edx
	movq	%rbx, %rdi
	callq	writeArray
	addq	$32, %rsp
	popq	%rbx
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.globl	writeArray              # -- Begin function writeArray
	.p2align	4, 0x90
	.type	writeArray,@function
writeArray:                             # @writeArray
	.cfi_startproc
# %bb.0:                                # %func_entry
	subq	$88, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdi, 48(%rsp)
	movq	%rsi, 56(%rsp)
	movq	%rdx, 64(%rsp)
	movq	%rcx, 72(%rsp)
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdx, 24(%rsp)
	movq	%rcx, 32(%rsp)
	movq	%rsi, %rdi
	callq	puts
	movq	$0, 40(%rsp)
	jmp	.LBB2_1
	.p2align	4, 0x90
.LBB2_4:                                # %endif
                                        #   in Loop: Header=BB2_1 Depth=1
	movq	32(%rsp), %rax
	movq	40(%rsp), %rcx
	movq	(%rax,%rcx,8), %rdi
	callq	puti
	incq	40(%rsp)
.LBB2_1:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movq	40(%rsp), %rax
	cmpq	24(%rsp), %rax
	jge	.LBB2_5
# %bb.2:                                # %body
                                        #   in Loop: Header=BB2_1 Depth=1
	cmpq	$0, 40(%rsp)
	jle	.LBB2_4
# %bb.3:                                # %then
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	$.Lstrtmp.1, %edi
	callq	puts
	jmp	.LBB2_4
.LBB2_5:                                # %endfor
	movl	$.Lstrtmp.2, %edi
	callq	puts
	addq	$88, %rsp
	retq
.Lfunc_end2:
	.size	writeArray, .Lfunc_end2-writeArray
	.cfi_endproc
                                        # -- End function
	.globl	bsort                   # -- Begin function bsort
	.p2align	4, 0x90
	.type	bsort,@function
bsort:                                  # @bsort
	.cfi_startproc
# %bb.0:                                # %func_entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -16
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdx, 24(%rsp)
	movb	$1, 40(%rsp)
	leaq	8(%rsp), %rbx
	.p2align	4, 0x90
.LBB3_1:                                # %loop
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	cmpb	$1, 40(%rsp)
	jne	.LBB3_7
# %bb.2:                                # %body
                                        #   in Loop: Header=BB3_1 Depth=1
	movb	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	jmp	.LBB3_3
	.p2align	4, 0x90
.LBB3_6:                                # %endif
                                        #   in Loop: Header=BB3_3 Depth=2
	incq	32(%rsp)
.LBB3_3:                                # %loop7
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	16(%rsp), %rax
	decq	%rax
	cmpq	%rax, 32(%rsp)
	jge	.LBB3_1
# %bb.4:                                # %body8
                                        #   in Loop: Header=BB3_3 Depth=2
	movq	24(%rsp), %rax
	movq	32(%rsp), %rcx
	movq	(%rax,%rcx,8), %rdx
	cmpq	8(%rax,%rcx,8), %rdx
	jle	.LBB3_6
# %bb.5:                                # %then
                                        #   in Loop: Header=BB3_3 Depth=2
	movq	24(%rsp), %rax
	movq	32(%rsp), %rcx
	leaq	(%rax,%rcx,8), %rsi
	leaq	8(%rax,%rcx,8), %rdx
	movq	%rbx, %rdi
	callq	swap
	movb	$1, 40(%rsp)
	jmp	.LBB3_6
.LBB3_7:                                # %endfor
	addq	$48, %rsp
	popq	%rbx
	retq
.Lfunc_end3:
	.size	bsort, .Lfunc_end3-bsort
	.cfi_endproc
                                        # -- End function
	.globl	swap                    # -- Begin function swap
	.p2align	4, 0x90
	.type	swap,@function
swap:                                   # @swap
	.cfi_startproc
# %bb.0:                                # %func_entry
	movq	%rdi, -32(%rsp)
	movq	%rsi, -24(%rsp)
	movq	%rdx, -16(%rsp)
	movq	(%rsi), %rax
	movq	%rax, -8(%rsp)
	movq	(%rdx), %rax
	movq	%rax, (%rsi)
	movq	-16(%rsp), %rax
	movq	-8(%rsp), %rcx
	movq	%rcx, (%rax)
	retq
.Lfunc_end4:
	.size	swap, .Lfunc_end4-swap
	.cfi_endproc
                                        # -- End function
	.type	.Lstrtmp,@object        # @strtmp
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstrtmp:
	.asciz	"Initial array: "
	.size	.Lstrtmp, 16

	.type	.Lstrtmp.1,@object      # @strtmp.1
.Lstrtmp.1:
	.asciz	", "
	.size	.Lstrtmp.1, 3

	.type	.Lstrtmp.2,@object      # @strtmp.2
.Lstrtmp.2:
	.asciz	"\n"
	.size	.Lstrtmp.2, 2

	.type	.Lstrtmp.3,@object      # @strtmp.3
.Lstrtmp.3:
	.asciz	"Sorted array: "
	.size	.Lstrtmp.3, 15

	.type	.Lstrtmp.4,@object      # @strtmp.4
.Lstrtmp.4:
	.asciz	", "
	.size	.Lstrtmp.4, 3

	.type	.Lstrtmp.5,@object      # @strtmp.5
.Lstrtmp.5:
	.asciz	"\n"
	.size	.Lstrtmp.5, 2


	.section	".note.GNU-stack","",@progbits
