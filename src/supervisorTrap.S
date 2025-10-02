.global supervisor_trap
.extern handle_supervisor_trap

.align 4
supervisor_trap:
    # Zamenjujemo kernel i user stek
    csrrw sp, sscratch, sp

    # Čuvamo ceo korisnički kontekst na kernel steku
    sd ra, 0(sp)
    sd s0, 8(sp)
    sd s1, 16(sp)
    sd s2, 24(sp)
    sd s3, 32(sp)
    sd s4, 40(sp)
    sd s5, 48(sp)
    sd s6, 56(sp)
    sd s7, 64(sp)
    sd s8, 72(sp)
    sd s9, 80(sp)
    sd s10, 88(sp)
    sd s11, 96(sp)
    sd a0, 104(sp)
    sd a1, 112(sp)
    sd a2, 120(sp)
    sd a3, 128(sp)
    sd a4, 136(sp)
    sd a5, 144(sp)
    sd a6, 152(sp)
    sd a7, 160(sp)
    sd t0, 168(sp)
    sd t1, 176(sp)
    sd t2, 184(sp)
    sd t3, 192(sp)
    sd t4, 200(sp)
    sd t5, 208(sp)
    sd t6, 216(sp)

    # Vraćamo originalni user sp iz sscratch registra i čuvamo ga
    csrr t0, sscratch
    sd t0, 224(sp)

    # Pozivamo C++ handler
    call handle_supervisor_trap

    # Restauriramo ceo korisnički kontekst
    ld ra, 0(sp)
    ld s0, 8(sp)
    ld s1, 16(sp)
    ld s2, 24(sp)
    ld s3, 32(sp)
    ld s4, 40(sp)
    ld s5, 48(sp)
    ld s6, 56(sp)
    ld s7, 64(sp)
    ld s8, 72(sp)
    ld s9, 80(sp)
    ld s10, 88(sp)
    ld s11, 96(sp)
    ld a0, 104(sp)
    ld a1, 112(sp)
    ld a2, 120(sp)
    ld a3, 128(sp)
    ld a4, 136(sp)
    ld a5, 144(sp)
    ld a6, 152(sp)
    ld a7, 160(sp)
    ld t0, 168(sp)
    ld t1, 176(sp)
    ld t2, 184(sp)
    ld t3, 192(sp)
    ld t4, 200(sp)
    ld t5, 208(sp)
    ld t6, 216(sp)
    ld sp, 224(sp) # Restauriramo originalni user sp

    sret