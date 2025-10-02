//
// Created by os on 9/26/25.
//

#ifndef PROJECT_BASE_V1_1_PRINT_HPP
#define PROJECT_BASE_V1_1_PRINT_HPP

#include "../lib/hw.h"

class _sem; // Forward deklaracija

// Deklaracije govore drugim fajlovima da ove promenljive postoje negde
extern _sem* console_mutex;
extern bool scheduler_started;

extern void printString(char const *string);
extern void printInteger(uint64 integer);

#endif //PROJECT_BASE_V1_1_PRINT_HPP
