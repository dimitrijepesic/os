// U fajlu: src/main.cpp

#include "../h/TCB.hpp"
#include "../h/workers.hpp"
#include "../h/print.hpp"
#include "../h/riscv.hpp"

int main()
{
    TCB *threads[5];

    threads[0] = TCB::createThread(nullptr,nullptr);
    TCB::running = threads[0];

    threads[1] = TCB::createThread(workerBodyA,nullptr);
    printString("ThreadA created\n");
    threads[2] = TCB::createThread(workerBodyB,nullptr);
    printString("ThreadB created\n");
    threads[3] = TCB::createThread(workerBodyC,nullptr);
    printString("ThreadC created\n");
    threads[4] = TCB::createThread(workerBodyD,nullptr);
    printString("ThreadD created\n");

    Riscv::w_stvec((uint64) &supervisorTrap);
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    while (!(threads[1]->isFinished() &&
             threads[2]->isFinished() &&
             threads[3]->isFinished() &&
             threads[4]->isFinished()))
    {
        TCB::yield();
    }

    for (auto &thread: threads)
    {
        delete thread;
    }
    printString("Finished\n");

    return 0;
}
