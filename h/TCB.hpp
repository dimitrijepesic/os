#ifndef TCB_HPP
#define TCB_HPP

#include "../lib/hw.h"
#include "Scheduler.hpp"

class TCB {
public:
    using Body = void (*)();   // bez argumenata (ostaje kako je u tvom ASM setupu)

    struct Context {
        uint64 ra;   // return address
        uint64 sp;   // stack pointer
    };

    ~TCB();

    bool   isFinished() const { return finished; }
    void   setFinished(bool v) { finished = v; }

    uint64 getTimeSlice() const { return timeSlice; }

    static TCB*  createThread(Body body);      // body==nullptr => “main/idle” TCB
    static void  yield();                      // ecall
    static void  dispatch();                   // poziva ASM contextSwitch
    static void  contextSwitch(Context* oldC, Context* newC);

    static TCB*  running;
    static uint64 timeSliceCounter;

private:
    explicit TCB(Body body, uint64 timeSlice);

    static void threadWrapper();

    static inline uint64 align16(uint64 x) { return x & ~((uint64)0xFUL); }

    Body    body;
    uint64* stack;
    Context context;
    uint64  timeSlice;
    bool    finished;

    static constexpr uint64 STACK_SIZE = 1024;
    static constexpr uint64 TIME_SLICE = 2;

public:
    void* operator new(size_t sz);
    void  operator delete(void* ptr);
};

#endif // TCB_HPP
