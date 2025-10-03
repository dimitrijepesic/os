//
// Created by os on 9/25/25.
//

#ifndef TCB_HPP
#define TCB_HPP

#include "../lib/hw.h"
#include "../h/syscall_c.hpp"
#include "Scheduler.hpp"

class TCB {
public:
    using Body = void (*)(void*);

    static TCB* createThread(Body body, void* arg, uint64* stack);
    static int create_thread_for_syscall(thread_t* handle, Body body, void* arg, uint64* stack);
    static int exit_thread();

    ~TCB();

    bool isFinished() const { return finished; }
    void setFinished(bool val) { finished = val; }

    static void yield();
    static void dispatch();

    struct Context {
        uint64 ra;
        uint64 sp;
    };

    bool isIdle() const;
    void tick();
    bool isTimeSliceUp() const;

    TCB* next = nullptr;
    static TCB *running;
    static TCB *mainThread; // Pokazivač na glavnu (main) nit

private:
    TCB(Body body, void* arg, uint64* stack);

    static void threadWrapper();

    Body body;
    void* arg;
    uint64* stack;
    Context context;
    bool finished;
    uint64 timeSliceCounter;
};

#endif