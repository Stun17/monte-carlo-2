# broadway in the pocket ; opp has higher on preflop
.global myfunction 

myfunction:
       xor %rdi, %rdi            # clear output result register

       mov %r8 ,         %rax
       and $0x0f0f0f0f , %rax           # get pocket ranks in AX  player 1, 2
       mov %eax,     -32(%rsp)          # save pocket ranks and 1st, 2nd flop in "red zone"

       mov %r9 ,         %rbx
       and $0x0f0f0f0f , %rbx           # get pocket ranks in BX  player 3, 4
       mov %ebx,     -64(%rsp)          # save pocket ranks and 1st, 2nd flop in "red zone"

       mov %r10 ,        %rdx
       and $0x0f0f0f0f , %rdx           # get pocket ranks in DX  player 5, 6
       mov %edx,     -96(%rsp)          # save pocket ranks and 1st, 2nd flop in "red zone"

       cmp %al, %ah                     # dont look at broadway pair
       je 0f
       add %al, %ah 
       cmp $19 , %ah
       jb 0f

       mov $0x10000, %rdi
1:
       movw -48(%rsp) , %bx
       add %bl, %bh 
       cmp %ah , %bh 
       jb 2f
       inc %rdi
       ret
2:       
       movw -64(%rsp) , %bx
       add %bl, %bh 
       cmp %ah , %bh 
       jb 3f
       inc %rdi
       ret
3:       
       movw -80(%rsp) , %bx
       add %bl, %bh 
       cmp %ah , %bh 
       jb 4f
       inc %rdi
       ret
4:       
       movw -96(%rsp) , %bx
       add %bl, %bh 
       cmp %ah , %bh 
       jb 5f
       inc %rdi
       ret
5:       
       movw -112(%rsp) , %bx
       add %bl, %bh 
       cmp %ah , %bh 
       jb 0f
       inc %rdi

0:     ret
