//
// Created by os on 9/26/25.
//

#include "../h/Scheduler.hpp"
#include "../h/TCB.hpp"

List<TCB> Scheduler::readyQueue;

TCB *Scheduler::get() {
    return readyQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyQueue.addLast(tcb);
}