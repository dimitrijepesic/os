// h/MemoryAllocator.hpp

#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

class MemoryAllocator {
public:
    static void init();
    static void* mem_alloc (size_t size);
    static int mem_free (void* p);

    // Header of each segment in the heap
    struct memBlock{
        size_t sizeBlocks;
        bool isFree;
        memBlock* next = nullptr;
        memBlock* prev = nullptr;
    };

    static size_t sizeToBlocks(size_t bytes);

private:
    static memBlock* freeHead;
    static uint64 heapStart;
    static uint64 heapEnd;

    // Helper functions
    static memBlock* userHeader(void* userPtr);
    static void* headerUser(memBlock* h);
    static void insertSorted(memBlock* blk);
    static void removeFree(memBlock* blk);
    static void split(memBlock* blk, uint64 needBlocks);
    static void tryCoalesce(memBlock* blk);
};

#endif //PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP