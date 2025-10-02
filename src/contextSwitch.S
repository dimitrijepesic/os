# contextSwitch.S - implementacija za CCB::contextSwitch

# Globalni simbol za C++ funkciju: CCB::contextSwitch(Context*, Context*)
.global _ZN3CCB13contextSwitchEPNS_7ContextES1_

_ZN3CCB13contextSwitchEPNS_7ContextES1_:
    # Sačuvaj ra i sp STARE niti u njen TCB (u a0)
    sd ra, 0 * 8(a0)  # oldContext->ra = ra
    sd sp, 1 * 8(a0)  # oldContext->sp = sp

    # Učitaj ra i sp NOVE niti iz njenog TCB-a (u a1)
    ld ra, 0 * 8(a1)  # ra = runningContext->ra
    ld sp, 1 * 8(a1)  # sp = runningContext->sp

    # Vrati se. Ovo skače na novu povratnu adresu sa novim stekom.
    ret