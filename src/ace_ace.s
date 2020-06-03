# the ace in the pocket ; opp with ace too 
.global myfunction 

myfunction:
       xor %rdi, %rdi            # clear output result register

       movq %r8 , -16(%rsp)
       movq %r9 , -80(%rsp)

       movw -16(%rsp) , %ax
       and $0x0f0f ,    %ax
       cmp %al, %ah
       je 0f

       cmp $13 ,        %al
       je 1f
       cmp $13,         %ah
       jne 0f
1:
       mov $0x10000, %rdi        #  add 1 to high counter1 - "own pocker hit"

       movw -32(%rsp),  %bx
       and $0x0f0f ,    %bx
       cmp $13,         %bl
       je 2f
       cmp $13,         %bh
       je 2f

       movw -48(%rsp),  %bx
       and $0x0f0f ,    %bx
       cmp $13,         %bl
       je 2f
       cmp $13,         %bh
       je 2f

       movw -64(%rsp),  %bx
       and $0x0f0f ,    %bx
       cmp $13,         %bl
       je 2f
       cmp $13,         %bh
       je 2f

       movw -80(%rsp),  %bx
       and $0x0f0f ,    %bx
       cmp $13,         %bl
       je 2f
       cmp $13,         %bh
       je 2f

       movw -96(%rsp),  %bx
       and $0x0f0f ,    %bx
       cmp $13,         %bl
       je 2f
       cmp $13,         %bh
       jne 0f

2:     inc %rdi                         # add 1 to low counter - "coincidence"
0:     ret
