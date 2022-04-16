# 编译

`gcc -o hello hello.c`

# 过程

1. 输出预处理结果: `gcc -E hello.c`
2. 输出汇编: `gcc -S hello.c`
3. 汇编编译为目标文件: `as hello.s -o hello.o`

# objdump

* 反汇编`objdump -d hello`，或`objdump -S hello`

# 内存布局

`cat /proc/[pid]/maps`
