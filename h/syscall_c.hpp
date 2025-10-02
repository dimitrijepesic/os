//
// Created by os on 9/30/25.
//

#ifndef PROJECT_BASE_V1_1_SYSCALL_C_HPP
#define PROJECT_BASE_V1_1_SYSCALL_C_HPP

// Forward deklaracije koje "obećavaju" kompajleru da ove klase postoje.
class _sem;
class CCB;

// Definicije neprozirnih pokazivača (handle-ova) za korisnički API
typedef _sem* sem_t;
typedef CCB* thread_t;

// Deklaracije C API funkcija za niti
int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg);
int thread_exit();
void thread_dispatch();
void thread_join(thread_t handle); // Dodaj i join ako ti treba za testiranje

// Deklaracije C API funkcija za semafore
int sem_open(sem_t* handle, unsigned init);
int sem_close(sem_t handle);
int sem_wait(sem_t handle);
int sem_signal(sem_t handle);

#endif //PROJECT_BASE_V1_1_SYSCALL_C_HPP
