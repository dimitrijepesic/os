// U fajlu: src/riscv.cpp

#include "../h/riscv.hpp"
#include "../h/TCB.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/print.hpp"
#include "../lib/hw.h"

// Deklaracija asemblerske funkcije. Njeno telo je u supervisorTrap.S
extern "C" void supervisorTrap();

// C++ handler koji se poziva iz asemblera
void Riscv::supervisorTrapHandler() {
    // 1. Pročitaj uzrok prekida (scause) i sačuvaj originalni sstatus
    uint64 scause = r_scause();
    uint64 sstatus = r_sstatus();
    uint64* context;

    // 2. Preuzmi pokazivač na sačuvan kontekst iz a0 registra
    //    (asemblerski kod je uradio 'mv a0, sp' pre poziva ove funkcije)
    __asm__ volatile ("mv %[context], a0" : [context] "=r"(context));


    // ====================================================================
    // OBRADA SISTEMSKIH POZIVA (ecall)
    // ====================================================================
    if (scause == 0x08 || scause == 0x09) { // ecall iz U-moda ili S-moda
        // Kod sistemskog poziva je u sačuvanom registru a0 (x10)
        uint64 syscall_code = context[10];

        // Pomeri sepc da se po povratku izvrši sledeća instrukcija NAKON ecall
        w_sepc(r_sepc() + 4);

        // Dispečer sistemskih poziva
        switch (syscall_code) {
            // === Memorija ===
            case 0x01: { // mem_alloc
                size_t size_in_bytes = (size_t)context[11]; // arg a1
                void* ret_addr = MemoryAllocator::mem_alloc(size_in_bytes);
                context[10] = (uint64)ret_addr; // Povratna vrednost u a0
                break;
            }
            case 0x02: { // mem_free
                void* addr_to_free = (void*)context[11]; // arg a1
                int ret_val = MemoryAllocator::mem_free(addr_to_free);
                context[10] = ret_val; // Povratna vrednost u a0
                break;
            }

                // === Niti ===
            case 0x11: { // thread_create
                thread_t* handle = (thread_t*)context[11];
                TCB::Body start_routine = (TCB::Body)context[12];
                void* arg = (void*)context[13];
                uint64* stack = (uint64*)context[14];

                int ret_val = TCB::create_thread_for_syscall(handle, start_routine, arg, stack);
                context[10] = ret_val; // Povratna vrednost u a0
                break;
            }
            case 0x12: { // thread_exit
                int ret_val = TCB::exit_thread();
                context[10] = ret_val; // Povratna vrednost u a0
                break;
            }
            case 0x13: { // thread_dispatch
                // Čista promena konteksta na zahtev niti
                TCB::dispatch();
                break;
            }

                // === Nepoznat sistemski poziv ===
            default: {
                // Ako kod nije prepoznat, vrati grešku.
                context[10] = -1;
                break;
            }
        }
    }
        // ====================================================================
        // OBRADA PREKIDA OD TAJMERA
        // ====================================================================
    else if (scause == 0x8000000000000001UL) {
        // Potvrdi prijem prekida od tajmera
        mc_sip(SIP_SSIP);

        // **EDGE CASE**: Ako se prekid desi pre nego što je multitasking počeo,
        // TCB::running pokazuje na 'main' nit, koja nema korisnički kontekst
        // za promenu. Ne radimo ništa, samo se vraćamo.
        if (TCB::running->isIdle() || TCB::running == TCB::mainThread) {
            // Ne radimo promenu konteksta za idle ili main nit
        } else {
            // U suprotnom, ažuriraj brojač i proveri da li je vreme isteklo
            TCB::running->tick();
            if (TCB::running->isTimeSliceUp()) {
                TCB::dispatch(); // Promeni kontekst
            }
        }
    }
    else if (scause == 0x8000000000000009UL) { // Spoljašnji hardverski prekid
        // Pozivamo PLIC da vidimo koji uređaj je izazvao prekid
        int irq = plic_claim();

        if (irq == CONSOLE_IRQ) {
            // Prekid je od konzole. Za sada ne radimo ništa sa podacima,
            // samo javljamo PLIC-u da smo obradili prekid.
            plic_complete(irq);
        }
    }
        // ====================================================================
        // OBRADA DRUGIH (NEOČEKIVANIH) GREŠAKA
        // ====================================================================
    else {
        // Ispis greške pomaže u debagovanju
        printString("Unexpected trap! scause: ");
        printInteger(scause);
        printString(", sepc: ");
        printInteger(r_sepc());
        printString("\n");
        // U slučaju nepoznate greške, sistem je u nestabilnom stanju.
        // Najbolje je zaustaviti ga.
        while(true);
    }

    // 3. Restauriraj sstatus. Ovo je važno da bi se povratio prethodni
    //    status dozvole/zabrane prekida (SIE bit).
    w_sstatus(sstatus);
}

// Implementacija ostalih funkcija iz riscv.hpp
void Riscv::popSppSpie() {
    // csrw sepc, ra postavlja da se sret vrati na instrukciju NAKON poziva ove funkcije
    __asm__ volatile("csrw sepc, ra");
    // sret radi sledeće:
    // 1. pc <- sepc (skače na povratnu adresu)
    // 2. Prebacuje režim rada procesora na onaj u sstatus.SPP (verovatno korisnički)
    // 3. Postavlja dozvolu prekida na vrednost sstatus.SPIE
    __asm__ volatile("sret");
}