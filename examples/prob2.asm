section .data
    io_addr: 0
    a: 1
    b: 2
    border: 100
    even: 1
section .code
.start:
.loop:
   push b
   ld
   dup
   dup
   push a
   ld

   dup
   push even
   and
   push even
   sub
   push .even
   jn
   pop
.back:
   add

   push b
   st
   push a
   st
   push b
   ld
   push border
   ld
   sub
   jge .hlt
   push .loop
   jmp
.hlt:
    hlt

.even:
    push res
    ld
    add
    push res
    st
    push .back
    jmp

