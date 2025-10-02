//
// Created by os on 9/26/25.
//

#ifndef PROJECT_BASE_V1_1_SCHEDULER_HPP
#define PROJECT_BASE_V1_1_SCHEDULER_HPP

#include "../h/list.hpp"

class CCB;

class Scheduler {
public:
    static CCB* get();
    static void put(CCB *tren);

private:
    static List<CCB> readyCoroutineQueue;
};

#endif //PROJECT_BASE_V1_1_SCHEDULER_HPP
