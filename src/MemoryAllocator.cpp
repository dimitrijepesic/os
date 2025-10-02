//
// Created by os on 9/24/25.
//

#include "../h/MemoryAllocator.hpp"
#include "../lib/hw.h"
#include "../h/print.hpp" // OBAVEZNO uključi print.hpp da bi radili ispisi

// Statički članovi klase
MemoryAllocator::memBlock* MemoryAllocator::freeHead = nullptr;
uint64 MemoryAllocator::heapStart = 0;
uint64 MemoryAllocator::heapEnd = 0;
const size_t HEADER_BLOCKS = MemoryAllocator::sizeToBlocks(sizeof(MemoryAllocator::memBlock));

// Inicijalizuje alokator memorije
void MemoryAllocator::init() {
    printString("--> MA::init() started.\n");
    uint64 start = (uint64)HEAP_START_ADDR;
    uint64 end   = (uint64)HEAP_END_ADDR;

    // Poravnaj granice heap-a
    heapStart = ((start + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    heapEnd   = (end / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;

    if (heapEnd <= heapStart) {
        freeHead = nullptr;
        printString("<-- MA::init() failed: No heap space.\n");
        return;
    }

    // Postavi početni slobodan blok
    freeHead = (memBlock*) heapStart;
    freeHead->isFree = true;
    freeHead->prev = nullptr;
    freeHead->next = nullptr;

    size_t totalBlocks = (heapEnd - heapStart) / MEM_BLOCK_SIZE;
    if (totalBlocks <= HEADER_BLOCKS) {
        freeHead = nullptr;
        printString("<-- MA::init() failed: Not enough space for header.\n");
        return;
    }
    freeHead->sizeBlocks = totalBlocks - HEADER_BLOCKS;

    printString("    Heap start: "); printInteger(heapStart); printString("\n");
    printString("    Heap end:   "); printInteger(heapEnd); printString("\n");
    printString("    Initial free block size (payload): "); printInteger(freeHead->sizeBlocks); printString(" blocks.\n");
    printString("<-- MA::init() finished.\n");
}

// Pretvara bajtove u blokove
size_t MemoryAllocator::sizeToBlocks(size_t bytes) {
    if (bytes == 0) return 0;
    return (bytes + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
}

// Vraća pokazivač na korisnički deo
void* MemoryAllocator::headerUser(memBlock* h) {
    if (!h) return nullptr;
    return (void*)((uint8*)h + sizeof(memBlock));
}

// Vraća pokazivač na zaglavlje
MemoryAllocator::memBlock* MemoryAllocator::userHeader(void* userPtr) {
    if (!userPtr) return nullptr;
    return (memBlock*)((uint8*)userPtr - sizeof(memBlock));
}

// Uklanja blok iz liste slobodnih
void MemoryAllocator::removeFree(memBlock* blk) {
    // printString("    MA::removeFree() called for block at: "); printInteger((uint64)blk); printString("\n");
    if (!blk) return;
    if (blk->prev) blk->prev->next = blk->next;
    else           freeHead       = blk->next;
    if (blk->next) blk->next->prev = blk->prev;
    blk->prev = blk->next = nullptr;
}

// Cepa blok
void MemoryAllocator::split(memBlock* blk, uint64 needBlocks) {
    size_t haveBlocks  = blk->sizeBlocks;
    size_t remainingPayloadBlocks = haveBlocks - needBlocks;
    size_t neededForRemainderHeader = sizeToBlocks(sizeof(memBlock));

    if (remainingPayloadBlocks > neededForRemainderHeader) {
        // printString("    MA::split() is splitting block.\n");
        blk->sizeBlocks = (size_t)needBlocks;
        memBlock* right = (memBlock*)((uint8*)headerUser(blk) + (size_t)needBlocks * MEM_BLOCK_SIZE);
        right->sizeBlocks = remainingPayloadBlocks - neededForRemainderHeader;
        insertSorted(right);
    }
}

// Ubacuje blok u sortiranu listu
void MemoryAllocator::insertSorted(memBlock* blk) {
    // printString("    MA::insertSorted() called for block at: "); printInteger((uint64)blk); printString("\n");
    blk->isFree = true;
    blk->prev = blk->next = nullptr;

    if (!freeHead) { freeHead = blk; return; }

    uint64 addr = (uint64)blk;
    memBlock* it = freeHead;
    memBlock* pv = nullptr;
    while (it && (uint64)it < addr) { pv = it; it = it->next; }

    blk->next = it;
    blk->prev = pv;
    if (it) it->prev = blk;
    if (pv) pv->next = blk;
    else    freeHead = blk;
}

// GLAVNA FUNKCIJA ZA ALOKACIJU
void* MemoryAllocator::mem_alloc(size_t size) {
    printString("--> MA::mem_alloc() called for size: "); printInteger(size); printString(" bytes.\n");

    if (!freeHead || size == 0) {
        printString("<-- MA::mem_alloc() failed: freeHead is null or size is 0.\n");
        return nullptr;
    }

    size_t needBlocks = sizeToBlocks(size);
    if (needBlocks == (size_t)-1) {
        printString("<-- MA::mem_alloc() failed: size overflow.\n");
        return nullptr;
    }
    printString("    Converted to "); printInteger(needBlocks); printString(" blocks.\n");

    // First-fit pretraga
    for (memBlock* it = freeHead; it; it = it->next) {
        printString("    Checking block at: "); printInteger((uint64)it); printString(" with payload size: "); printInteger(it->sizeBlocks); printString(" blocks.\n");
        if (it->sizeBlocks >= needBlocks) {
            printString("    Found suitable block!\n");
            removeFree(it);
            split(it, (uint64)needBlocks);
            it->isFree = false;
            void* userPtr = headerUser(it);
            printString("<-- MA::mem_alloc() returning address: "); printInteger((uint64)userPtr); printString("\n");
            return userPtr;
        }
    }

    printString("<-- MA::mem_alloc() failed: No suitable block found!\n");
    return nullptr;
}

// OSLOBAĐANJE MEMORIJE
int MemoryAllocator::mem_free(void* addr) {
    printString("--> MA::mem_free() called for address: "); printInteger((uint64)addr); printString("\n");
    if (!addr) return -1;

    auto* blk = (memBlock*)((char*)addr - sizeof(memBlock));

    // Validacije
    if ((uint64)blk < heapStart || (uint64)blk >= heapEnd) return -2;
    if (blk->sizeBlocks == 0) return -3;     // korupcija
    if (blk->isFree)         return -4;     // double free

    blk->isFree = true;

    // Ubaci u sortiranu (po adresi) free listu
    memBlock* prev = nullptr;
    memBlock* cur  = freeHead;
    while (cur && cur < blk) { prev = cur; cur = cur->next; }

    blk->prev = prev;
    blk->next = cur;
    if (prev) prev->next = blk; else freeHead = blk;
    if (cur)  cur->prev  = blk;

    // Pomocne
    auto totalBytes = [](memBlock* b) -> size_t {
        return sizeof(memBlock) + b->sizeBlocks * MEM_BLOCK_SIZE; // header + payload
    };
    auto is_adjacent = [&](memBlock* left, memBlock* right) -> bool {
        return (char*)left + totalBytes(left) == (char*)right;
    };

    // 1) Spoji sa PRETHODNIM ako su fizički susedni
    if (blk->prev && is_adjacent(blk->prev, blk)) {
        memBlock* left = blk->prev;
        left->sizeBlocks += blk->sizeBlocks;     // ⚠️ samo payload, bez headera
        // ukloni blk iz liste
        left->next = blk->next;
        if (blk->next) blk->next->prev = left;
        blk = left; // nastavi dalje od uvećanog levog
    }

    // 2) Spoji sa SLEDEĆIM ako su fizički susedni
    if (blk->next && is_adjacent(blk, blk->next)) {
        memBlock* right = blk->next;
        blk->sizeBlocks += right->sizeBlocks;    // ⚠️ samo payload
        // ukloni right iz liste
        blk->next = right->next;
        if (right->next) right->next->prev = blk;
    }

    printString("<-- MA::mem_free() finished.\n");
    return 0;
}
