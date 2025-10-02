// main.cpp

// main.cpp

#include "../h/print.hpp"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/ccb.hpp"
#include "../h/_semaphore.hpp"

volatile int shared_data = 0;

// Kernel objekti (direktno, ne C API handle-ovi)
_sem* mutex = nullptr;
_sem* console_mutex = nullptr;
bool scheduler_started = false;

static void idle_thread_body(void*) {
    while (true) {
        CCB::yield();
    }
}

static void worker_body(void* arg) {
    int limit = *((int*)arg);
    for (int i = 0; i < limit; i++) {
        mutex->wait();
        shared_data++;
        mutex->signal();
    }
}

static void worker_body_dec(void* arg) {
    int limit = *((int*)arg);
    for (int i = 0; i < limit; i++) {
        mutex->wait();
        shared_data--;
        mutex->signal();
    }
}

int main() {
    // 1) Heap/allocator
    MemoryAllocator::init();

    // 2) Postavi trap vektor
    Riscv::w_stvec((uint64)&supervisorTrap);

    printString("Kernel initialized.\n");

    // 3) Kreiraj konzolni mutex pre bilo kog ispisa pod schedulerom
    console_mutex = new _sem(1);

    // 4) Kreiraj i registruj main/idle nit pre uključivanja prekida
    CCB* main_thread = CCB::createCoroutine(idle_thread_body, nullptr);
    CCB::running    = main_thread;
    CCB::mainThread = main_thread;
    Scheduler::put(main_thread);

    // 5) Tek sada uključi prekide (ima valjana running nit i scheduler)
    Riscv::mc_sie(Riscv::SIE_SEIE);
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    printString("Main thread and console mutex created.\n");
    printString("Starting semaphore test...\n");

    // 6) Test mutex i radne niti
    mutex = new _sem(1);

    int loops = 10; // slobodno menjaš
    CCB *thread1 = CCB::createCoroutine(worker_body, &loops);
    printString("Thread 1 (inc) created.\n");

    CCB *thread2 = CCB::createCoroutine(worker_body, &loops);
    printString("Thread 2 (inc) created.\n");

    CCB *thread3 = CCB::createCoroutine(worker_body_dec, &loops);
    printString("Thread 3 (dec) created.\n");

    CCB *thread4 = CCB::createCoroutine(worker_body_dec, &loops);
    printString("Thread 4 (dec) created.\n");

    printString("Main thread yielding to workers...\n");

    scheduler_started = true;

    // 7) Čekaj završetak svih niti (ne briši ih u dispatch-u!)
    while (!thread1->isFinished() || !thread2->isFinished()
           || !thread3->isFinished() || !thread4->isFinished()) {
        CCB::yield();
    }

    printString("All threads finished.\n");

    printString("Final value of shared_data: ");
    printInteger(shared_data);
    printString("\n");

    if (shared_data == 0) {
        printString("SUCCESS: Race condition avoided!\n");
    } else {
        printString("ERROR: Race condition detected!\n");
    }

    // 8) Bezbedno čišćenje: prvo obriši niti (glavna ih više ne dereferencira)
    delete thread1;
    delete thread2;
    delete thread3;
    delete thread4;

    // 9) Završi sa ispisima PRE brisanja console_mutex-a
    printString("Main finished.\n");

    // Ako želiš, možeš ugasiti “console locking”
    scheduler_started = false;

    // 10) Sad je bezbedno obrisati semafore
    delete mutex;
    delete console_mutex;

    // (opcionalno) isključi prekide pre izlaska iz main-a
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
}