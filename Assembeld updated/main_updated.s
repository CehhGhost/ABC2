	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"input.txt"
.LC2:
	.string	"w"
.LC3:
	.string	"output.txt"
.LC4:
	.string	"Minimum symb: %c\r\n"
.LC5:
	.string	"Maximum symb: %c\r\n"
	.align 8
.LC6:
	.string	"Set size of your line(>0 && <= %d)\r\n"
.LC7:
	.string	"%d"
.LC8:
	.string	"Size is out of range\r"
	.align 8
.LC9:
	.string	"Choose input: manual or random(0 = manual; other = random):\r"
.LC10:
	.string	"Line[%d] ="
.LC11:
	.string	"%s"
	.align 8
.LC12:
	.string	"Choose seed generation(>0 && <= 100):\r"
.LC13:
	.string	"Seed is out of range\r"
.LC14:
	.string	"Result Line: \r"
.LC15:
	.string	"Line[%d] = %c\r\n"
.LC16:
	.string	"\r"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 136
	mov	DWORD PTR -132[rbp], edi	# int argc (= -132)
	mov	QWORD PTR -144[rbp], rsi	# char *argv[] (= -144)
	mov	rbx, rsp
	cmp	DWORD PTR -132[rbp], 2		# сравнить argc с 2 (argc == 2)
	jne	.L2				# if (argc == 2) {...} else
	mov	rax, rsp
	mov	r12, rax
	mov	rax, QWORD PTR -144[rbp]	# rax = argv[0]
	add	rax, 8				# для чтения с командной строки сдвигаем на argv[0]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -108[rbp], eax	# int size = eax (= -108)
	mov	eax, DWORD PTR -108[rbp]	# eax = size
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -80[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -160[rbp], rdx
	mov	QWORD PTR -152[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -176[rbp], rdx
	mov	QWORD PTR -168[rbp], 0
	cdqe
	mov	edx, 16
	sub	rdx, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rcx, rsp
	sub	rcx, rdx
	mov	rdx, rcx
.L3:
	cmp	rsp, rdx
	je	.L4
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L3
.L4:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L5
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L5:
	mov	rax, rsp
	add	rax, 0
	mov	QWORD PTR -88[rbp], rax		# int line[] (= -88)
	lea	rsi, .LC0[rip]			# ссылка на 'r'
	lea	rdi, .LC1[rip]			# ссылка на 'input.txt'
	call	fopen@PLT
	mov	QWORD PTR -96[rbp], rax		# FILE *input (= -96)
	mov	eax, DWORD PTR -108[rbp]	# eax = size для передачи в fgets(line, size + 1, input)
	lea	ecx, 1[rax]			# eax + 1
	mov	rdx, QWORD PTR -96[rbp]		# rdx = input для fgets(line, size + 1, input)
	mov	rax, QWORD PTR -88[rbp]		# rax = line для передачи в fgets(line, size + 1, input)
	mov	esi, ecx
	mov	rdi, rax
	call	fgets@PLT
	mov	rax, QWORD PTR -96[rbp]
	mov	rdi, rax
	call	fclose@PLT
	lea	rsi, .LC2[rip]			# ссылка на 'w'
	lea	rdi, .LC3[rip]			# cсылка на 'output.txt'
	call	fopen@PLT
	mov	QWORD PTR -104[rbp], rax	# FILE *output (= -104)
	mov	esi, DWORD PTR -108[rbp]	# esi = size для передачи в get_maxsymb_and_minsymb(line, size, &min, &max)
	lea	rcx, -118[rbp]			# rcx = &max для передачи в get_maxsymb_and_minsymb(line, size, &min, &max)
	lea	rdx, -117[rbp]			# rdx = &min для передачи в get_maxsymb_and_minsymb(line, size, &min, &max)		
	mov	rdi, QWORD PTR -88[rbp]		# rdi = line для передачи в get_maxsymb_and_minsymb(line, size, &min, &max)
	call	get_maxsymb_and_minsymb@PLT
	movzx	eax, BYTE PTR -117[rbp]		# min для передачи в fprintf(output, "Minimum symb: %c\r\n", min)
	movsx	edx, al
	mov	rax, QWORD PTR -104[rbp]	# rax = output для передачи в fprintf(output, "Minimum symb: %c\r\n", min)
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	movzx	eax, BYTE PTR -118[rbp]		# max для передачи в fprintf(output, "Maximum symb: %c\r\n", max)
	movsx	edx, al
	mov	rax, QWORD PTR -104[rbp]	# rax = output для передачи в fprintf(output, "Maximum symb: %c\r\n", max)
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rdi, QWORD PTR -104[rbp]
	call	fclose@PLT
	mov	eax, 0
	mov	rsp, r12
	jmp	.L6
.L2:
	mov	esi, 100
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT			# printf("Set size of your line(>0 && <= %d)\r\n", 100)
	lea	rax, -108[rbp]			# rax = &size для передачи в scanf("%d", &size);
	mov	rsi, rax
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -108[rbp]
	test	eax, eax
	jle	.L7
	mov	eax, DWORD PTR -108[rbp]
	cmp	eax, 100
	jle	.L8
.L7:
	lea	rdi, .LC8[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L6
.L8:
	mov	eax, DWORD PTR -108[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -64[rbp], rdx
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	movsx	rdx, eax
	mov	r12, rdx
	mov	r13d, 0
	cdqe
	mov	edx, 16
	sub	rdx, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rcx, rsp
	sub	rcx, rdx
	mov	rdx, rcx
.L9:
	cmp	rsp, rdx
	je	.L10
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L9
.L10:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L11
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L11:
	mov	rax, rsp
	add	rax, 0
	mov	QWORD PTR -72[rbp], rax
	lea	rdi, .LC9[rip]
	call	puts@PLT
	lea	rax, -112[rbp]
	mov	rsi, rax
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -112[rbp]
	test	eax, eax
	jne	.L12
	mov	edi, 10
	call	putchar@PLT
	mov	r14d, 0				# r14d = i в for {printf(); scanf();}
	jmp	.L13
.L14:	# цикл for {printf(); scanf();}
	mov	esi, r14d			# esi = i
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, r14d			# eax = i
	movsx	rdx, eax
	mov	rax, QWORD PTR -72[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	r14d, 1				# ++i
.L13:
	mov	eax, DWORD PTR -108[rbp]	# eax = size
	cmp	r14d, eax			# i < eax
	jl	.L14
	mov	esi, DWORD PTR -108[rbp]	# esi = size для передачи в get_maxsymb_and_minsymb(line, size, &min, &max)
	lea	rcx, -118[rbp]			# rcx = &max для передачи в get_maxsymb_and_minsymb(line, size, &min, &max)
	lea	rdx, -117[rbp]			# rdx = &min для передачи в get_maxsymb_and_minsymb(line, size, &min, &max)
	mov	rdi, QWORD PTR -72[rbp]		# rdi = line для передачи в get_maxsymb_and_minsymb(line, size, &min, &max)
	call	get_maxsymb_and_minsymb@PLT
	movzx	eax, BYTE PTR -117[rbp]		# min для передачи в printf("Minimum symb: %c\r\n", min)
	movsx	eax, al
	mov	esi, eax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	movzx	eax, BYTE PTR -118[rbp]		# max для передачи в printf("Maximum symb: %c\r\n", max);
	movsx	eax, al
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L6
.L12:
	lea	rdi, .LC12[rip]
	call	puts@PLT
	lea	rax, -116[rbp]
	mov	rsi, rax
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -116[rbp]
	test	eax, eax
	jle	.L15
	mov	eax, DWORD PTR -116[rbp]
	cmp	eax, 100
	jle	.L16
.L15:
	lea	rdi, .LC13[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L6
.L16:
	mov	eax, DWORD PTR -116[rbp]
	mov	edi, eax
	call	srand@PLT
	lea	rdi, .LC14[rip]
	call	puts@PLT
	mov	r12d, 0				# r12d = i в for {printf();}
	jmp	.L17
.L18:	# цикл for {printf();}
	call	rand@PLT
	mov	edx, eax
	movsx	rax, edx
	imul	rax, rax, 1374389535
	shr	rax, 32
	mov	ecx, eax
	sar	ecx, 3
	mov	eax, edx
	sar	eax, 31
	sub	ecx, eax
	mov	eax, ecx
	sal	eax, 2
	add	eax, ecx
	lea	ecx, 0[0+rax*4]
	add	eax, ecx
	mov	ecx, edx
	sub	ecx, eax
	mov	eax, ecx
	add	eax, 65
	mov	ecx, eax
	mov	rdx, QWORD PTR -72[rbp]
	mov	eax, r12d			# eax = i
	cdqe
	mov	BYTE PTR [rdx+rax], cl
	mov	eax, r12d			# eax = i
	movsx	rdx, eax
	mov	rax, QWORD PTR -72[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	edx, al
	mov	esi, r12d			# rdi = i
	lea	rdi, .LC15[rip]
	mov	eax, 0
	call	printf@PLT
	add	r12d, 1				# ++i
.L17:
	mov	eax, DWORD PTR -108[rbp]
	cmp	r12d, eax			# i < eax
	jl	.L18
	lea	rdi, .LC16[rip]
	call	puts@PLT
	mov	esi, DWORD PTR -108[rbp]	# esi = size для передачи в get_maxsymb_and_minsymb(line, size, &min, &max)
	lea	rcx, -118[rbp]			# rcx = &max для передачи в get_maxsymb_and_minsymb(line, size, &min, &max)
	lea	rdx, -117[rbp]			# rdx = &min для передачи в get_maxsymb_and_minsymb(line, size, &min, &max)
	mov	rdi, QWORD PTR -72[rbp]		# rdi = line для передачи в get_maxsymb_and_minsymb(line, size, &min, &max)
	call	get_maxsymb_and_minsymb@PLT
	movzx	eax, BYTE PTR -117[rbp]		# min для передачи в printf("Minimum symb: %c\r\n", min)
	movsx	eax, al
	mov	esi, eax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	movzx	eax, BYTE PTR -118[rbp]		# max для передачи в printf("Maximum symb: %c\r\n", max);
	movsx	eax, al
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
.L6:
	mov	rsp, rbx
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	main, .-main
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
