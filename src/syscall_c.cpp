//
// Created by os on 9/30/25.
//

#include "../h/syscall_c.hpp"
#include "../lib/hw.h" // Za definicije kodova i tipova

// ====================================================================
// Definicije kodova sistemskih poziva
// Moraju biti usaglašeni sa onima u riscv.cpp
// ====================================================================
enum SyscallCode {
    MEM_ALLOC = 0x01,
    MEM_FREE = 0x02,
    THREAD_CREATE = 0x11,
    THREAD_EXIT = 0x12,
    THREAD_DISPATCH = 0x13,
    SEM_OPEN = 0x21,
    SEM_CLOSE = 0x22,
    SEM_WAIT = 0x23,
    SEM_SIGNAL = 0x24
};

// ====================================================================
// Pomoćna funkcija za poziv sistemskog poziva
// ====================================================================
static inline void syscall(uint64 code, uint64 arg1 = 0, uint64 arg2 = 0, uint64 arg3 = 0, uint64 arg4 = 0) {
    __asm__ volatile (
            "mv a4, %[arg4]\n"
            "mv a3, %[arg3]\n"
            "mv a2, %[arg2]\n"
            "mv a1, %[arg1]\n"
            "mv a0, %[code]\n"
            "ecall"
            : // nema izlaznih operanada
            : [code]"r"(code), [arg1]"r"(arg1), [arg2]"r"(arg2), [arg3]"r"(arg3), [arg4]"r"(arg4)
    : "a0", "a1", "a2", "a3", "a4" // Registri koji se menjaju
    );
}

// ====================================================================
// Implementacija C API funkcija
// ====================================================================

void* mem_alloc(size_t size) {
    syscall(MEM_ALLOC, (uint64)size);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (void*)ret;
}

int mem_free(void* ptr) {
    syscall(MEM_FREE, (uint64)ptr);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int)ret;
}

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg) {
    // Stek se alocira unutar kernela, ne ovde.
    // Argumente pakujemo u registre i zovemo ecall.
    // a1 = handle, a2 = start_routine, a3 = arg
    syscall(THREAD_CREATE, (uint64)handle, (uint64)start_routine, (uint64)arg);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int)ret;
}

int thread_exit() {
    syscall(THREAD_EXIT);
    // Ova funkcija se ne vraća ako je uspešna
    return -1; // Vraća grešku ako ecall ne uspe
}

void thread_dispatch() {
    syscall(THREAD_DISPATCH);
}

int sem_open(sem_t* handle, unsigned init) {
    syscall(SEM_OPEN, (uint64)handle, (uint64)init);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int)ret;
}

int sem_close(sem_t handle) {
    syscall(SEM_CLOSE, (uint64)handle);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int)ret;
}

int sem_wait(sem_t id) {
    syscall(SEM_WAIT, (uint64)id);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int)ret;
}

int sem_signal(sem_t id) {
    syscall(SEM_SIGNAL, (uint64)id);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int)ret;
}