//
// Created by os on 9/26/25.
//

#include "../h/Scheduler.hpp"

List<CCB> Scheduler::readyCoroutineQueue;

CCB *Scheduler::get() {
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(CCB *tren) {
    readyCoroutineQueue.addLast(tren);
}
