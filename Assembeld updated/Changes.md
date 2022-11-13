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

> \- mov	rax, DWORD PTR -88[rbp]
> <br> - mov	rdi, rax
> <br> + mov	rdi, DWORD PTR -88[rbp]

> \- mov	rax, DWORD PTR -104[rbp]
> <br> - mov	rdi, rax
> <br> + mov	rdi, DWORD PTR -104[rbp]

> \- mov	eax, DWORD PTR -56[rbp]
> <br> - mov	esi, eax
> <br> + mov	esi, DWORD PTR -56[rbp]

> \- mov	rax, DWORD PTR -72[rbp]
> <br> - mov	rdi, rax
> <br> + mov	rdi, DWORD PTR -72[rbp]

> \- mov	eax, DWORD PTR -52[rbp]
> <br> - mov	esi, eax
> <br> + mov	esi, DWORD PTR -52[rbp]

## <br> Так же во всех файлах удалены:
> endbr64
