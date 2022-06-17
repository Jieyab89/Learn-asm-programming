.section .data
my_str:
    .asciz "Input number : "
str_satu:
    .ascii "Number one\n"
str_dua:
    .ascii "Number two\n"
str_tiga:
    .ascii "Number there\n"
str_empat:
    .ascii "Number four\n"
str_end:
str_else:
    .ascii "Not found\n"

.section .text

.global _start

_start:

  movl  $1, %eax
  movl  $1, %edi
  leaq  my_str(%rip), %rsi
  movl  $15, %edx
  syscall

  subq $100, %rsp
  movl $0, %eax
  movl $0, %edi
  leaq (%rsp), %rsi
  movl $100, %edx
  syscall

  cmpb $'1', (%rsp)
  je   satu

  cmpb $'2', (%rsp)
  je   dua

  cmpb $'3', (%rsp)
  je   tiga

  cmpb $'4', (%rsp)
  je   empat

  leaq str_else(%rip), %rsi
  movl $10, %edx
  jmp  do_write


satu:
  leaq  str_satu(%rip), %rsi
  movl  $(str_dua - str_satu), %edx
  jmp   do_write

dua:
  leaq  str_dua(%rip), %rsi
  movl  $(str_tiga - str_dua), %edx
  jmp   do_write

tiga:
  leaq  str_tiga(%rip), %rsi
  movl  $(str_empat - str_tiga), %edx
  jmp   do_write

empat:
  leaq  str_empat(%rip), %rsi
  movl  $(str_end - str_empat), %edx

do_write:
  movl  $1, %eax
  movl  $1, %edi
  syscall

  jmp _start
