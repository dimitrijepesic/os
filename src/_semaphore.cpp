//
// Created by os on 9/30/25.
//

#include "../h/_semaphore.hpp"
#include "../h/riscv.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"
#include "../h/MemoryAllocator.hpp"

_sem::_sem(unsigned int init) : val(init) {}

_sem::~_sem() {
    while (!blocked.isEmpty()) {
        unblock();
    }
}

int _sem::wait() {
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    if (--val < 0) {
        blocked.addLast(CCB::running);
        CCB::yield();
    }
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    return 0;
}

int _sem::signal() {
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    if (++val <= 0) {
        if (auto* t = blocked.removeFirst()) Scheduler::put(t);
    }
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    return 0;
}


void* _sem::operator new(size_t size) {
    return MemoryAllocator::mem_alloc(size);
}

void _sem::operator delete(void* ptr) {
    MemoryAllocator::mem_free(ptr);
}

void _sem::block() {
    blocked.addLast(CCB::running);
    CCB::yield();
}

void _sem::unblock() {
    if (auto* t = blocked.removeFirst()) {
        Scheduler::put(t);
    }
}