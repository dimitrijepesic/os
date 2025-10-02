//
// Created by os on 9/26/25.
//

#include "../h/ccb.hpp"
#include "../h/riscv.hpp"
#include "../h/Scheduler.hpp"
#include "../h/syscall_c.hpp"

CCB *CCB::running = nullptr;
CCB* CCB::mainThread = nullptr;

void CCB::yield() {
    thread_dispatch();
}

void CCB::dispatch() {
    CCB *old = running;
    if (old != CCB::mainThread && !old->isFinished()) {
        Scheduler::put(old);
    }

    running = Scheduler::get();
    if (!running) running = CCB::mainThread;

    if (old != running) {
        contextSwitch(old->getContext(), running->getContext());
    }
}

CCB* CCB::createCoroutine(Body body, void* arg) {
    CCB* ccb = new CCB(body, arg);
    if (ccb && body) {
        Scheduler::put(ccb);
    }
    return ccb;
}

void CCB::coroutineWrapper() {
    // Uključi prekide, nastavi normalno
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    if (running->body) {
        running->body(running->arg);
    }

    running->setFinished(true);
    thread_exit(); // ne vraća se
}

