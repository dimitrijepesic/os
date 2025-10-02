#include "../h/TCB.hpp"
#include "../h/riscv.hpp"

TCB *TCB::running = nullptr;

TCB *TCB::createThread(Body body, void *arg, uint64 *stack) {
    return new TCB(body, arg, stack);
}

TCB::TCB(Body body, void *arg, uint64* stack) :
        body(body),
        arg(arg),
        stack(stack),
        context({(uint64) &threadWrapper,
                 stack ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
                }),
        finished(false),
        timeSliceCounter(DEFAULT_TIME_SLICE)
{
    if (body != nullptr) {
        Scheduler::put(this);
    }
}

TCB::~TCB() {
    delete[] stack;
}

void TCB::dispatch() {
    TCB *old = running;
    if (!old->isFinished()) {
        Scheduler::put(old);
    }
    running = Scheduler::get();

    Riscv::context_switch(&old->context, &running->context);
}

void TCB::threadWrapper() {
    Riscv::popSppSpie();
    running->body(running->arg);
    running->setFinished(true);
    TCB::yield();
}

void TCB::yield() {
    __asm__ volatile("ecall");
}