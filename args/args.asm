
%include '/media/sf_vm_share/Assembler/lib/std_64_x86.asm'

SECTION .data
  stopmsg: db "Stop"
SECTION .text
  global _start

_start:
  pop rdx   ;number of args

nextArg:
  cmp rdx, 0h
  jz n
  pop rax
  call printsln
  dec rdx
  jmp nextArg

n:
  mov rax,stopmsg
  call printsln
  call exit  
  
