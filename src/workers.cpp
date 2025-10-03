//
// Created by marko on 20.4.22..
//

#include "../lib/hw.h"
#include "../h/TCB.hpp"
#include "../h/print.hpp"

void workerBodyA()
{
    for (uint64 i = 0; i < 10; i++)
    {
        printStr("A: i=");
        printInt(i);
        printStr("\n");
        for (uint64 j = 0; j < 10000; j++)
        {
            for (uint64 k = 0; k < 30000; k++)
            {
                // busy wait
            }
//            TCB::yield();
        }
    }
}

void workerBodyB()
{
    for (uint64 i = 0; i < 16; i++)
    {
        printStr("B: i=");
        printInt(i);
        printStr("\n");
        for (uint64 j = 0; j < 10000; j++)
        {
            for (uint64 k = 0; k < 30000; k++)
            {
                // busy wait
            }
//            TCB::yield();
        }
    }
}

static uint64 fibonacci(uint64 n)
{
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { TCB::yield(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyC()
{
    uint8 i = 0;
    for (; i < 3; i++)
    {
        printStr("C: i=");
        printInt(i);
        printStr("\n");
    }

    printStr("C: yield\n");
    __asm__ ("li t1, 7");
    TCB::yield();

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));

    printStr("C: t1=");
    printInt(t1);
    printStr("\n");

    uint64 result = fibonacci(12);
    printStr("C: fibonaci=");
    printInt(result);
    printStr("\n");

    for (; i < 6; i++)
    {
        printStr("C: i=");
        printInt(i);
        printStr("\n");
    }
//    TCB::yield();
}

void workerBodyD()
{
    uint8 i = 10;
    for (; i < 13; i++)
    {
        printStr("D: i=");
        printInt(i);
        printStr("\n");
    }

    printStr("D: yield\n");
    __asm__ ("li t1, 5");
    TCB::yield();

    uint64 result = fibonacci(16);
    printStr("D: fibonaci=");
    printInt(result);
    printStr("\n");

    for (; i < 16; i++)
    {
        printStr("D: i=");
        printInt(i);
        printStr("\n");
    }
//    TCB::yield();
}