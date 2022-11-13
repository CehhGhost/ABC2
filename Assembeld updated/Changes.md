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
- mov	rax, rsp
- mov	rbx, rax
+ mov	rbx, rsp

- mov	rax, QWORD PTR -88[rbp]
- mov	rdi, rax
+ mov	rdi, QWORD PTR -88[rbp]

- mov	rax, QWORD PTR -104[rbp]
- mov	rdi, rax
+ mov	rdi, QWORD PTR -104[rbp]

- mov	eax, DWORD PTR -56[rbp]
- mov	esi, eax
+ mov	esi, DWORD PTR -56[rbp]

- mov	rax, QWORD PTR -72[rbp]
- mov	rdi, rax
+ mov	rdi, QWORD PTR -72[rbp]

- mov	eax, DWORD PTR -52[rbp]
- mov	esi, eax
+ mov	esi, DWORD PTR -52[rbp]
## <br> Так же во всех файлах удалены:
> endbr64
