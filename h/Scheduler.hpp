//
// Created by os on 9/26/25.
//

#ifndef SCHEDULER_HPP
#define SCHEDULER_HPP

#include "list.hpp"

class TCB;

class Scheduler {
public:
    static void init();
    static TCB* get();
    static void put(TCB* tcb);

private:
    static TCB* head;
    static TCB* tail;
};

#endif