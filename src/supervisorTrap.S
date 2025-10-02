.extern _ZN5Riscv20handleSupervisorTrapEv

.align 4
.global supervisorTrap
.type supervisorTrap, @function
supervisorTrap:
    # C handler vraca u a0:
    #   0 = bez promene konteksta  -> sret
    #   1 = promenjen kontekst     -> ret (jer je vec uradjen contextSwitch)
    call _ZN5Riscv20handleSupervisorTrapEv
    beqz a0, 1f
    ret
1:
    sret
