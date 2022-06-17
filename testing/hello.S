.section .data

.var: .asciz "Hello\n"

.section .text

.global _start

_start:

// NOTE

/*
  movb : byte = 8bit
  movw : word = 16bit
  movl : long or dword = 32bit
  movq : qword = 64bit
*/

  movl $1, %eax
  movl $1, %edi
  leaq .var(%rip), %rsi
  movl $6, %edx
  syscall

  movl $60, %eax
  movl $0, %edi
  syscall
