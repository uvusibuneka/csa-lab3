section .data:
    hello: "\n>What is your name?\n>"
    bye: "\n>Hello, "
    io: 0
    buff: "                                       "
section .text:
.start:

    push hello
    push .print
    call

    push buff
    push .read
    call

    push bye
    push .print
    call

    push buff
    push .print
    call

.hlt:
    hlt

.print:
.loop:
    dup
    ld
    push .break
    xchng
    jz
    push io
    ld
    st
    pop
    inc
    push .loop
    jmp
.break:
    pop
    ret

.read:
.read_loop:
    dup
    push io
    ld
    ld
    xchng
    st
    push .end_read
    xchng
    jz
    pop
    inc
    push .read_loop
    jmp
.end_read:
    ret
    
