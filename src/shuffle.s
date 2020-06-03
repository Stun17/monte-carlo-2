.global shuffle , deck

.data        

deck:      .rept   32 
           .byte   0 
           .endr

buff:      .rept   32
           .byte   0
           .endr

.text

shuffle:

    lea buff, %rdi
    mov $32,  %rsi   # number of bytes
    mov $0,   %rdx   # flags ? smth with block / non-block ?
    mov $318, %rax
    syscall

    mov $32 , %rcx
    xor %rdi, %rdi

1:  movb buff (%rcx) , %al
    and $0b00111111  , %al    # we need only low six bits 
    mov %al, %bl
    and $0xF , %bl            # check value in range 0-12
    cmp $0xD , %bl
    ja 2f                     # bad sample 

    xor %rdx, %rdx
    call check
    cmp $0x0, %dl
    jne 2f

    movb %al , deck (%rdi)    # good sample 
    inc %rdi
2:  loop 1b

    movq deck,      %r8 
    movq deck +  8, %r9 
    movq deck + 16, %r10 
    movq deck + 24, %r11 

    mov %rdi, %rax
    ret

check:
    push %rcx
    push %rbx
    mov $32 , %rcx

3:  movb deck (%rcx) , %bl
    cmp %al, %bl
    je 4f 
    loop 3b
    mov $0, %dl
    jmp 5f

4:  mov $1, %dl

5:  pop %rbx
    pop %rcx
    ret
