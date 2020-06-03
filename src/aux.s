# auxilary functions 
.global connected 

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
