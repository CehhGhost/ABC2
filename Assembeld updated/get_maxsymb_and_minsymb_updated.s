	.file	"get_maxsymb_and_minsymb.c"
	.intel_syntax noprefix
	.text
	.globl	get_maxsymb_and_minsymb
	.type	get_maxsymb_and_minsymb, @function
get_maxsymb_and_minsymb:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi		# line (= -24)
	mov	DWORD PTR -28[rbp], esi		# size (= -28)
	mov	QWORD PTR -40[rbp], rdx		# *min (= -40)
	mov	QWORD PTR -48[rbp], rcx		# *max (= -48)
	mov	rax, QWORD PTR -24[rbp]
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	BYTE PTR [rax], dl
	mov	rax, QWORD PTR -24[rbp]
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -48[rbp]
	mov	BYTE PTR [rax], dl
	mov	r11d, 1				# r11d = i = 1 в цикле for()
	jmp	.L2
.L5:	# цикл for()
	mov	eax, r11d			# eax = i
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -5[rbp], al
	mov	rax, QWORD PTR -48[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	BYTE PTR -5[rbp], al		# if (symb > *max)
	jle	.L3
	mov	rax, QWORD PTR -48[rbp]
	movzx	edx, BYTE PTR -5[rbp]
	mov	BYTE PTR [rax], dl		# *max = symb
.L3:
	mov	rax, QWORD PTR -40[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	BYTE PTR -5[rbp], al		# if (symb < *min)
	jge	.L4
	mov	rax, QWORD PTR -40[rbp]
	movzx	edx, BYTE PTR -5[rbp]
	mov	BYTE PTR [rax], dl		# *min = symb
.L4:
	add	r11d, 1				# ++i
.L2:
	mov	eax, r11d			# eax = i
	cmp	eax, DWORD PTR -28[rbp]		# i < size
	jl	.L5
	nop
	nop
	pop	rbp
	ret
	.size	get_maxsymb_and_minsymb, .-get_maxsymb_and_minsymb
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
