# pocket pair ; set on flop
.global myfunction 

myfunction:
       xor %rdi, %rdi       # clear result register

       mov %r9 ,   %rax
       and $0x0f , %rax  
       movb %al , -40(%rsp)    #   put rank of f3 in "red zone"

       mov %r8 ,         %rax
       and $0x0f0f0f0f , %rax 
       movl %eax , -8(%rsp)    #   put ranks of p1, p2, f1, f2 in "red zone"

       cmp %al , %ah           # is pocket paired?
       jne 0f

       mov $0x10000, %rdi      #  set counter of pocket occurence

       movb -24(%rsp) , %dl
       cmp %al, %dl
       je 1f                   # f1 hit 

       movb -32(%rsp) , %dl
       cmp %al, %dl
       je 1f                   # f2 hit 

       movb -40(%rsp) , %dl
       cmp %al, %dl
       je 1f                   # f3 hit 

       jmp 0f                   # no hiting 

1:     inc %rdi
0:     ret
