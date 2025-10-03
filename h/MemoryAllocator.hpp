//
// Created by os on 9/24/25.
//

#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

class MemoryAllocator {
public:

    static void init();
    static void* mem_alloc (size_t size);
    static int mem_free (void* p);

    static uint64 getFreeSpaceBytes();
    static uint64 getLargestFreeBlockBytes();
    static uint64 size_to_blocks(size_t bytes);

    struct memBlock{
        size_t sizeBlocks;
        bool isFree;
        memBlock* next;
        memBlock* prev;
    };

private:

    static memBlock* freeHead;
    static uint64 heapStart;
    static uint64 heapEnd;

    static memBlock* userHeader(void* userPtr);
    static void* headerUser(memBlock* h);
    static void insertSorted(memBlock* blk);
    static void removeFree(memBlock* blk);
    static void split(memBlock* blk, size_t needBlocks);
    static void tryCoalesce(memBlock* blk);
};

#endif //PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP