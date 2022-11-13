# ИДЗ по АВС №2
### Цейтин Андрей Владимирович БПИ217
# <br> Отчет
## <br> На 4 балла:
### 1) Приведено решение задачи на C (с использованием двух единиц компиляции):
* [main.c](https://github.com/CehhGhost/ABC2/blob/main/C%20code/main.c)
* [get_maxsymb_and_minsymb.c](https://github.com/CehhGhost/ABC2/blob/main/C%20code/get_maxsymb_and_minsymb.c)
### 2)  В полученную ассемблерную программу, откомпилированную без оптимизирующих и отладочных опций, добавлены комментарии, поясняющие
эквивалентное представление переменных в программе на C:
* [main.s](https://github.com/CehhGhost/ABC2/blob/main/Assembled/main.s)
* [get_maxsymb_and_minsymb.s](https://github.com/CehhGhost/ABC2/blob/main/Assembled/get_maxsymb_and_minsymb.s)
### 3) Из ассемблерной программы убраны лишние макросы за счет использования соответствующих аргументов командной строки и/или за счет
ручного редактирования исходного текста ассемблерной программы:
* [main_updated.s](https://github.com/CehhGhost/ABC2/blob/main/Assembeld%20updated/main_updated.s)
* [get_maxsymb_and_minsymb_updated.s](https://github.com/CehhGhost/ABC2/blob/main/Assembeld%20updated/get_maxsymb_and_minsymb_updated.s)
#### [Список изменений](https://github.com/CehhGhost/ABC2/blob/main/Assembeld%20updated/Changes.md)
### 4) тестирование
> [ссылка на тесты](https://github.com/CehhGhost/ABC2/blob/main/tests.md)
> <br> При просмотре тестов можно заметить, что программа до модификаций и после работает одинаково и без ошибок => модификации установленны верно
## <br> На 5 баллов:
### 1) В реализованной программе использовать функции с передачей данных через параметры и использованны локальные переменные:
В программе используются локальные переменные (например int size), присутствует одна функция с передачей данных через параметры:
* get_maxsymb_and_minsymb(const char *line, int size, char* min, char* max)
### 2) В программу добавленны комментарии, описывающие передачу фактических параметров, перенос возвращаемого результата и связь между параметрами языка Си и регистрами (стеком)
* [main_updated.s](https://github.com/CehhGhost/ABC2/blob/main/Assembeld%20updated/main_updated.s)
* [get_maxsymb_and_minsymb_updated.s](https://github.com/CehhGhost/ABC2/blob/main/Assembeld%20updated/get_maxsymb_and_minsymb_updated.s)
## <br> На 6 баллов:
### 1) Рефакторинг программы на ассемблере за счет максимального использования регистров процессора:
#### В main:
> * r12d
> * r14d
#### В get_maxsymb_and_minsymb:
> * r14d
### 2) В программу добавленны комментарии, поясняющие эквивалентное использование регистров вместо переменных исходной программы на C
* [main_updated.s](https://github.com/CehhGhost/ABC2/blob/main/Assembeld%20updated/main_updated.s)
* [get_maxsymb_and_minsymb_updated.s](https://github.com/CehhGhost/ABC2/blob/main/Assembeld%20updated/get_maxsymb_and_minsymb_updated.s)
### 3) Тестирование
> [ссылка на тесты](https://github.com/CehhGhost/ABC2/blob/main/tests.md)
> <br> При просмотре тестов можно заметить, что программа до модификаций и после работает одинаково и без ошибок => модификации установленны верно
## <br> На 7 баллов:
### 1) Реализация программы на ассемблере, полученной после рефакторинга, в виде двух или более единиц компиляции (main_updated.s, get_maxsymb_and_minsymb_updated.s):
* [main_updated.s](https://github.com/CehhGhost/ABC2/blob/main/Assembeld%20updated/main_updated.s)
* [get_maxsymb_and_minsymb_updated.s](https://github.com/CehhGhost/ABC2/blob/main/Assembeld%20updated/get_maxsymb_and_minsymb_updated.s)
### 2) Файл с входными данными - [input.txt](https://github.com/CehhGhost/ABC2/blob/main/Assembeld%20updated/input.txt), файл с выходными данными - [output.txt](https://github.com/CehhGhost/ABC2/blob/main/Assembeld%20updated/output.txt)
### 3) Тестирование
> [ссылка на тесты](https://github.com/CehhGhost/ABC2/blob/main/tests.md)
> <br> При просмотре тестов можно заметить, что программа корректно считывает из входного файла и записывает в выходной файл
