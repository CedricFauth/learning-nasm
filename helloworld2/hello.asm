
%include '/media/sf_vm_share/Assembler/lib/std_64_x86.asm'
 
SECTION .data
  msg1 db 'This is a line. ', 0h
  msg2 db 'And this is still the same line?!', 0h
  msg3 db 'And here is the next line',0h

SECTION .text
  global _start
 
_start:
 
  mov rax, msg1
  call prints
 
  mov rax, msg2
  call printsln

  mov rax, msg3
  call printsln
 
  call    exit

