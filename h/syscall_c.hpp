#pragma once
#include "../lib/hw.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _thread* thread_t;

/* Kreira nit koja startuje od start_routine(arg) (preko trampoline). */
int  thread_create(thread_t* handle, void (*start_routine)(void*), void* arg);

/* Zavrsava tekucu nit. */
int  thread_exit();

/* Rucno prebacivanje konteksta. */
void thread_dispatch();

#ifdef __cplusplus
}
#endif
