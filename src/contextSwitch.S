.global context_switch
context_switch:
    # a0 = old_context_sp, a1 = new_context_sp

    # Čuvamo ra i sp stare niti
    sd ra, 0*8(a0)
    sd sp, 1*8(a0)

    # Učitavamo ra i sp nove niti
    ld ra, 0*8(a1)
    ld sp, 1*8(a1)

    ret