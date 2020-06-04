# suited pocket ; FD on flop
.global myfunction 

myfunction:
       xor %rdi, %rdi       # clear result register
       xor %rbx, %rbx       # clear occurence counter 
       xor %rcx, %rcx       # clear occurence counter 
   
       mov %r9 ,         %rax
       and $0x30303030 , %rax  
       mov %eax , -40(%rsp) # put suits of flop3 in "red zone"

       mov %r8 ,         %rax
       and $0x30303030 , %rax 
       mov %eax , -8(%rsp)  # put suits of pocket1, pocket2, flop1, flop2 in "red zone"

       cmp %al , %ah   # is pocket suited ?
       jne 0f

       mov $0x10000, %rdi   # inc high counter - pocket occurence 

       movb -24(%rsp) , %dl
       cmp %dl,         %al
       setz %bl              # flop1 suited with pocket 

       movb -32(%rsp) , %dl
       cmp %dl,         %al
       setz %bh              # flop2 suited with pocket 

       movb -40(%rsp) , %dl
       cmp %dl,         %al
       setz %cl              # flop3 suited with pocket 

       add %bl, %bh
       add %bh, %cl
       cmp $2,  %cl
       jb 0f
       inc %rdi

0:     ret
