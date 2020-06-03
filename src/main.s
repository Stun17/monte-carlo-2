.global _start
      
.data

  ans: .long 0

_start:  

      mov $0xffff, %ecx   # num of trails is limited by accumulator EDI size (16:16)

1:    push %rcx
      call shuffle
      call myfunction 
      pop %rcx

      add %edi, ans       # accumulator:
                          #   high byte - P(pocket)
                          #   low  byte - P(win the board) 

      loop 1b

      mov $1 ,   %rax     # sys_write
      mov $1 ,   %rdi     # to stdout
      mov $ans , %rsi     # buffer address
      mov $4 ,   %rdx     # byte count
      syscall

      mov $0,  %rdi
      mov $60, %rax
      syscall
