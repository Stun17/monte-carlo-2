#  $> as -gstabs test_sort.s -o test_bubble.o
#  $> ld -o aux.o test_bubble.o 

.global _start  

_start:
       #data
       movb $6 ,  -8(%rsp)
       movb $2 ,  -9(%rsp)
       movb $4 , -10(%rsp)
       movb $5 , -11(%rsp)
       movb $3 , -12(%rsp)

       #params
       mov %rsp  , %rax
       sub $-12  , %rax
       mov $4    , %rcx

       call bubble_sort

       nop  
       mov $60 , %rax
       syscall

# params : addr - EAX, lenght - ECX
# outpub : none
bubble_sort:

1:    movb  (%rax) , %dl
      movb 1(%rax) , %dh 
      cmp %dl, %dh
      ja 2f
      movb %dh ,  (%rax)      
      movb %dl , 1(%rax)      
2:    inc %rax
      loop 1b

      ret
