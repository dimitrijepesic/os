//
// Created by os on 9/30/25.
//

#ifndef PROJECT_BASE_V1_1__SEMAPHORE_HPP
#define PROJECT_BASE_V1_1__SEMAPHORE_HPP

#include "list.hpp"
#include "../lib/hw.h"

class CCB;

class _sem{
public:
    explicit _sem(unsigned init=1);
    ~_sem();

    int wait();
    int signal();

    void* operator new(size_t size);
    void operator delete(void* ptr);

private:

    int val;
    List<CCB> blocked;

    void block();
    void unblock();

};
#endif //PROJECT_BASE_V1_1__SEMAPHORE_HPP
