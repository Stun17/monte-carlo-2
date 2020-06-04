#  $> as -gstabs test_sort.s -o test_bubble.o
#  $> ld -o aux.o test_bubble.o 

.global _start  

_start:
       #data
       movb $4 , -17(%rsp)
       movb $3 , -18(%rsp)
       movb $1 , -19(%rsp)
       movb $9 , -20(%rsp)
       movb $2 , -21(%rsp)

                                mov $1 ,   %rdi
                                mov %rsp , %rsi
                                sub $21 ,  %rsi
                                mov $5 ,   %rdx             # count
                                mov $1,    %rax             # sys_write
                                syscall
   # prepare params
       mov %rsp  , %rbp
       sub $21   , %rbp
       mov $4    , %rcx


       call bubble_sort

                                mov $1 ,   %rdi
                                mov %rsp , %rsi
                                sub $21 ,  %rsi
                                mov $5 ,   %rdx             # count
                                mov $1,    %rax             # sys_write
                                syscall

       mov $60 , %rax
       syscall

# params : addr - RBP, lenght - RCX
# outpub : none
bubble_sort:

1:    push %rcx

2:    movb    (%rbp, %rcx) , %dl
      movb  -1(%rbp, %rcx) , %dh 
      cmp %dl, %dh
      jns 3f
      movb %dh ,   (%rbp, %rcx)      
      movb %dl , -1(%rbp, %rcx)      
3:    loop 2b

      pop %rcx
      inc %rbp
      loop 1b

      ret
