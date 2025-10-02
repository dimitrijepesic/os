#include "../h/riscv.hpp"
#include "../h/TCB.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"
#include "../h/print.hpp"
#include "../h/workers.hpp"

extern "C" void supervisorTrap();

void userMain(void* arg) {
    printString("userMain: Pokrenut u korisnickom rezimu!\n");

    thread_t nitA, nitB;
    thread_create(&nitA, simple_worker, (void*)"A");
    thread_create(&nitB, simple_worker, (void*)"B");

    while (!(nitA->isFinished() && nitB->isFinished())) {
        thread_dispatch();
    }

    printString("userMain: Niti A i B su zavrsile.\n");
}

int main() {
    MemoryAllocator::init();
    Riscv::w_stvec((uint64)&supervisorTrap);

    CCB::mainThread = CCB::createCoroutine(nullptr, nullptr);
    CCB::running = CCB::mainThread;

    // ISPRAVKA JE OVDE:
    // Samo pozivamo funkciju, ne čuvamo povratnu vrednost jer nam ne treba.
    CCB::createCoroutine(userMain, nullptr);

    printString("System initialized. Switching to user mode...\n\n");

    // Eksplicitan prelazak u korisnički režim
    Riscv::w_sepc((uint64)&CCB::dispatch);
    Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    __asm__ volatile("sret");

    return 0; // Ovaj deo koda se nikada ne izvršava
}