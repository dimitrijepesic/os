// fajl: src/workers.cpp

#include "../h/workers.hpp"
#include "../h/print.hpp"
#include "../h/syscall_c.hpp"

void simple_worker(void* arg) {
    char id[2];
    id[0] = *((char*)arg);
    id[1] = '\0';

    for (int i = 0; i < 5; i++) {
        printString("Nit ");
        printString(id);
        printString(": ");
        printInteger(i);
        printString("\n");
        thread_dispatch();
    }

    printString("Nit ");
    printString(id);
    printString(" je zavrsila.\n");
}