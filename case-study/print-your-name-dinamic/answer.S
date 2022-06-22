.section .data
my_input:
    .asciz "Input name : "

.section .text

.global _start

_start:

  movl  $1, %eax
  movl  $1, %edi
  leaq  my_input(%rip), %rsi
  movl  $13, %edx
  syscall

  subq $10000, %rsp
  movl $0, %eax
  movl $0, %edi
  leaq (%rsp), %rsi
  movl $10000, %edx
  syscall

  movl %eax, %edx
  movl $1, %eax
  leaq (%rsp), %rsi
  movl $1, %edi
  syscall

  movl $60, %eax
  movl $0, %edi
  syscall
