// U fajlu: src/main.cpp

#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"
#include "../h/print.hpp" // Uključen header za ispis

extern "C" void supervisorTrap();

// Telo testne korisničke niti
void workerBody(void* arg) {
    int id = (int)(uint64)arg;
    for (int i = 0; i < 3; i++) {
        printString("Thread ");
        printInteger(id);
        printString(" starts loop ");
        printInteger(i);
        printString("\n");

        thread_dispatch(); // Prepusti procesor drugoj niti

        printString("Thread ");
        printInteger(id);
        printString(" ends loop ");
        printInteger(i);
        printString("\n");
    }
    printString("Thread ");
    printInteger(id);
    printString(" finished.\n");
}

// Glavna korisnička funkcija
void userMain() {
    printString("userMain: Started.\n");

    thread_t thread1, thread2;

    printString("userMain: Creating thread 1...\n");
    thread_create(&thread1, workerBody, (void*)1);

    printString("userMain: Creating thread 2...\n");
    thread_create(&thread2, workerBody, (void*)2);

    printString("userMain: All threads created. Entering dispatch loop.\n");

    // Jednostavna petlja koja čeka da se niti završe
    while (!(thread1->isFinished() && thread2->isFinished())) {
        printString("userMain: dispatching...\n");
        thread_dispatch();
    }

    printString("--- THREADING TEST FINISHED ---\n");
}

int main() {
    printString("main: Started.\n");

    MemoryAllocator::init();
    Scheduler::init();
    printString("main: Memory allocator and scheduler initialized.\n");

    Riscv::w_stvec((uint64)&supervisorTrap);
    printString("main: Trap vector set.\n");

    // Kreiramo TCB za main nit, ali je NE stavljamo u scheduler (jer body=nullptr)
    TCB::mainThread = TCB::createThread(nullptr, nullptr, nullptr);
    TCB::running = TCB::mainThread;
    printString("main: Main thread TCB created.\n");

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    printString("main: Supervisor interrupts enabled.\n");

    printString("main: Starting userMain...\n");
    userMain();

    printString("main: userMain finished. Halting.\n");

    // Čekaj da se sve završi pre gašenja
    while(true);

    return 0;
}