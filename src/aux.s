# auxilary functions 
.global connected, r8_rank_redzone, r8_suit_redzone, r9_rank_redzone, r9_suit_redzone

connected:                     
                          # test that two cards are connected
                          # params in    AH:AL
                          # result out   %si     :    0 - yes    ,     1 - no
      mov $1, %si         # output to nil 
      sub %al, %ah         
      cmp $1,  %ah
      je 11f
      cmp $-1, %ah
      jne 12f

11:   xor %si , %si 
12:   ret


r8_rank_redzone:
                                   # ranks to redzone
                                   # no params
                                   # no outputs - just side-effect
       mov %r8 , %rax
       and $0x0f0f0f0f , %rax      # p1, p2, f1, f2 
       movl %eax, -8(%rsp)     

       mov %r8 , %rax
       shr $4 ,  %rax
       and $0x0f0f0f0f , %rax      # f3, t, r, g11  
       movl %eax, -40(%rsp)     

       ret


r8_suit_redzone:
                                   # suits to redzone
                                   # no params
                                   # no outputs - just side-effect
       mov %r8 , %rax
       and $0x30303030 , %rax      # p1, p2, f1, f2 
       movl %eax, -8(%rsp)     

       mov %r8 , %rax
       shr $4 ,  %rax
       and $0x30303030 , %rax      # f3, t, r, g11  
       movl %eax, -40(%rsp)     

       ret

r9_rank_redzone:
                                   # ranks to redzone
                                   # no params
                                   # no outputs - just side-effect
       mov %r9 , %rax
       and $0x0f0f0f0f , %rax      # g12, g21, g22, g31 
       movl %eax, -72(%rsp)     

       mov %r9 , %rax
       shr $4 ,  %rax
       and $0x0f0f0f0f , %rax      # g32, g41, g42, (g51 -- out of "red zone" !!!)  
       movl %eax, -104(%rsp)     

       ret


r9_suit_redzone:
                                   # suits to redzone
                                   # no params
                                   # no outputs - just side-effect
       mov %r9 , %rax
       and $0x30303030 , %rax      # g12, g21, g22, g31 
       movl %eax, -72(%rsp)     

       mov %r9 , %rax
       shr $4 ,  %rax
       and $0x30303030 , %rax      # g32, g41, g42, (g51 -- out of "red zone" !!!)  
       movl %eax, -104(%rsp)     

       ret

