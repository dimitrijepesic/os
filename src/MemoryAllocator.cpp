//
// Created by os on 9/24/25.
//

#include "../h/MemoryAllocator.hpp"

size_t MemoryAllocator::size_to_blocks(size_t bytes) {
    if (bytes == 0) return 0;
    return (bytes + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
}

void* MemoryAllocator::headerUser(memBlock* h) {
    if (!h) return nullptr;
    size_t hdrBytes = size_to_blocks(sizeof(memBlock)) * MEM_BLOCK_SIZE;
    return (void*)((char*)h + hdrBytes);
}
MemoryAllocator::memBlock* MemoryAllocator::userHeader(void* userPtr) {
    size_t hdrBytes = size_to_blocks(sizeof(memBlock)) * MEM_BLOCK_SIZE;
    return (memBlock*)((char*)userPtr - hdrBytes);
}

MemoryAllocator::memBlock* MemoryAllocator::freeHead = nullptr;
uint64 MemoryAllocator::heapStart = 0;
uint64 MemoryAllocator::heapEnd = 0;

const size_t HEADER_IN_BLOCKS =
        MemoryAllocator::size_to_blocks(sizeof(MemoryAllocator::memBlock));

void MemoryAllocator::init() {
    heapStart = ((uint64)HEAP_START_ADDR + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE * MEM_BLOCK_SIZE;
    heapEnd   =  (uint64)HEAP_END_ADDR / MEM_BLOCK_SIZE * MEM_BLOCK_SIZE;

    if (heapEnd <= heapStart) { freeHead = nullptr; return; }

    freeHead = (memBlock*) heapStart;
    freeHead->isFree = true;
    freeHead->prev = nullptr;
    freeHead->next = nullptr;

    size_t totalBlocks = (heapEnd - heapStart) / MEM_BLOCK_SIZE;

    if (totalBlocks <= HEADER_IN_BLOCKS) { freeHead = nullptr; return; }

    freeHead->sizeBlocks = totalBlocks - HEADER_IN_BLOCKS;
}

void* MemoryAllocator::mem_alloc(size_t size) {
    if (!freeHead || size == 0) return nullptr;

    size_t needBlocks = size_to_blocks(size);

    for (memBlock* it = freeHead; it; it = it->next) {
        if (it->sizeBlocks >= needBlocks) {
            removeFree(it);
            split(it, needBlocks);
            it->isFree = false;
            return headerUser(it);
        }
    }
    return nullptr;
}

int MemoryAllocator::mem_free(void* addr) {
    if (!addr) return -1;

    memBlock* blk = userHeader(addr);

    if ((uint64)blk < heapStart || (uint64)blk >= heapEnd) return -2;
    if (blk->isFree) return -3;

    insertSorted(blk);

    tryCoalesce(blk->prev ? blk->prev : blk);

    return 0;
}

void MemoryAllocator::insertSorted(memBlock* blk) {
    blk->isFree = true;

    if (!freeHead || blk < freeHead) {
        blk->next = freeHead;
        blk->prev = nullptr;
        if (freeHead) freeHead->prev = blk;
        freeHead = blk;
    } else {
        memBlock* cur = freeHead;
        while (cur->next && cur->next < blk) cur = cur->next;

        blk->next = cur->next;
        if (cur->next) cur->next->prev = blk;
        cur->next = blk;
        blk->prev = cur;
    }
}

void MemoryAllocator::removeFree(memBlock* blk) {
    if (blk->prev) blk->prev->next = blk->next;
    else freeHead = blk->next;
    if (blk->next) blk->next->prev = blk->prev;

    blk->prev = blk->next = nullptr;
}

void MemoryAllocator::split(memBlock* blk, size_t needBlocks) {
    if (!blk) return;

    size_t remainingPayloadBlocks = blk->sizeBlocks - needBlocks;

    if (remainingPayloadBlocks >= HEADER_IN_BLOCKS + 1) {
        blk->sizeBlocks = needBlocks;

        auto* right = (memBlock*)((char*)headerUser(blk) + needBlocks * MEM_BLOCK_SIZE);

        right->sizeBlocks = remainingPayloadBlocks - HEADER_IN_BLOCKS;
        right->isFree = true;
        right->prev = right->next = nullptr;

        insertSorted(right);
    }
}

void MemoryAllocator::tryCoalesce(memBlock* blk) {
    if (!blk) return;

    bool merged = true;
    while (merged) {
        merged = false;

        if (blk->next &&
            (char*)headerUser(blk) + blk->sizeBlocks * MEM_BLOCK_SIZE == (char*)blk->next) {

            blk->sizeBlocks += blk->next->sizeBlocks + HEADER_IN_BLOCKS;

            blk->next = blk->next->next;
            if (blk->next) blk->next->prev = blk;

            merged = true;
        }

        if (blk->prev &&
            (char*)headerUser(blk->prev) + blk->prev->sizeBlocks * MEM_BLOCK_SIZE == (char*)blk) {

            blk->prev->sizeBlocks += blk->sizeBlocks + HEADER_IN_BLOCKS;

            blk->prev->next = blk->next;
            if (blk->next) blk->next->prev = blk->prev;

            blk = blk->prev; 
            merged = true;
        }
    }
}

uint64 MemoryAllocator::getFreeSpaceBytes() {
    uint64 totalBlocks = 0;
    for (memBlock* it = freeHead; it; it = it->next) {
        totalBlocks += it->sizeBlocks + HEADER_IN_BLOCKS; // payload + header svakog slobodnog bloka
    }
    return totalBlocks * MEM_BLOCK_SIZE;
}

uint64 MemoryAllocator::getLargestFreeBlockBytes() {
    uint64 maxBlocks = 0;
    for (memBlock* it = freeHead; it; it = it->next) {
        if (it->sizeBlocks > maxBlocks) maxBlocks = it->sizeBlocks;
    }
    return (maxBlocks + HEADER_IN_BLOCKS) * MEM_BLOCK_SIZE;
}
