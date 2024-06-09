section .data
hello: "Hello, world!\n", 0
section .code
.start:
    push hello
.loop:
    dup
    ld
    push .break
    jz
    push 0
    st
    inc
    push .loop
    jmp
.break:
    pop
    hlt
