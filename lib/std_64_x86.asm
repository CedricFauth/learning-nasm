; String toString(Int number)
toStr:
  push r9
  push rax
  push rdi
  push rsi
  push rdx
  push r8
  push r8
  
  mov r9,0

nextInt:
  mov rdx, 0
  mov rsi, 10
  idiv rsi
  add rdx, 48
  pop r8
  push rdx
  push r8
  inc r9
  ;mov qword [r8], rdx
  ;inc r8
  ;push r8
  cmp rax, 0
  jnz nextInt
  pop r8

concatFromStack:
  pop rax
  mov qword [r8], rax
  inc r8
  dec r9
  jnz concatFromStack
  mov byte [r8], 0
  pop r8
  pop rdx
  pop rsi
  pop rdi
  pop rax
  pop r9
  ret

; Integer toInt(String numberAsString)
; TODO
; int slen(String message)
slen:
    push    rdi
    mov     rdi, rax
 
nextchar:
    cmp     byte [rax], 0
    jz      finished
    inc     rax
    jmp     nextchar
 
finished:
    sub     rax, rdi
    pop     rdi
    ret

; void printi(Integer number)
printi:
  push rax
  push r8
  push rdx
  push rsi
  mov r8, 0

divideLoop:
  inc r8
  mov rdx, 0
  mov rsi, 10
  idiv rsi
  add rdx,48
  push rdx
  cmp rax, 0
  jnz divideLoop

printLoop:
  dec r8
  mov rax, rsp
  call prints
  pop rax
  cmp r8, 0
  jnz printLoop

  pop rsi
  pop rdx
  pop r8
  pop rax
  ret
;void printiln(Integer number)
printiln:
  call printi
  
  push rax
  push 0Ah
  mov rax, rsp
  call prints
  pop rax
  pop rax
  ret

; void sprint(String message)
prints:
    push rdx
    push rsi
    push rdi
    push rax
    push rax
    call slen
 
    mov rdx, rax
    pop rax
 
    mov rsi, rax
    mov rdi, 0
    mov rax, 1
    syscall
    pop rax 
    pop rdi
    pop rsi
    pop rdx
    ret
 
; void sprintLF(String message)
printsln:
    call    prints
 
    push    rax         ; push rax onto the stack to preserve it while we use the rax register in this function
    push    0Ah         ; push the linefeed onto the stack so we can get the address
    mov     rax, rsp    ; move the address of the current stack pointer into rax for sprint
    call    prints      ; call our sprint function
    pop     rax         ; remove our linefeed character from the stack
    pop     rax         ; restore the original value of rax before our function was called
    ret                 ; return to our program

; String input(String buffer)
input:
  push rdx
  push rsi
  push rdi
  push rax

  mov rdx, 255
  mov rsi, rax
  mov rdi, 0
  mov rax, 0
  syscall

  pop rax
  pop rdi
  pop rsi
  pop rdx
  ret

; void exit()
exit:
    mov     rdi, 0
    mov     rax, 60
    syscall
    ret
