# auxilary functions 
.global connected, r8_rank_redzone, r8_suit_redzone, r9_rank_redzone, r9_suit_redzone, r10_rank_redzone, r10_suit_redzone, r11_rank_redzone, r11_suit_redzone


# test that two cards are connected
# params       in AH:AL
# result out   in SI : 0 - "yes" , 1 - "no"
connected:                     

      mov $1, %si         # output to nil 
      sub %al, %ah         
      cmp $1,  %ah
      je 11f
      cmp $-1, %ah
      jne 12f

11:   xor %si , %si 
12:   ret


# ranks to redzone
# no params
# no outputs - just side-effect
r8_rank_redzone:

       mov %r8 , %rax
       and $0x0f0f0f0f , %rax      # p1, p2, f1, f2 
       movl %eax, -8(%rsp)     

       mov %r8 , %rax
       shr $4 ,  %rax
       and $0x0f0f0f0f , %rax      # f3, t, r, g11  
       movl %eax, -40(%rsp)     

       ret


# ranks to redzone
# no params
# no outputs - just side-effect
r8_suit_redzone:

       mov %r8 , %rax
       and $0x30303030 , %rax      # p1, p2, f1, f2 
       movl %eax, -8(%rsp)     

       mov %r8 , %rax
       shr $4 ,  %rax
       and $0x30303030 , %rax      # f3, t, r, g11  
       movl %eax, -40(%rsp)     

       ret

# ranks to redzone
# no params
# no outputs - just side-effect
r9_rank_redzone:

       mov %r9 , %rax
       and $0x0f0f0f0f , %rax      # g12, g21, g22, g31 
       movl %eax, -72(%rsp)     

       mov %r9 , %rax
       shr $4 ,  %rax
       and $0x0f0f0f0f , %rax      # g32, g41, g42, g51
       movl %eax, -104(%rsp)     

       ret


# suits to redzone
# no params
# no outputs - just side-effect
r9_suit_redzone:

       mov %r9 , %rax
       and $0x30303030 , %rax      # g12, g21, g22, g31 
       movl %eax, -72(%rsp)     

       mov %r9 , %rax
       shr $4 ,  %rax
       and $0x30303030 , %rax      # g32, g41, g42, g51 
       movl %eax, -104(%rsp)     

       ret

# ranks to redzone
# no params
# no outputs - just side-effect
r10_rank_redzone:

       mov %r10 , %rax
       and $0x0f0f0f0f , %rax      # g12, g21, g22, g31 
       movl %eax, -136(%rsp)     

       mov %r10 , %rax
       shr $4 ,   %rax
       and $0x0f0f0f0f , %rax      # g32, g41, g42, g51
       movl %eax, -168(%rsp)     

       ret


# suits to redzone
# no params
# no outputs - just side-effect
r10_suit_redzone:

       mov %r10 , %rax
       and $0x30303030 , %rax      # g12, g21, g22, g31 
       movl %eax, -200(%rsp)     

       mov %r10 , %rax
       shr $4 ,   %rax
       and $0x30303030 , %rax      # g32, g41, g42, g51 
       movl %eax, -232(%rsp)     

       ret

# ranks to redzone
# no params
# no outputs - just side-effect
r11_rank_redzone:

       mov %r11 , %rax
       and $0x0f0f0f0f , %rax      # g12, g21, g22, g31 
       movl %eax, -264(%rsp)     

       mov %r11 , %rax
       shr $4 ,   %rax
       and $0x0f0f0f0f , %rax      # g32, g41, g42, g51
       movl %eax, -296(%rsp)     

       ret


# suits to redzone
# no params
# no outputs - just side-effect
r11_suit_redzone:

       mov %r11 , %rax
       and $0x30303030 , %rax      # g12, g21, g22, g31 
       movl %eax, -328(%rsp)     

       mov %r11 , %rax
       shr $4 ,   %rax
       and $0x30303030 , %rax      # g32, g41, g42, g51 
       movl %eax, -360(%rsp)     

       ret

