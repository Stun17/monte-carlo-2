# connected pocket ; OESD on turn 
.global myfunction 

myfunction:
       xor %rdi, %rdi              # clear output result register
       xor %ecx, %ecx              # clear counter 

       call r8_rank_redzone        # put ranks in red zone

       movw -8(%rsp), %ax          # params of 'connected' to AX
       call connected              # test that pocket is connected
       cmp $0 , %si                # test results of 'connected'
       jne 0f

       mov $0x10000, %rdi
11:
       movb -48(%rsp), %al
       movb -32(%rsp), %ah
       call connected 
       cmp $0 , %si
       jne 12f
       add $1, %cl                 # 1st card of flop hits
       jmp 21f
12:
       movb -48(%rsp), %al
       movb -40(%rsp), %ah
       call connected 
       cmp $0 , %si
       jne 21f
       add $1, %cl                 # 1st card of flop hits
21:
       movb -56(%rsp), %al
       movb -32(%rsp), %ah
       call connected 
       cmp $0 , %si
       jne 22f
       add $2, %cl                 # 2nd card of flop hits
       jmp 31f
22:
       movb -56(%rsp), %al
       movb -40(%rsp), %ah
       call connected 
       cmp $0 , %si
       jne 31f
       add $2, %cl                 # 2nd card of flop hits
31:
       movb -64(%rsp), %al
       movb -32(%rsp), %ah
       call connected 
       cmp $0 , %si
       jne 32f
       add $4, %cl                 # 3rd card of flop hits
       jmp 7f
32:
       movb -64(%rsp), %al
       movb -40(%rsp), %ah
       call connected 
       cmp $0 , %si
       jne 7f
       add $4, %cl                 # 3rd card of flop hits
7:
       cmp $0, %cl
       je 0f
       cmp $1, %cl
       jne 201f
101:
       movb -48(%rsp), %al             
       movb -56(%rsp), %ah
       call connected 
       cmp $0 , %si
       jne 102f
       incq %rdi                   # 1st and 2nd flop connected to pocket
       jmp 0f 
102:
       movb -48(%rsp), %al
       movb -64(%rsp), %ah
       call connected 
       cmp $0 , %si
       jne 0f
       incq %rdi                   # 1st and 3rd flop connected to pocket
       jmp 0f              
201:
       cmp $2, %cl
       jne 401f
       movb -56(%rsp), %al
       movb -48(%rsp), %ah
       call connected 
       cmp $0 , %si
       jne 202f
       incq %rdi                  # 2nd and 1st flop connected to pocket
       jmp 0f 
202:
       movb -56(%rsp), %al
       movb -64(%rsp), %ah
       call connected 
       cmp $0 , %si
       jne 401f
       incq %rdi                  # 2nd and 3rd flop connected  to pocket
       jmp 0f 
401:    
       cmp $4, %cl
       jne 8f
       movb -64(%rsp), %al
       movb -48(%rsp), %ah
       call connected 
       cmp $0 , %si
       jne 402f
       incq %rdi                  # 3rd and 1st flop connected  to pocket 
       jmp 0f 
402:
       movb -64(%rsp), %al
       movb -56(%rsp), %ah
       call connected 
       cmp $0 , %si
       jne 0f
8:                                # 3rd and 2nd flop connected to pocket  
       incq %rdi                  # two flops from different sides to pocket 
0:     
       ret
