# the ace in the pocket ; the ace on flop
.global myfunction 

# input params  : deck in R8 - R11
# output params : two counters in two low bytes of RDI
myfunction:
       xor %rdi, %rdi            # clear output result register

       mov %r8 ,      %rax
       and $0xf ,     %al
       cmp $13 ,      %al
       je 1f

       mov %r8 ,      %rax
       shr $8,        %rax 
       and $0xf ,     %al
       cmp $13 ,      %al
       jne 0f

1:     mov $0x10000, %rdi

       mov %r8 ,      %rax
       shr $16 ,      %rax 
       and $0xf ,     %rax
       cmp $13 ,      %al
       je 2f

       mov %r8 ,      %rax
       shr $24 ,      %rax 
       and $0xf ,     %al
       cmp $13 ,      %al
       je 2f

       mov %r8 ,      %rax
       shr $32 ,      %rax 
       and $0xf ,     %al
       cmp $13 ,      %al
       jne 0f

2:     inc %rdi
0:     ret
