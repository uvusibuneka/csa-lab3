section .data:
    io: 0
section .text:
.start:
.loop:
    push io
    ld
    ld
    push .exit
    xchng
    jz
    push io
    ld
    st
    push .loop
    jmp
.exit:
    hlt

