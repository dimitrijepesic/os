//
// Created by os on 9/26/25.
//

#include "../h/riscv.hpp"
#include "../h/ccb.hpp"
#include "../h/_semaphore.hpp"
#include "../h/print.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp" // Za definicije tipova kao Å¡to je sem_t

// Definicije kodova sistemskih poziva moraju biti usaglaÅ¡ene sa syscall_c.cpp
enum SyscallCode {
    MEM_ALLOC = 0x01,
    MEM_FREE = 0x02,
    THREAD_CREATE = 0x11,
    THREAD_EXIT = 0x12,
    THREAD_DISPATCH = 0x13,
    SEM_OPEN = 0x21,
    SEM_CLOSE = 0x22,
    SEM_WAIT = 0x23,
    SEM_SIGNAL = 0x24
};

void Riscv::popSppSpie() {
    // VraÄ‡a se na adresu saÄuvanu u sepc, menja reÅ¾im i dozvoljava prekide
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}

// promeni potpis:
// riscv.hpp: promeni potpis na:
// static uint64 handleSupervisorTrap();

uint64 Riscv::handleSupervisorTrap() {
    uint64 scause = r_scause();
    uint64 sepc   = r_sepc();

    if (scause == 0x08 || scause == 0x09) { // ecall from U/S
        uint64 code, a1, a2, a3, a4;
        __asm__ volatile("mv %0, a0" : "=r"(code));
        __asm__ volatile("mv %0, a1" : "=r"(a1));
        __asm__ volatile("mv %0, a2" : "=r"(a2));
        __asm__ volatile("mv %0, a3" : "=r"(a3));
        __asm__ volatile("mv %0, a4" : "=r"(a4));

        switch (code) {
            case MEM_ALLOC: {
                void* ret = MemoryAllocator::mem_alloc((size_t)a1);
                __asm__ volatile("mv a0, %0" : : "r"(ret));
                w_sepc(sepc + 4);
                return 0;
            }
            case MEM_FREE: {
                int ret = MemoryAllocator::mem_free((void*)a1);
                __asm__ volatile("mv a0, %0" : : "r"((uint64)ret));
                w_sepc(sepc + 4);
                return 0;
            }
            case THREAD_CREATE: {
                CCB** handle = (CCB**)a1;
                CCB::Body start_routine = (CCB::Body)a2;
                void* arg = (void*)a3;
                *handle = CCB::createCoroutine(start_routine, arg);
                uint64 ret = (*handle) ? 0 : (uint64)-1;
                __asm__ volatile("mv a0, %0" : : "r"(ret));
                w_sepc(sepc + 4);
                return 0;
            }
            case THREAD_DISPATCH: {
                CCB::dispatch();  // promenjen kontekst
                return 1;         // ret
            }
            case THREAD_EXIT: {
                CCB::running->setFinished(true);
                CCB::dispatch();  // promenjen kontekst
                return 1;         // ret
            }
            case SEM_OPEN: {
                sem_t* handle = (sem_t*)a1;
                unsigned init = (unsigned)a2;
                *handle = new _sem(init);
                uint64 ret = (*handle) ? 0 : (uint64)-1;
                __asm__ volatile("mv a0, %0" : : "r"(ret));
                w_sepc(sepc + 4);
                return 0;
            }
            case SEM_CLOSE: {
                sem_t handle = (sem_t)a1;
                if (handle) delete handle;
                __asm__ volatile("li a0, 0");
                w_sepc(sepc + 4);
                return 0;
            }
            case SEM_WAIT: {
                sem_t handle = (sem_t)a1;
                int ret = handle ? handle->wait() : -1;
                __asm__ volatile("mv a0, %0" : : "r"((uint64)ret));
                w_sepc(sepc + 4);
                return 0;
            }
            case SEM_SIGNAL: {
                sem_t handle = (sem_t)a1;
                int ret = handle ? handle->signal() : -1;
                __asm__ volatile("mv a0, %0" : : "r"((uint64)ret));
                w_sepc(sepc + 4);
                return 0;
            }
        }
        // nepoznat ecall:
        w_sepc(sepc + 4);
        return 0;

    } else if (scause == 0x8000000000000001UL) {  // timer/software interrupt
        mc_sip(SIP_SSIP);
        CCB::dispatch();   // promena konteksta
        return 1;          // ret

    } else {
        uint64 stval = r_stval();
        printString("Neocekivani prekid! scause: "); printInteger(scause);
        printString(", sepc: "); printInteger(sepc);
        printString(", stval: "); printInteger(stval); printString("\n");
        w_sepc(sepc + 4);
        return 0;          // sret
    }
}
