# Модификации
## Был использован аргумент командной строки: 
~~~
gcc -masm=intel \
-fno-asynchronous-unwind-tables \
-fno-jump-tables \
-fno-stack-protector \
-fno-exceptions \
./make_array.c \
-S -o ./make_array_edited.s
~~~
## <br> Также удалены бесполезный присваивания из main.s:
> \- mov	rax, rsp
> <br> - mov	rbx, rax
> <br> + mov	rbx, rsp

> \- mov	rax, QWORD PTR -88[rbp]
> <br> - mov	rdi, rax
> <br> + mov	rdi, QWORD PTR -88[rbp]

> \- mov	rax, QWORD PTR -104[rbp]
> <br> - mov	rdi, rax
> <br> + mov	rdi, QWORD PTR -104[rbp]

> \- mov	eax, QWORD PTR -56[rbp]
> <br> - mov	esi, eax
> <br> + mov	esi, QWORD PTR -56[rbp]

> \- mov	rax, QWORD PTR -72[rbp]
> <br> - mov	rdi, rax
> <br> + mov	rdi, QWORD PTR -72[rbp]

> \- mov	eax, QWORD PTR -52[rbp]
> <br> - mov	esi, eax
> <br> + mov	esi, QWORD PTR -52[rbp]

## <br> Так же во всех файлах удалены:
> endbr64
