#include "../h/TCB.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/print.hpp"

TCB *TCB::running = nullptr;
TCB* TCB::mainThread = nullptr;

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

// U fajlu: src/TCB.cpp
// ZAMENI CELU dispatch FUNKCIJU SA OVOM

void TCB::dispatch() {
    TCB *old = running;
    if (!old->isFinished()) {
        Scheduler::put(old);
    }

    running = Scheduler::get();

    // SIGURNOSNA PROVERA: Šta ako je scheduler prazan?
    if (running == nullptr) {
        // Nema spremnih niti. Vrati 'main' nit da vrti 'while' petlju
        // ili, ako i ona završi, preuzmi 'idle' nit (ako postoji).
        // Za sada, samo ćemo se vratiti na glavnu nit.
        running = TCB::mainThread;
    }

    // Ako se desi da je jedina preostala nit ona koja se upravo završava,
    // a scheduler je prazan, desiće se promena konteksta sa niti na samu sebe.
    // Ovo je bezbedno.
    if (old == running && old->isFinished()) {
        printString("FATAL: Last active thread has finished and there is nothing else to schedule. Halting.\n");
        // U pravom OS-u, ovde bi se sistem ugasio. Za sada, stajemo.
        while(true);
    }

    Riscv::context_switch(&old->context, &running->context);
}

// U fajlu: src/TCB.cpp
// ZAMENI OBE FUNKCIJE SA OVIM KODOM

void TCB::threadWrapper() {
    // Prebaci procesor u korisnički režim
    Riscv::popSppSpie();

    // Izvrši telo niti
    running->body(running->arg);

    // Kada se telo niti završi, pozovi sistemski poziv za gašenje niti (kod 0x12)
    // Ovaj sistemski poziv se NIKADA ne vraća.
    __asm__ volatile ("li a0, 0x12"); // thread_exit kod
    __asm__ volatile ("ecall");
}

void TCB::yield() {
    // Sistemski poziv za eksplicitnu promenu konteksta (kod 0x13)
    __asm__ volatile ("li a0, 0x13"); // thread_dispatch kod
    __asm__ volatile ("ecall");
}

int TCB::create_thread_for_syscall(thread_t* handle, Body body, void* arg, uint64* stack) {
    // 1. Zovemo tvoju postojeću, odličnu factory metodu.
    TCB* new_tcb = createThread(body, arg, stack);

    // 2. Prevodimo rezultat u int (0 ili -1) kako ABI zahteva.
    if (!new_tcb) { return -1; }

    // 3. Radimo sa 'handle'-om, što je takođe deo ABI-ja.
    if (handle) { *handle = new_tcb; }

    return 0; // Vraćamo 0 za uspeh.
}

// Ova funkcija je ulazna tačka za 'thread_exit' sistemski poziv.
int TCB::exit_thread() {
    // Provera da ne gasimo glavnu ili idle nit.
    if (!running || running->body == nullptr) { return -1; }

    // 1. Postavljamo flag da je nit gotova.
    running->setFinished(true);

    // 2. Pozivamo tvoju postojeću dispatch metodu koja će naći novu nit.
    TCB::dispatch();

    return 0; // Ova linija se nikad ne izvrši, ali mora da postoji.
}

// Proverava da li je nit "besposlena" (nema telo funkcije).
bool TCB::isIdle() const {
    return body == nullptr;
}

// Smanjuje brojač vremenskog odsečka za jedan.
void TCB::tick() {
    if (timeSliceCounter > 0) {
        timeSliceCounter--;
    }
}

// Proverava da li je vremenski odsečak istekao.
bool TCB::isTimeSliceUp() const {
    return timeSliceCounter == 0;
}