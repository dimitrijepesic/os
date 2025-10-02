//
// Created by os on 9/26/25.
//

#ifndef SCHEDULER_HPP
#define SCHEDULER_HPP

#include "list.hpp"

class TCB; // Koristimo TCB umesto CCB

class Scheduler {
public:
    static TCB* get();
    static void put(TCB* tcb);

private:
    static List<TCB> readyQueue;
};

#endif