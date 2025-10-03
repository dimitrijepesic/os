#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"

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
    TCB* t = TCB::createThread((TCB::Body)start_routine, arg);
    if (!t) return -2;
    *handle = wrap(t);
    return (*handle ? 0 : -3);
}

int thread_exit() {
    if (!TCB::running) return -1;
    TCB::running->setFinished(true);
    // predaj CPU sledecoj niti (ne vraca se realno ovde)
    TCB::dispatch();
    return 0;
}

void thread_dispatch() {
    TCB::dispatch();
}
