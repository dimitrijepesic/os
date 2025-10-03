//
// Created by os on 9/26/25.
//

// src/print.cpp

#include "../h/print.hpp"
#include "../lib/console.h"


void printStr(const char *string) {
    while (*string != '\0') {
        __putc(*string);
        string++;
    }
}

void printInt(uint64 integer) {
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
    printStr(&buf[i]);
}