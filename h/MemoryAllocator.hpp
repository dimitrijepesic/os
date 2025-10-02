//
// Created by os on 9/24/25.
//

#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

class MemoryAllocator {
public:
    // --- Glavni javni interfejs ---
    static void init();
    static void* mem_alloc (size_t size);
    static int mem_free (void* p);

    // --- Dodatne javne funkcije prema specifikaciji ---
    static uint64 getFreeSpaceBytes();
    static uint64 getLargestFreeBlockBytes();
    static uint64 sizeToBlocks(size_t bytes);

    // Header (zaglavlje) svakog segmenta u heap-u
    struct memBlock{
        size_t sizeBlocks;
        bool isFree;
        memBlock* next;
        memBlock* prev;
    };

private:

    // Statički podaci
    static memBlock* freeHead;
    static uint64 heapStart;
    static uint64 heapEnd;

    // Pomoćne (helper) funkcije
    static memBlock* userHeader(void* userPtr);
    static void* headerUser(memBlock* h);
    static void insertSorted(memBlock* blk);
    static void removeFree(memBlock* blk);
    static void split(memBlock* blk, size_t needBlocks);
    static void tryCoalesce(memBlock* blk);
};


#endif //PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
