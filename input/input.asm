
%include '../lib/std_64_x86.asm'

SECTION .bss
  inp1: resb 255

SECTION .text
  global _start

_start:
  mov rax, inp1
  call input
  
;  mov rax, inp1
  call prints

  call exit

