section .data:
    hello: "Hello, world!\n"
section .text:
.start:
    push hello
.loop:
    dup
    ld
    push .break
    xchng
    jz
    push 0
    st
    pop
    inc
    push .loop
    jmp
.break:
    pop
    hlt
