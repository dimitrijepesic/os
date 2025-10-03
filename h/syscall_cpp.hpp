#pragma once
#include "syscall_c.hpp"
#include "../h/print.hpp"

// Minimalni Thread API (LEVEL 2) – bez semafora/sleep
class Thread {
public:
    using Body = void (*)(void*);

    Thread(Body body, void* arg) : body_(body), arg_(arg), started_(false) {}
    virtual ~Thread() {}

    int start() {
        if (started_) return 0;
        started_ = true;
        return thread_create(&handle_, body_ ? body_ : &Thread::trampoline, this);
    }

    static void dispatch() { thread_dispatch(); }
    static int  sleep(time_t) { return 0; } // stub za kasnije

protected:
    Thread() : body_(nullptr), arg_(nullptr), started_(false) {}
    virtual void run() {}

private:
    static void trampoline(void* p) {
        Thread* self = static_cast<Thread*>(p);
        self->run();
        thread_exit();
    }

    Body     body_;
    void*    arg_;
    thread_t handle_ = nullptr;
    bool     started_;
};
