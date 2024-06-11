section .data:
   res: 2
   io: 1
   border: 100
section .text:
.start:
   push 1
   push 2
.loop:
   xchng 
   add
   xchng
   add
   xchng 
   add

   dup
   push border
   ld
   sub 
   push .end_loop
   xchng
   jle
   pop
   
   push res
   ld
   add
   push res
   st
   pop
   
   push .loop
   jmp
.end_loop:
   pop
   pop
   push res
   ld
   push io
   ld
   st
   pop
   hlt

