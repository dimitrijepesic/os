//
// Created by os on 9/25/25.
//

#ifndef TCB_HPP
#define TCB_HPP

#include "../lib/hw.h"
#include "Scheduler.hpp"

class TCB {
public:
    using Body = void (*)(void*);

    static TCB* createThread(Body body, void* arg, uint64* stack);

    ~TCB();

    bool isFinished() const { return finished; }
    void setFinished(bool val) { finished = val; }

    static void yield();
    static void dispatch();

    static TCB *running;

private:
    TCB(Body body, void* arg, uint64* stack);

    static void threadWrapper();

    struct Context {
        uint64 ra;
        uint64 sp;
    };

    Body body;
    void* arg;
    uint64* stack;
    Context context;
    bool finished;
    uint64 timeSliceCounter;
};

#endif