#pragma once
#include "../lib/hw.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _thread* thread_t;

/* Kreira nit koja startuje od start_routine(arg).
 * Vraca 0 na uspeh, <0 na gresku.
 */
int  thread_create(thread_t* handle, void (*start_routine)(void*), void* arg);

/* Zavrsava tekucu nit i predaje CPU na sledecu. */
int  thread_exit();

/* Rucno prebacivanje konteksta na sledecu spremnu nit. */
void thread_dispatch();

#ifdef __cplusplus
}
#endif
