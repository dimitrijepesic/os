.global _ZN5Riscv14context_switchEPN3TCB7ContextES2_
_ZN5Riscv14context_switchEPN3TCB7ContextES2_:

    sd ra, 0*8(a0)
    sd sp, 1*8(a0)

    ld ra, 0*8(a1)
    ld sp, 1*8(a1)

    ret