.section .data

.var1: .asciz "AAAA"
.var2: .asciz "BBBB"
.var3: .asciz "CCCC"

my_array: .quad .var1, .var2, .var3

.section .text

.global _start

_start:
  xorl  %ebp, %ebp
  leaq  my_array(%rip), %r9
  subq  $1, %rsp
  movl  $10, (%rsp)
.Loop:
  movq  (%r9, %rbp, 8), %rsi
  movl  $4, %edx
  movl  $1, %eax
  movl  $1, %edi
  syscall

  movq  %rsp, %rsi
  movl  $1, %edx
  movl  $1, %eax
  movl  $1, %edi
  syscall

  addl  $1, %ebp
  cmpl  $3, %ebp
  jl    .Loop

  movl $60, %eax
  movl $0, %edi
  syscall
