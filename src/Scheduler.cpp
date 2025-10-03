//
// Created by os on 9/26/25.
//

#include "../h/Scheduler.hpp"
#include "../h/TCB.hpp"

List<TCB> Scheduler::readyThreadQueue;

TCB *Scheduler::get()
{
    return readyThreadQueue.removeFirst();
}

void Scheduler::put(TCB *ccb)
{
    readyThreadQueue.addLast(ccb);
}