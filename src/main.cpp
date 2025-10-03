#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"
#include "../h/TCB.hpp"
#include "../h/print.hpp"

// userMain je u test/userMain.cpp i linkuje se kao objekat
void userMain();

int main() {
    MemoryAllocator::init();

    // Trap vektor (ASM handler)
    Riscv::w_stvec((uint64)&Riscv::supervisorTrap);

    // Bootstrap: postavi validan 'running' (main/idle) pre prvog dispatch-a
    TCB::running = TCB::createThread(nullptr);

    // Pokreni javni test (userMain pita za [1-7])
    userMain();

    printStr("Kernel finished\n");
    return 0;
}
