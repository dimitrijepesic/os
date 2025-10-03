//
// Created by os on 9/26/25.
//

#include "../h/Scheduler.hpp"
#include "../h/TCB.hpp"

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;

void Scheduler::init() {
    head = tail = nullptr;
}

TCB* Scheduler::get() {
    if (!head) { return nullptr; } // Red je prazan

    TCB* tcb = head;
    head = head->next;
    if (!head) { tail = nullptr; } // Red je sada postao prazan

    tcb->next = nullptr; // Očisti pokazivač niti koja je izvađena
    return tcb;
}

void Scheduler::put(TCB* tcb) {
    if (!tcb) { return; } // Ignoriši nullptr

    tcb->next = nullptr;
    if (tail) {
        tail->next = tcb;
        tail = tcb;
    } else {
        head = tail = tcb;
    }
}
