#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"
#include "../h/TCB.hpp"
#include "../h/print.hpp"

// povuci test-harness (ili ga linkuj posebno)
#include "../test/userMain.cpp"

int main() {
    MemoryAllocator::init();
    Riscv::w_stvec((uint64)&Riscv::supervisorTrap);

    // main/idle TCB bez body-ja (da prvi contextSwitch ima validan 'old')
    TCB::running = TCB::createThread(nullptr);

    userMain();

    printString("Kernel finished\n");
    return 0;
}
