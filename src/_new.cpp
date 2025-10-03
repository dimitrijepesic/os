//
// Created by marko on 20.4.22.
//

#include "../h/MemoryAllocator.hpp"

void *operator new(size_t n) {
    return MemoryAllocator::mem_alloc(n);
}
void *operator new[](size_t n) {
    return MemoryAllocator::mem_alloc(n);
}
void operator delete(void *p) noexcept {
    MemoryAllocator::mem_free(p);
}
void operator delete[](void *p) noexcept {
    MemoryAllocator::mem_free(p);
}