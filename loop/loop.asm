
%include '../lib/std_64_x86.asm'

SECTION .text
  global _start

_start:
  mov rdx, 0

nextNumber:
  inc rdx
  mov eax,edx
  call printiln
  cmp rdx, 10h
  jne nextNumber

  call exit

