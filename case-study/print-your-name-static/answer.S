.section .data
my_name:
    .asciz "Suyab89\n"

.section .text

.global _start

_start:

    movl  $1, %eax
    movl  $1, %edi
    leaq  my_name(%rip), %rsi
    movl  $8, %edx
    syscall

    movl  $60, %eax
    xorl  %edi, %edi
    syscall
