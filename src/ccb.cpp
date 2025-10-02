//
// Created by os on 9/26/25.
//

#ifndef PROJECT_BASE_V1_1_CCB_HPP
#define PROJECT_BASE_V1_1_CCB_HPP

#include "../lib/hw.h"
#include "Scheduler.hpp"

class CCB {
public:

    ~CCB() {delete[] stack;}

    bool isFinished() const { return finished; }

    void setFinished(bool finished) {
        CCB::finished = finished;
    }

    using Body = void(*)(void*);

    static CCB *createCoroutine(Body body, void* arg);


    static void yield();

    static CCB *running;
    static CCB* mainThread;

    static void dispatch();

    time_t getSleepTime() const { return sleepTime; }

    void setSleepTime(time_t time) { sleepTime = time; }

    struct Context
    {
        uint64 ra; // Return address
        uint64 sp; // Stack pointer
    };
    static void contextSwitch(Context *oldContext, Context *runningContext);

    Context* getContext() { return &context; }

private:

    time_t sleepTime = 0;

    static void coroutineWrapper();

    explicit CCB(Body body, void* arg) :
            body(body),
            arg(arg),
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
            context({
                            body != nullptr ? (uint64)&coroutineWrapper : 0,
                            stack != nullptr ? (uint64)&stack[STACK_SIZE] : 0
                    }),
            finished(false)
    {
        if (body != nullptr) Scheduler::put(this);
    }

    Body body;
    void* arg;
    uint64 *stack;
    Context context;
    bool finished;

    static uint64 constexpr STACK_SIZE = 1024;
};


#endif //PROJECT_BASE_V1_1_CCB_HPP
