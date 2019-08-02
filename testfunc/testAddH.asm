
%include '../lib/std_64_x86.asm'

SECTION .bss
  h: resb 255

SECTION .text
  global _start

_start:
  
  mov r8, h
  mov rax, 123456789100200
  call toStr
  mov rax, h
  call printsln
;  mov rax, 123456789100200
  call printsln

  call exit

