section .data
    io: .word 0

section .code
.start:
.loop:
    push io
    ld
    push io
    st
    push .exit
    jz
    push .loop
    jmp
.exit:
    hlt

