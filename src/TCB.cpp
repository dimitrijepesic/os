#include "../h/TCB.hpp"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"

TCB* TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

void* TCB::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc(sz);
}
void TCB::operator delete(void* ptr) {
    if (ptr) MemoryAllocator::mem_free(ptr);
}

TCB::TCB(Body body, uint64 timeSlice)
        : body(body),
          stack(nullptr),
          context{ (uint64)&threadWrapper, 0 }, // <- ovo stavlja RA čak i za main
          timeSlice(timeSlice),
          finished(false)
{
    if (body != nullptr) {
        stack = (uint64*) MemoryAllocator::mem_alloc(STACK_SIZE * sizeof(uint64));
        uint64 spRaw = (uint64)&stack[STACK_SIZE];
        context.sp = align16(spRaw);
    } else {
        context.sp = 0;
    }
    if (body != nullptr) Scheduler::put(this);
}


TCB::~TCB() {
    if (stack) {
        MemoryAllocator::mem_free(stack);
        stack = nullptr;
    }
}

TCB* TCB::createThread(Body body) {
    return new TCB(body, TIME_SLICE);
}

void TCB::yield() {
    // jednostavno uđi u trap; OS trap handler treba da pozove TCB::dispatch()
    __asm__ volatile("ecall");
}

void TCB::dispatch() {
    TCB* old = running;

    if (!old || old->isFinished()) {
        // ne vraćaj završenu nit u ready
    } else {
        // vrati prethodnu nit u ready (round-robin)
        Scheduler::put(old);
    }

    running = Scheduler::get();   // uzmi sledeću spremnu nit

    // promenu konteksta obavi uvek (bez uslovljavanja)
    TCB::contextSwitch(old ? &old->context : nullptr, &running->context);
}

void TCB::threadWrapper() {
    // Prebaci se u privilegioni mod zadat SPP bitom i nastavi posle sret
    Riscv::popSppSpie();

    // izvrši telo niti
    if (running && running->body) {
        running->body();
    }

    // označi završetak i prepusti CPU
    if (running) running->setFinished(true);

    // idi u trap; handler će pozvati dispatch i prebaciti se na sledeću nit
    __asm__ volatile("ecall");

    // ne bi trebalo da se ikad vrati ovde
    while (1) { /* halt */ }
}
