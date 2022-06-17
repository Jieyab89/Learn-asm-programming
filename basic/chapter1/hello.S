// Static variabel rw-
.section .data
my_str:
    .asciz "Hello World!\n"

// The default permission of .text section is r-x.
.section .text

.global _start

_start:
// NOTE

/*
  movb : byte = 8bit
  movw : word = 16bit
  movl : long or dword = 32bit
  movq : qword = 64bit

  movl, subq, any are instructions and have example operands. Register, Immediate, Memory
  $1 is Immediate
  %eax Register
  label(%rip) Memory
*/

    movl  $1, %eax
    movl  $1, %edi
    leaq  my_str(%rip), %rsi
    movl  $13, %edx
    syscall

    movl  $60, %eax
    xorl  %edi, %edi
    syscall
