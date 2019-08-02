
%include '../lib/std_64_x86.asm'

SECTION .bss
  h: resb 255

SECTION .text
  global _start

_start:
  
  mov r8, h
  mov rax, 12345
  call addH
  mov rax, h
  call printsln

  call exit

