#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"

/* --- Trampolina (pošto TCB::Body nema argumente) --- */
/* Čuvamo mapu TCB* -> {fn,arg} da bi start_routine dobio svoj argument. */
struct StartThunk {
    void (*fn)(void*);
    void*  arg;
    TCB*   tcb;
    StartThunk* next;
};
static StartThunk* g_thunks = nullptr;

static void thunk_register(TCB* tcb, void (*fn)(void*), void* arg) {
    StartThunk* n = (StartThunk*)MemoryAllocator::mem_alloc(sizeof(StartThunk));
    if (!n) return;
    n->fn = fn; n->arg = arg; n->tcb = tcb;
    n->next = g_thunks; g_thunks = n;
}
static StartThunk* thunk_take(TCB* tcb) {
    StartThunk *prev = nullptr, *p = g_thunks;
    while (p) {
        if (p->tcb == tcb) {
            if (prev) prev->next = p->next; else g_thunks = p->next;
            return p;
        }
        prev = p; p = p->next;
    }
    return nullptr;
}

static void thread_trampoline_noarg() {
    StartThunk* th = thunk_take(TCB::running);
    if (th && th->fn) {
        th->fn(th->arg);
        MemoryAllocator::mem_free(th);
    }
    thread_exit(); // ne vraća se realno
}

/* --- C API --- */

struct _thread { TCB* tcb; };

static _thread* wrap(TCB* t) {
    if (!t) return nullptr;
    _thread* w = (_thread*)MemoryAllocator::mem_alloc(sizeof(_thread));
    if (!w) return nullptr;
    w->tcb = t;
    return w;
}

int thread_create(thread_t* handle, void (*start_routine)(void*), void* arg) {
    if (!handle || !start_routine) return -1;

    // 1) kreiraj TCB sa trampolinom (nema argumenata)
    TCB* t = TCB::createThread((TCB::Body)thread_trampoline_noarg);
    if (!t) return -2;

    // 2) uveži stvarnu funkciju i argument
    thunk_register(t, start_routine, arg);

    // 3) vrati handle
    *handle = wrap(t);
    return (*handle ? 0 : -3);
}

int thread_exit() {
    if (!TCB::running) return -1;
    TCB::running->setFinished(true);
    TCB::dispatch();
    return 0;
}

void thread_dispatch() {
    TCB::dispatch();
}
