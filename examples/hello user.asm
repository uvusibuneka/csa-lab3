section .data:
    hello: "\n>What is your name?\n\0>"
    bye: "\n>Hello, \0"
    io_addr: 0
    buff: "                                       "
section .text:
.start:
    push .back_name
    push hello
    push .print
    jmp print
.back_name:

    push buff
.loop_read:
    dup
    dup
    jz .end_read
    push io_addr
    ld
    dup
    jz
    st
    inc
.end_read:
    pop

    push .back_bye
    push bye
    push print
    jmp

.back_bye:
    push .hlt
    push buff
    push .print
    jmp
.hlt:
    hlt

.print:
.loop_print:
    dup
    dup
    push .end_print
    jz
    push io_addr
    st
    inc
    push .loop_print
    jmp
.end_print:
    pop
    jmp

    
