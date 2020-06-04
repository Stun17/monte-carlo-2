#  $> as -gstabs test_sort.s -o test_bubble.o
#  $> ld -o aux.o test_bubble.o 

.global _start  

_start:
       #data
       movb $1 , -16(%rsp)
       movb $4 , -17(%rsp)
       movb $7 , -18(%rsp)
       movb $5 , -19(%rsp)
       movb $9 , -20(%rsp)

   # prepare params
       mov %rsp , %rbp
       sub $20  , %rbp
       mov $4   , %rcx

       call bubble_sort

       mov $60 , %rax
       syscall

# params : addr - RBP, lenght - RCX
# outpub : none
bubble_sort:

1:    movb  (%rbp,%rcx) , %dl
      movb 1(%rbp,%rcx) , %dh 
      cmp %dl, %dh
      ja 2f
      movb %dh ,  (%rbp,%rcx)      
      movb %dl , 1(%rbp,%rcx)      
2:    loop 1b

      ret
