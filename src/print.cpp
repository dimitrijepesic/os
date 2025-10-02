//
// Created by os on 9/26/25.
//

// src/print.cpp

#include "../h/print.hpp"
#include "../h/_semaphore.hpp"
#include "../lib/console.h"

extern _sem* console_mutex;
extern bool scheduler_started;

void printString(const char *string) {
    if (scheduler_started && console_mutex) {
        console_mutex->wait();
    }
    while (*string != '\0') {
        __putc(*string);
        string++;
    }
    if (scheduler_started && console_mutex) {
        console_mutex->signal();
    }
}

void printInteger(uint64 integer) {
    static char digits[] = "0123456789";
    char buf[21];
    int i = sizeof(buf) - 1;
    buf[i] = '\0';

    if (integer == 0) {
        buf[--i] = '0';
    } else {
        do {
            buf[--i] = digits[integer % 10];
            integer /= 10;
        } while (integer != 0);
    }

    // Pozivamo printString koji će se pobrinuti za zaključavanje.
    // Nema __putc, wait, ili signal poziva ovde!
    printString(&buf[i]);
}