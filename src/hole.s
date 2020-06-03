# hole in the pocket ; fill the gap on flop 
.global myfunction 

myfunction:
       xor %rdi, %rdi         # clear output result counter 

   # save ranks of pocket1, pocket2, flop1, flop2 in "red zone"
       mov %r8,          %rax
       and $0x0f0f0f0f , %rax
       movl %eax, -8(%rsp)       

   # pocket hole ?
       sub %al , %ah 
       cmp $2 ,  %ah
       je 1f
       cmp $-2 , %ah
       jne 0f

1:     mov $0x10000, %rdi        # add 1 to "pocket occurence" counter

    # store only pocket least by rank in "red zone"  
       movb  -8(%rsp), %al       
       movb -16(%rsp), %ah
       sub %ah, %al
       js 2f 
       movb %ah, -8(%rsp)

2:  # fit the hole by 1st card of flop?
       movb  -8(%rsp), %al       # get pocketLeast 
       movb -24(%rsp), %ah       # get flop1 
       inc %al
       cmp %ah, %al          
       je 3f

    # fit the hole by 2nd card of flop?    
       movb  -8(%rsp), %al       # get pocketLeast 
       movb -32(%rsp), %ah       # get flop2 
       inc %al
       cmp %ah, %al          
       je 3f

    # fit the hole by 3rd card of flop?    
    # save rank of flop3 in "red zone"
       mov %r8,          %rax
       shr $32, %rax
       and $0x0f0f , %eax   # flop3 rank in AH 

       movb  -8(%rsp), %al  # get pocketLeast      
       inc %al
       cmp %ah, %al          
       jne 0f

3:     inc %rdi
0:     ret
