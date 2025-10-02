
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	0d813103          	ld	sp,216(sp) # 800060d8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	4f1020ef          	jal	ra,80002d0c <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <supervisorTrap>:
.type supervisorTrap, @function
supervisorTrap:
    # C handler vraca u a0:
    #   0 = bez promene konteksta  -> sret
    #   1 = promenjen kontekst     -> ret (jer je vec uradjen contextSwitch)
    call _ZN5Riscv20handleSupervisorTrapEv
    80001000:	208010ef          	jal	ra,80002208 <_ZN5Riscv20handleSupervisorTrapEv>
    beqz a0, 1f
    80001004:	00050463          	beqz	a0,8000100c <supervisorTrap+0xc>
    ret
    80001008:	00008067          	ret
1:
    sret
    8000100c:	10200073          	sret

0000000080001010 <_ZN5Riscv13pushRegistersEv>:
.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
    addi sp, sp, -256
    80001010:	f0010113          	addi	sp,sp,-256
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001014:	00313c23          	sd	gp,24(sp)
    80001018:	02413023          	sd	tp,32(sp)
    8000101c:	02513423          	sd	t0,40(sp)
    80001020:	02613823          	sd	t1,48(sp)
    80001024:	02713c23          	sd	t2,56(sp)
    80001028:	04813023          	sd	s0,64(sp)
    8000102c:	04913423          	sd	s1,72(sp)
    80001030:	04a13823          	sd	a0,80(sp)
    80001034:	04b13c23          	sd	a1,88(sp)
    80001038:	06c13023          	sd	a2,96(sp)
    8000103c:	06d13423          	sd	a3,104(sp)
    80001040:	06e13823          	sd	a4,112(sp)
    80001044:	06f13c23          	sd	a5,120(sp)
    80001048:	09013023          	sd	a6,128(sp)
    8000104c:	09113423          	sd	a7,136(sp)
    80001050:	09213823          	sd	s2,144(sp)
    80001054:	09313c23          	sd	s3,152(sp)
    80001058:	0b413023          	sd	s4,160(sp)
    8000105c:	0b513423          	sd	s5,168(sp)
    80001060:	0b613823          	sd	s6,176(sp)
    80001064:	0b713c23          	sd	s7,184(sp)
    80001068:	0d813023          	sd	s8,192(sp)
    8000106c:	0d913423          	sd	s9,200(sp)
    80001070:	0da13823          	sd	s10,208(sp)
    80001074:	0db13c23          	sd	s11,216(sp)
    80001078:	0fc13023          	sd	t3,224(sp)
    8000107c:	0fd13423          	sd	t4,232(sp)
    80001080:	0fe13823          	sd	t5,240(sp)
    80001084:	0ff13c23          	sd	t6,248(sp)
    ret
    80001088:	00008067          	ret

000000008000108c <_ZN5Riscv12popRegistersEv>:
.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    8000108c:	01813183          	ld	gp,24(sp)
    80001090:	02013203          	ld	tp,32(sp)
    80001094:	02813283          	ld	t0,40(sp)
    80001098:	03013303          	ld	t1,48(sp)
    8000109c:	03813383          	ld	t2,56(sp)
    800010a0:	04013403          	ld	s0,64(sp)
    800010a4:	04813483          	ld	s1,72(sp)
    800010a8:	05013503          	ld	a0,80(sp)
    800010ac:	05813583          	ld	a1,88(sp)
    800010b0:	06013603          	ld	a2,96(sp)
    800010b4:	06813683          	ld	a3,104(sp)
    800010b8:	07013703          	ld	a4,112(sp)
    800010bc:	07813783          	ld	a5,120(sp)
    800010c0:	08013803          	ld	a6,128(sp)
    800010c4:	08813883          	ld	a7,136(sp)
    800010c8:	09013903          	ld	s2,144(sp)
    800010cc:	09813983          	ld	s3,152(sp)
    800010d0:	0a013a03          	ld	s4,160(sp)
    800010d4:	0a813a83          	ld	s5,168(sp)
    800010d8:	0b013b03          	ld	s6,176(sp)
    800010dc:	0b813b83          	ld	s7,184(sp)
    800010e0:	0c013c03          	ld	s8,192(sp)
    800010e4:	0c813c83          	ld	s9,200(sp)
    800010e8:	0d013d03          	ld	s10,208(sp)
    800010ec:	0d813d83          	ld	s11,216(sp)
    800010f0:	0e013e03          	ld	t3,224(sp)
    800010f4:	0e813e83          	ld	t4,232(sp)
    800010f8:	0f013f03          	ld	t5,240(sp)
    800010fc:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001100:	10010113          	addi	sp,sp,256
    ret
    80001104:	00008067          	ret

0000000080001108 <_ZN3CCB13contextSwitchEPNS_7ContextES1_>:
# Globalni simbol za C++ funkciju: CCB::contextSwitch(Context*, Context*)
.global _ZN3CCB13contextSwitchEPNS_7ContextES1_

_ZN3CCB13contextSwitchEPNS_7ContextES1_:
    # Sačuvaj ra i sp STARE niti u njen TCB (u a0)
    sd ra, 0 * 8(a0)  # oldContext->ra = ra
    80001108:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)  # oldContext->sp = sp
    8000110c:	00253423          	sd	sp,8(a0)

    # Učitaj ra i sp NOVE niti iz njenog TCB-a (u a1)
    ld ra, 0 * 8(a1)  # ra = runningContext->ra
    80001110:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)  # sp = runningContext->sp
    80001114:	0085b103          	ld	sp,8(a1)

    # Vrati se. Ovo skače na novu povratnu adresu sa novim stekom.
    80001118:	00008067          	ret

000000008000111c <_Z9mem_allocm>:

// ====================================================================
// Implementacija C API funkcija
// ====================================================================

void* mem_alloc(size_t size) {
    8000111c:	ff010113          	addi	sp,sp,-16
    80001120:	00813423          	sd	s0,8(sp)
    80001124:	01010413          	addi	s0,sp,16
    80001128:	00050893          	mv	a7,a0
    );
    8000112c:	00000793          	li	a5,0
    80001130:	00100813          	li	a6,1
    80001134:	00078713          	mv	a4,a5
    80001138:	00078693          	mv	a3,a5
    8000113c:	00078613          	mv	a2,a5
    80001140:	00088593          	mv	a1,a7
    80001144:	00080513          	mv	a0,a6
    80001148:	00000073          	ecall
    syscall(MEM_ALLOC, (uint64)size);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    8000114c:	00050513          	mv	a0,a0
    return (void*)ret;
}
    80001150:	00813403          	ld	s0,8(sp)
    80001154:	01010113          	addi	sp,sp,16
    80001158:	00008067          	ret

000000008000115c <_Z8mem_freePv>:

int mem_free(void* ptr) {
    8000115c:	ff010113          	addi	sp,sp,-16
    80001160:	00813423          	sd	s0,8(sp)
    80001164:	01010413          	addi	s0,sp,16
    80001168:	00050893          	mv	a7,a0
    );
    8000116c:	00000793          	li	a5,0
    80001170:	00200813          	li	a6,2
    80001174:	00078713          	mv	a4,a5
    80001178:	00078693          	mv	a3,a5
    8000117c:	00078613          	mv	a2,a5
    80001180:	00088593          	mv	a1,a7
    80001184:	00080513          	mv	a0,a6
    80001188:	00000073          	ecall
    syscall(MEM_FREE, (uint64)ptr);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    8000118c:	00050513          	mv	a0,a0
    return (int)ret;
}
    80001190:	0005051b          	sext.w	a0,a0
    80001194:	00813403          	ld	s0,8(sp)
    80001198:	01010113          	addi	sp,sp,16
    8000119c:	00008067          	ret

00000000800011a0 <_Z13thread_createPP3CCBPFvPvES2_>:

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg) {
    800011a0:	ff010113          	addi	sp,sp,-16
    800011a4:	00813423          	sd	s0,8(sp)
    800011a8:	01010413          	addi	s0,sp,16
    800011ac:	00050813          	mv	a6,a0
    800011b0:	00058893          	mv	a7,a1
    800011b4:	00060313          	mv	t1,a2
    );
    800011b8:	01100793          	li	a5,17
    800011bc:	00000e13          	li	t3,0
    800011c0:	000e0713          	mv	a4,t3
    800011c4:	00030693          	mv	a3,t1
    800011c8:	00088613          	mv	a2,a7
    800011cc:	00080593          	mv	a1,a6
    800011d0:	00078513          	mv	a0,a5
    800011d4:	00000073          	ecall
    // Stek se alocira unutar kernela, ne ovde.
    // Argumente pakujemo u registre i zovemo ecall.
    // a1 = handle, a2 = start_routine, a3 = arg
    syscall(THREAD_CREATE, (uint64)handle, (uint64)start_routine, (uint64)arg);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800011d8:	00050513          	mv	a0,a0
    return (int)ret;
}
    800011dc:	0005051b          	sext.w	a0,a0
    800011e0:	00813403          	ld	s0,8(sp)
    800011e4:	01010113          	addi	sp,sp,16
    800011e8:	00008067          	ret

00000000800011ec <_Z11thread_exitv>:

int thread_exit() {
    800011ec:	ff010113          	addi	sp,sp,-16
    800011f0:	00813423          	sd	s0,8(sp)
    800011f4:	01010413          	addi	s0,sp,16
    );
    800011f8:	00000793          	li	a5,0
    800011fc:	01200813          	li	a6,18
    80001200:	00078713          	mv	a4,a5
    80001204:	00078693          	mv	a3,a5
    80001208:	00078613          	mv	a2,a5
    8000120c:	00078593          	mv	a1,a5
    80001210:	00080513          	mv	a0,a6
    80001214:	00000073          	ecall
    syscall(THREAD_EXIT);
    // Ova funkcija se ne vraća ako je uspešna
    return -1; // Vraća grešku ako ecall ne uspe
}
    80001218:	fff00513          	li	a0,-1
    8000121c:	00813403          	ld	s0,8(sp)
    80001220:	01010113          	addi	sp,sp,16
    80001224:	00008067          	ret

0000000080001228 <_Z15thread_dispatchv>:

void thread_dispatch() {
    80001228:	ff010113          	addi	sp,sp,-16
    8000122c:	00813423          	sd	s0,8(sp)
    80001230:	01010413          	addi	s0,sp,16
    );
    80001234:	00000793          	li	a5,0
    80001238:	01300813          	li	a6,19
    8000123c:	00078713          	mv	a4,a5
    80001240:	00078693          	mv	a3,a5
    80001244:	00078613          	mv	a2,a5
    80001248:	00078593          	mv	a1,a5
    8000124c:	00080513          	mv	a0,a6
    80001250:	00000073          	ecall
    syscall(THREAD_DISPATCH);
}
    80001254:	00813403          	ld	s0,8(sp)
    80001258:	01010113          	addi	sp,sp,16
    8000125c:	00008067          	ret

0000000080001260 <_Z8sem_openPP4_semj>:

int sem_open(sem_t* handle, unsigned init) {
    80001260:	ff010113          	addi	sp,sp,-16
    80001264:	00813423          	sd	s0,8(sp)
    80001268:	01010413          	addi	s0,sp,16
    8000126c:	00050313          	mv	t1,a0
    syscall(SEM_OPEN, (uint64)handle, (uint64)init);
    80001270:	02059793          	slli	a5,a1,0x20
    80001274:	0207d793          	srli	a5,a5,0x20
    );
    80001278:	00000813          	li	a6,0
    8000127c:	02100893          	li	a7,33
    80001280:	00080713          	mv	a4,a6
    80001284:	00080693          	mv	a3,a6
    80001288:	00078613          	mv	a2,a5
    8000128c:	00030593          	mv	a1,t1
    80001290:	00088513          	mv	a0,a7
    80001294:	00000073          	ecall
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001298:	00050513          	mv	a0,a0
    return (int)ret;
}
    8000129c:	0005051b          	sext.w	a0,a0
    800012a0:	00813403          	ld	s0,8(sp)
    800012a4:	01010113          	addi	sp,sp,16
    800012a8:	00008067          	ret

00000000800012ac <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    800012ac:	ff010113          	addi	sp,sp,-16
    800012b0:	00813423          	sd	s0,8(sp)
    800012b4:	01010413          	addi	s0,sp,16
    800012b8:	00050893          	mv	a7,a0
    );
    800012bc:	00000793          	li	a5,0
    800012c0:	02200813          	li	a6,34
    800012c4:	00078713          	mv	a4,a5
    800012c8:	00078693          	mv	a3,a5
    800012cc:	00078613          	mv	a2,a5
    800012d0:	00088593          	mv	a1,a7
    800012d4:	00080513          	mv	a0,a6
    800012d8:	00000073          	ecall
    syscall(SEM_CLOSE, (uint64)handle);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    800012dc:	00050513          	mv	a0,a0
    return (int)ret;
}
    800012e0:	0005051b          	sext.w	a0,a0
    800012e4:	00813403          	ld	s0,8(sp)
    800012e8:	01010113          	addi	sp,sp,16
    800012ec:	00008067          	ret

00000000800012f0 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id) {
    800012f0:	ff010113          	addi	sp,sp,-16
    800012f4:	00813423          	sd	s0,8(sp)
    800012f8:	01010413          	addi	s0,sp,16
    800012fc:	00050893          	mv	a7,a0
    );
    80001300:	00000793          	li	a5,0
    80001304:	02300813          	li	a6,35
    80001308:	00078713          	mv	a4,a5
    8000130c:	00078693          	mv	a3,a5
    80001310:	00078613          	mv	a2,a5
    80001314:	00088593          	mv	a1,a7
    80001318:	00080513          	mv	a0,a6
    8000131c:	00000073          	ecall
    syscall(SEM_WAIT, (uint64)id);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001320:	00050513          	mv	a0,a0
    return (int)ret;
}
    80001324:	0005051b          	sext.w	a0,a0
    80001328:	00813403          	ld	s0,8(sp)
    8000132c:	01010113          	addi	sp,sp,16
    80001330:	00008067          	ret

0000000080001334 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id) {
    80001334:	ff010113          	addi	sp,sp,-16
    80001338:	00813423          	sd	s0,8(sp)
    8000133c:	01010413          	addi	s0,sp,16
    80001340:	00050893          	mv	a7,a0
    );
    80001344:	00000793          	li	a5,0
    80001348:	02400813          	li	a6,36
    8000134c:	00078713          	mv	a4,a5
    80001350:	00078693          	mv	a3,a5
    80001354:	00078613          	mv	a2,a5
    80001358:	00088593          	mv	a1,a7
    8000135c:	00080513          	mv	a0,a6
    80001360:	00000073          	ecall
    syscall(SEM_SIGNAL, (uint64)id);
    uint64 ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    80001364:	00050513          	mv	a0,a0
    return (int)ret;
    80001368:	0005051b          	sext.w	a0,a0
    8000136c:	00813403          	ld	s0,8(sp)
    80001370:	01010113          	addi	sp,sp,16
    80001374:	00008067          	ret

0000000080001378 <_ZN4_semC1Ej>:
#include "../h/riscv.hpp"
#include "../h/ccb.hpp"
#include "../h/Scheduler.hpp"
#include "../h/MemoryAllocator.hpp"

_sem::_sem(unsigned int init) : val(init) {}
    80001378:	ff010113          	addi	sp,sp,-16
    8000137c:	00813423          	sd	s0,8(sp)
    80001380:	01010413          	addi	s0,sp,16
    80001384:	00b52023          	sw	a1,0(a0)
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80001388:	00053423          	sd	zero,8(a0)
    8000138c:	00053823          	sd	zero,16(a0)
    80001390:	00813403          	ld	s0,8(sp)
    80001394:	01010113          	addi	sp,sp,16
    80001398:	00008067          	ret

000000008000139c <_ZN4_sem4waitEv>:
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
}

inline void Riscv::mc_sstatus(uint64 mask)
{
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000139c:	00200793          	li	a5,2
    800013a0:	1007b073          	csrc	sstatus,a5
    }
}

int _sem::wait() {
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    if (--val < 0) {
    800013a4:	00052783          	lw	a5,0(a0)
    800013a8:	fff7879b          	addiw	a5,a5,-1
    800013ac:	00f52023          	sw	a5,0(a0)
    800013b0:	02079713          	slli	a4,a5,0x20
    800013b4:	00074a63          	bltz	a4,800013c8 <_ZN4_sem4waitEv+0x2c>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800013b8:	00200793          	li	a5,2
    800013bc:	1007a073          	csrs	sstatus,a5
        blocked.addLast(CCB::running);
        CCB::yield();
    }
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    return 0;
}
    800013c0:	00000513          	li	a0,0
    800013c4:	00008067          	ret
int _sem::wait() {
    800013c8:	fe010113          	addi	sp,sp,-32
    800013cc:	00113c23          	sd	ra,24(sp)
    800013d0:	00813823          	sd	s0,16(sp)
    800013d4:	00913423          	sd	s1,8(sp)
    800013d8:	01213023          	sd	s2,0(sp)
    800013dc:	02010413          	addi	s0,sp,32
    800013e0:	00050493          	mv	s1,a0
        blocked.addLast(CCB::running);
    800013e4:	00005917          	auipc	s2,0x5
    800013e8:	e1493903          	ld	s2,-492(s2) # 800061f8 <_ZN3CCB7runningE>
        if (!tail) { tail = head; }
    }

    void addLast(T *data)
    {
        Elem *elem = new Elem(data, 0);
    800013ec:	01000513          	li	a0,16
    800013f0:	00001097          	auipc	ra,0x1
    800013f4:	b4c080e7          	jalr	-1204(ra) # 80001f3c <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800013f8:	01253023          	sd	s2,0(a0)
    800013fc:	00053423          	sd	zero,8(a0)
        if (tail)
    80001400:	0104b783          	ld	a5,16(s1)
    80001404:	02078c63          	beqz	a5,8000143c <_ZN4_sem4waitEv+0xa0>
        {
            tail->next = elem;
    80001408:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    8000140c:	00a4b823          	sd	a0,16(s1)
        CCB::yield();
    80001410:	00001097          	auipc	ra,0x1
    80001414:	c24080e7          	jalr	-988(ra) # 80002034 <_ZN3CCB5yieldEv>
    80001418:	00200793          	li	a5,2
    8000141c:	1007a073          	csrs	sstatus,a5
}
    80001420:	00000513          	li	a0,0
    80001424:	01813083          	ld	ra,24(sp)
    80001428:	01013403          	ld	s0,16(sp)
    8000142c:	00813483          	ld	s1,8(sp)
    80001430:	00013903          	ld	s2,0(sp)
    80001434:	02010113          	addi	sp,sp,32
    80001438:	00008067          	ret
        } else
        {
            head = tail = elem;
    8000143c:	00a4b823          	sd	a0,16(s1)
    80001440:	00a4b423          	sd	a0,8(s1)
    80001444:	fcdff06f          	j	80001410 <_ZN4_sem4waitEv+0x74>

0000000080001448 <_ZN4_sem6signalEv>:
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001448:	00200713          	li	a4,2
    8000144c:	10073073          	csrc	sstatus,a4

int _sem::signal() {
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    if (++val <= 0) {
    80001450:	00052703          	lw	a4,0(a0)
    80001454:	0017071b          	addiw	a4,a4,1
    80001458:	0007069b          	sext.w	a3,a4
    8000145c:	00e52023          	sw	a4,0(a0)
    80001460:	00d05a63          	blez	a3,80001474 <_ZN4_sem6signalEv+0x2c>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001464:	00200793          	li	a5,2
    80001468:	1007a073          	csrs	sstatus,a5
        if (auto* t = blocked.removeFirst()) Scheduler::put(t);
    }
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    return 0;
}
    8000146c:	00000513          	li	a0,0
    80001470:	00008067          	ret
    80001474:	00050793          	mv	a5,a0
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }
    80001478:	00853503          	ld	a0,8(a0)
    8000147c:	fe0504e3          	beqz	a0,80001464 <_ZN4_sem6signalEv+0x1c>
int _sem::signal() {
    80001480:	fe010113          	addi	sp,sp,-32
    80001484:	00113c23          	sd	ra,24(sp)
    80001488:	00813823          	sd	s0,16(sp)
    8000148c:	00913423          	sd	s1,8(sp)
    80001490:	02010413          	addi	s0,sp,32

        Elem *elem = head;
        head = head->next;
    80001494:	00853703          	ld	a4,8(a0)
    80001498:	00e7b423          	sd	a4,8(a5)
        if (!head) { tail = 0; }
    8000149c:	04070063          	beqz	a4,800014dc <_ZN4_sem6signalEv+0x94>

        T *ret = elem->data;
    800014a0:	00053483          	ld	s1,0(a0)
        delete elem;
    800014a4:	00001097          	auipc	ra,0x1
    800014a8:	ae8080e7          	jalr	-1304(ra) # 80001f8c <_ZdlPv>
        if (auto* t = blocked.removeFirst()) Scheduler::put(t);
    800014ac:	00048863          	beqz	s1,800014bc <_ZN4_sem6signalEv+0x74>
    800014b0:	00048513          	mv	a0,s1
    800014b4:	00000097          	auipc	ra,0x0
    800014b8:	530080e7          	jalr	1328(ra) # 800019e4 <_ZN9Scheduler3putEP3CCB>
    800014bc:	00200793          	li	a5,2
    800014c0:	1007a073          	csrs	sstatus,a5
}
    800014c4:	00000513          	li	a0,0
    800014c8:	01813083          	ld	ra,24(sp)
    800014cc:	01013403          	ld	s0,16(sp)
    800014d0:	00813483          	ld	s1,8(sp)
    800014d4:	02010113          	addi	sp,sp,32
    800014d8:	00008067          	ret
        if (!head) { tail = 0; }
    800014dc:	0007b823          	sd	zero,16(a5)
    800014e0:	fc1ff06f          	j	800014a0 <_ZN4_sem6signalEv+0x58>

00000000800014e4 <_ZN4_semnwEm>:


void* _sem::operator new(size_t size) {
    800014e4:	ff010113          	addi	sp,sp,-16
    800014e8:	00113423          	sd	ra,8(sp)
    800014ec:	00813023          	sd	s0,0(sp)
    800014f0:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(size);
    800014f4:	00001097          	auipc	ra,0x1
    800014f8:	378080e7          	jalr	888(ra) # 8000286c <_ZN15MemoryAllocator9mem_allocEm>
}
    800014fc:	00813083          	ld	ra,8(sp)
    80001500:	00013403          	ld	s0,0(sp)
    80001504:	01010113          	addi	sp,sp,16
    80001508:	00008067          	ret

000000008000150c <_ZN4_semdlEPv>:

void _sem::operator delete(void* ptr) {
    8000150c:	ff010113          	addi	sp,sp,-16
    80001510:	00113423          	sd	ra,8(sp)
    80001514:	00813023          	sd	s0,0(sp)
    80001518:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(ptr);
    8000151c:	00001097          	auipc	ra,0x1
    80001520:	51c080e7          	jalr	1308(ra) # 80002a38 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001524:	00813083          	ld	ra,8(sp)
    80001528:	00013403          	ld	s0,0(sp)
    8000152c:	01010113          	addi	sp,sp,16
    80001530:	00008067          	ret

0000000080001534 <_ZN4_sem5blockEv>:

void _sem::block() {
    80001534:	fe010113          	addi	sp,sp,-32
    80001538:	00113c23          	sd	ra,24(sp)
    8000153c:	00813823          	sd	s0,16(sp)
    80001540:	00913423          	sd	s1,8(sp)
    80001544:	01213023          	sd	s2,0(sp)
    80001548:	02010413          	addi	s0,sp,32
    8000154c:	00050493          	mv	s1,a0
    blocked.addLast(CCB::running);
    80001550:	00005917          	auipc	s2,0x5
    80001554:	ca893903          	ld	s2,-856(s2) # 800061f8 <_ZN3CCB7runningE>
        Elem *elem = new Elem(data, 0);
    80001558:	01000513          	li	a0,16
    8000155c:	00001097          	auipc	ra,0x1
    80001560:	9e0080e7          	jalr	-1568(ra) # 80001f3c <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80001564:	01253023          	sd	s2,0(a0)
    80001568:	00053423          	sd	zero,8(a0)
        if (tail)
    8000156c:	0104b783          	ld	a5,16(s1)
    80001570:	02078663          	beqz	a5,8000159c <_ZN4_sem5blockEv+0x68>
            tail->next = elem;
    80001574:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001578:	00a4b823          	sd	a0,16(s1)
    CCB::yield();
    8000157c:	00001097          	auipc	ra,0x1
    80001580:	ab8080e7          	jalr	-1352(ra) # 80002034 <_ZN3CCB5yieldEv>
}
    80001584:	01813083          	ld	ra,24(sp)
    80001588:	01013403          	ld	s0,16(sp)
    8000158c:	00813483          	ld	s1,8(sp)
    80001590:	00013903          	ld	s2,0(sp)
    80001594:	02010113          	addi	sp,sp,32
    80001598:	00008067          	ret
            head = tail = elem;
    8000159c:	00a4b823          	sd	a0,16(s1)
    800015a0:	00a4b423          	sd	a0,8(s1)
    800015a4:	fd9ff06f          	j	8000157c <_ZN4_sem5blockEv+0x48>

00000000800015a8 <_ZN4_sem7unblockEv>:

void _sem::unblock() {
    800015a8:	00050793          	mv	a5,a0
        if (!head) { return 0; }
    800015ac:	00853503          	ld	a0,8(a0)
    800015b0:	04050e63          	beqz	a0,8000160c <_ZN4_sem7unblockEv+0x64>
    800015b4:	fe010113          	addi	sp,sp,-32
    800015b8:	00113c23          	sd	ra,24(sp)
    800015bc:	00813823          	sd	s0,16(sp)
    800015c0:	00913423          	sd	s1,8(sp)
    800015c4:	02010413          	addi	s0,sp,32
        head = head->next;
    800015c8:	00853703          	ld	a4,8(a0)
    800015cc:	00e7b423          	sd	a4,8(a5)
        if (!head) { tail = 0; }
    800015d0:	02070a63          	beqz	a4,80001604 <_ZN4_sem7unblockEv+0x5c>
        T *ret = elem->data;
    800015d4:	00053483          	ld	s1,0(a0)
        delete elem;
    800015d8:	00001097          	auipc	ra,0x1
    800015dc:	9b4080e7          	jalr	-1612(ra) # 80001f8c <_ZdlPv>
    if (auto* t = blocked.removeFirst()) {
    800015e0:	00048863          	beqz	s1,800015f0 <_ZN4_sem7unblockEv+0x48>
        Scheduler::put(t);
    800015e4:	00048513          	mv	a0,s1
    800015e8:	00000097          	auipc	ra,0x0
    800015ec:	3fc080e7          	jalr	1020(ra) # 800019e4 <_ZN9Scheduler3putEP3CCB>
    }
    800015f0:	01813083          	ld	ra,24(sp)
    800015f4:	01013403          	ld	s0,16(sp)
    800015f8:	00813483          	ld	s1,8(sp)
    800015fc:	02010113          	addi	sp,sp,32
    80001600:	00008067          	ret
        if (!head) { tail = 0; }
    80001604:	0007b823          	sd	zero,16(a5)
    80001608:	fcdff06f          	j	800015d4 <_ZN4_sem7unblockEv+0x2c>
    8000160c:	00008067          	ret

0000000080001610 <_ZN4_semD1Ev>:
_sem::~_sem() {
    80001610:	fe010113          	addi	sp,sp,-32
    80001614:	00113c23          	sd	ra,24(sp)
    80001618:	00813823          	sd	s0,16(sp)
    8000161c:	00913423          	sd	s1,8(sp)
    80001620:	02010413          	addi	s0,sp,32
    80001624:	00050493          	mv	s1,a0
        return tail->data;
    }

    bool isEmpty() const
    {
        return head==nullptr;
    80001628:	0084b783          	ld	a5,8(s1)
    while (!blocked.isEmpty()) {
    8000162c:	00078a63          	beqz	a5,80001640 <_ZN4_semD1Ev+0x30>
        unblock();
    80001630:	00048513          	mv	a0,s1
    80001634:	00000097          	auipc	ra,0x0
    80001638:	f74080e7          	jalr	-140(ra) # 800015a8 <_ZN4_sem7unblockEv>
    while (!blocked.isEmpty()) {
    8000163c:	fedff06f          	j	80001628 <_ZN4_semD1Ev+0x18>
}
    80001640:	01813083          	ld	ra,24(sp)
    80001644:	01013403          	ld	s0,16(sp)
    80001648:	00813483          	ld	s1,8(sp)
    8000164c:	02010113          	addi	sp,sp,32
    80001650:	00008067          	ret

0000000080001654 <_ZL9fibonaccim>:
#include "../h/workers.hpp"
#include "../lib/hw.h"
#include "../h/ccb.hpp"
#include "../h/print.hpp"

static uint64 fibonacci(uint64 n){
    80001654:	fe010113          	addi	sp,sp,-32
    80001658:	00113c23          	sd	ra,24(sp)
    8000165c:	00813823          	sd	s0,16(sp)
    80001660:	00913423          	sd	s1,8(sp)
    80001664:	01213023          	sd	s2,0(sp)
    80001668:	02010413          	addi	s0,sp,32
    8000166c:	00050493          	mv	s1,a0
    if(n==0 || n==1) return n;
    80001670:	00100793          	li	a5,1
    80001674:	02a7f663          	bgeu	a5,a0,800016a0 <_ZL9fibonaccim+0x4c>
    if (n%4==0) CCB::yield();
    80001678:	00357793          	andi	a5,a0,3
    8000167c:	02078e63          	beqz	a5,800016b8 <_ZL9fibonaccim+0x64>
    return fibonacci(n-1)+fibonacci(n-2);
    80001680:	fff48513          	addi	a0,s1,-1
    80001684:	00000097          	auipc	ra,0x0
    80001688:	fd0080e7          	jalr	-48(ra) # 80001654 <_ZL9fibonaccim>
    8000168c:	00050913          	mv	s2,a0
    80001690:	ffe48513          	addi	a0,s1,-2
    80001694:	00000097          	auipc	ra,0x0
    80001698:	fc0080e7          	jalr	-64(ra) # 80001654 <_ZL9fibonaccim>
    8000169c:	00a90533          	add	a0,s2,a0
}
    800016a0:	01813083          	ld	ra,24(sp)
    800016a4:	01013403          	ld	s0,16(sp)
    800016a8:	00813483          	ld	s1,8(sp)
    800016ac:	00013903          	ld	s2,0(sp)
    800016b0:	02010113          	addi	sp,sp,32
    800016b4:	00008067          	ret
    if (n%4==0) CCB::yield();
    800016b8:	00001097          	auipc	ra,0x1
    800016bc:	97c080e7          	jalr	-1668(ra) # 80002034 <_ZN3CCB5yieldEv>
    800016c0:	fc1ff06f          	j	80001680 <_ZL9fibonaccim+0x2c>

00000000800016c4 <_Z11workerBodyAv>:

void workerBodyA(){
    800016c4:	fe010113          	addi	sp,sp,-32
    800016c8:	00113c23          	sd	ra,24(sp)
    800016cc:	00813823          	sd	s0,16(sp)
    800016d0:	00913423          	sd	s1,8(sp)
    800016d4:	01213023          	sd	s2,0(sp)
    800016d8:	02010413          	addi	s0,sp,32

    uint8 i = 0;
    800016dc:	00000493          	li	s1,0
    800016e0:	0380006f          	j	80001718 <_Z11workerBodyAv+0x54>
    for (; i < 3; i++)
    {
        printString("A: i=");
    800016e4:	00004517          	auipc	a0,0x4
    800016e8:	93c50513          	addi	a0,a0,-1732 # 80005020 <CONSOLE_STATUS+0x10>
    800016ec:	00001097          	auipc	ra,0x1
    800016f0:	518080e7          	jalr	1304(ra) # 80002c04 <_Z11printStringPKc>
        printInteger(i);
    800016f4:	00048513          	mv	a0,s1
    800016f8:	00001097          	auipc	ra,0x1
    800016fc:	590080e7          	jalr	1424(ra) # 80002c88 <_Z12printIntegerm>
        printString("\n");
    80001700:	00004517          	auipc	a0,0x4
    80001704:	ad850513          	addi	a0,a0,-1320 # 800051d8 <CONSOLE_STATUS+0x1c8>
    80001708:	00001097          	auipc	ra,0x1
    8000170c:	4fc080e7          	jalr	1276(ra) # 80002c04 <_Z11printStringPKc>
    for (; i < 3; i++)
    80001710:	0014849b          	addiw	s1,s1,1
    80001714:	0ff4f493          	andi	s1,s1,255
    80001718:	00200793          	li	a5,2
    8000171c:	fc97f4e3          	bgeu	a5,s1,800016e4 <_Z11workerBodyAv+0x20>
    }

    printString("A: yield\n");
    80001720:	00004517          	auipc	a0,0x4
    80001724:	90850513          	addi	a0,a0,-1784 # 80005028 <CONSOLE_STATUS+0x18>
    80001728:	00001097          	auipc	ra,0x1
    8000172c:	4dc080e7          	jalr	1244(ra) # 80002c04 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80001730:	00700313          	li	t1,7
    CCB::yield();
    80001734:	00001097          	auipc	ra,0x1
    80001738:	900080e7          	jalr	-1792(ra) # 80002034 <_ZN3CCB5yieldEv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000173c:	00030913          	mv	s2,t1

    printString("A: t1=");
    80001740:	00004517          	auipc	a0,0x4
    80001744:	8f850513          	addi	a0,a0,-1800 # 80005038 <CONSOLE_STATUS+0x28>
    80001748:	00001097          	auipc	ra,0x1
    8000174c:	4bc080e7          	jalr	1212(ra) # 80002c04 <_Z11printStringPKc>
    printInteger(t1);
    80001750:	00090513          	mv	a0,s2
    80001754:	00001097          	auipc	ra,0x1
    80001758:	534080e7          	jalr	1332(ra) # 80002c88 <_Z12printIntegerm>
    printString("\n");
    8000175c:	00004517          	auipc	a0,0x4
    80001760:	a7c50513          	addi	a0,a0,-1412 # 800051d8 <CONSOLE_STATUS+0x1c8>
    80001764:	00001097          	auipc	ra,0x1
    80001768:	4a0080e7          	jalr	1184(ra) # 80002c04 <_Z11printStringPKc>

    uint64 result = fibonacci(20);
    8000176c:	01400513          	li	a0,20
    80001770:	00000097          	auipc	ra,0x0
    80001774:	ee4080e7          	jalr	-284(ra) # 80001654 <_ZL9fibonaccim>
    80001778:	00050913          	mv	s2,a0
    printString("A: fibonaci=");
    8000177c:	00004517          	auipc	a0,0x4
    80001780:	8c450513          	addi	a0,a0,-1852 # 80005040 <CONSOLE_STATUS+0x30>
    80001784:	00001097          	auipc	ra,0x1
    80001788:	480080e7          	jalr	1152(ra) # 80002c04 <_Z11printStringPKc>
    printInteger(result);
    8000178c:	00090513          	mv	a0,s2
    80001790:	00001097          	auipc	ra,0x1
    80001794:	4f8080e7          	jalr	1272(ra) # 80002c88 <_Z12printIntegerm>
    printString("\n");
    80001798:	00004517          	auipc	a0,0x4
    8000179c:	a4050513          	addi	a0,a0,-1472 # 800051d8 <CONSOLE_STATUS+0x1c8>
    800017a0:	00001097          	auipc	ra,0x1
    800017a4:	464080e7          	jalr	1124(ra) # 80002c04 <_Z11printStringPKc>
    800017a8:	0380006f          	j	800017e0 <_Z11workerBodyAv+0x11c>

    for (; i < 6; i++)
    {
        printString("A: i=");
    800017ac:	00004517          	auipc	a0,0x4
    800017b0:	87450513          	addi	a0,a0,-1932 # 80005020 <CONSOLE_STATUS+0x10>
    800017b4:	00001097          	auipc	ra,0x1
    800017b8:	450080e7          	jalr	1104(ra) # 80002c04 <_Z11printStringPKc>
        printInteger(i);
    800017bc:	00048513          	mv	a0,s1
    800017c0:	00001097          	auipc	ra,0x1
    800017c4:	4c8080e7          	jalr	1224(ra) # 80002c88 <_Z12printIntegerm>
        printString("\n");
    800017c8:	00004517          	auipc	a0,0x4
    800017cc:	a1050513          	addi	a0,a0,-1520 # 800051d8 <CONSOLE_STATUS+0x1c8>
    800017d0:	00001097          	auipc	ra,0x1
    800017d4:	434080e7          	jalr	1076(ra) # 80002c04 <_Z11printStringPKc>
    for (; i < 6; i++)
    800017d8:	0014849b          	addiw	s1,s1,1
    800017dc:	0ff4f493          	andi	s1,s1,255
    800017e0:	00500793          	li	a5,5
    800017e4:	fc97f4e3          	bgeu	a5,s1,800017ac <_Z11workerBodyAv+0xe8>
    ~CCB() {delete[] stack;}

    bool isFinished() const { return finished; }

    void setFinished(bool finished) {
        CCB::finished = finished;
    800017e8:	00005797          	auipc	a5,0x5
    800017ec:	a107b783          	ld	a5,-1520(a5) # 800061f8 <_ZN3CCB7runningE>
    800017f0:	00100713          	li	a4,1
    800017f4:	02e78823          	sb	a4,48(a5)
    }

    CCB::running->setFinished(true);
    CCB::yield();
    800017f8:	00001097          	auipc	ra,0x1
    800017fc:	83c080e7          	jalr	-1988(ra) # 80002034 <_ZN3CCB5yieldEv>

}
    80001800:	01813083          	ld	ra,24(sp)
    80001804:	01013403          	ld	s0,16(sp)
    80001808:	00813483          	ld	s1,8(sp)
    8000180c:	00013903          	ld	s2,0(sp)
    80001810:	02010113          	addi	sp,sp,32
    80001814:	00008067          	ret

0000000080001818 <_Z11workerBodyBv>:

void workerBodyB()
{
    80001818:	fe010113          	addi	sp,sp,-32
    8000181c:	00113c23          	sd	ra,24(sp)
    80001820:	00813823          	sd	s0,16(sp)
    80001824:	00913423          	sd	s1,8(sp)
    80001828:	01213023          	sd	s2,0(sp)
    8000182c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80001830:	00a00493          	li	s1,10
    80001834:	0380006f          	j	8000186c <_Z11workerBodyBv+0x54>
    for (; i < 13; i++)
    {
        printString("B: i=");
    80001838:	00004517          	auipc	a0,0x4
    8000183c:	81850513          	addi	a0,a0,-2024 # 80005050 <CONSOLE_STATUS+0x40>
    80001840:	00001097          	auipc	ra,0x1
    80001844:	3c4080e7          	jalr	964(ra) # 80002c04 <_Z11printStringPKc>
        printInteger(i);
    80001848:	00048513          	mv	a0,s1
    8000184c:	00001097          	auipc	ra,0x1
    80001850:	43c080e7          	jalr	1084(ra) # 80002c88 <_Z12printIntegerm>
        printString("\n");
    80001854:	00004517          	auipc	a0,0x4
    80001858:	98450513          	addi	a0,a0,-1660 # 800051d8 <CONSOLE_STATUS+0x1c8>
    8000185c:	00001097          	auipc	ra,0x1
    80001860:	3a8080e7          	jalr	936(ra) # 80002c04 <_Z11printStringPKc>
    for (; i < 13; i++)
    80001864:	0014849b          	addiw	s1,s1,1
    80001868:	0ff4f493          	andi	s1,s1,255
    8000186c:	00c00793          	li	a5,12
    80001870:	fc97f4e3          	bgeu	a5,s1,80001838 <_Z11workerBodyBv+0x20>
    }

    printString("B: yield\n");
    80001874:	00003517          	auipc	a0,0x3
    80001878:	7e450513          	addi	a0,a0,2020 # 80005058 <CONSOLE_STATUS+0x48>
    8000187c:	00001097          	auipc	ra,0x1
    80001880:	388080e7          	jalr	904(ra) # 80002c04 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80001884:	00500313          	li	t1,5
    CCB::yield();
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	7ac080e7          	jalr	1964(ra) # 80002034 <_ZN3CCB5yieldEv>

    uint64 result = fibonacci(16);
    80001890:	01000513          	li	a0,16
    80001894:	00000097          	auipc	ra,0x0
    80001898:	dc0080e7          	jalr	-576(ra) # 80001654 <_ZL9fibonaccim>
    8000189c:	00050913          	mv	s2,a0
    printString("B: fibonaci=");
    800018a0:	00003517          	auipc	a0,0x3
    800018a4:	7c850513          	addi	a0,a0,1992 # 80005068 <CONSOLE_STATUS+0x58>
    800018a8:	00001097          	auipc	ra,0x1
    800018ac:	35c080e7          	jalr	860(ra) # 80002c04 <_Z11printStringPKc>
    printInteger(result);
    800018b0:	00090513          	mv	a0,s2
    800018b4:	00001097          	auipc	ra,0x1
    800018b8:	3d4080e7          	jalr	980(ra) # 80002c88 <_Z12printIntegerm>
    printString("\n");
    800018bc:	00004517          	auipc	a0,0x4
    800018c0:	91c50513          	addi	a0,a0,-1764 # 800051d8 <CONSOLE_STATUS+0x1c8>
    800018c4:	00001097          	auipc	ra,0x1
    800018c8:	340080e7          	jalr	832(ra) # 80002c04 <_Z11printStringPKc>
    800018cc:	0380006f          	j	80001904 <_Z11workerBodyBv+0xec>

    for (; i < 16; i++)
    {
        printString("B: i=");
    800018d0:	00003517          	auipc	a0,0x3
    800018d4:	78050513          	addi	a0,a0,1920 # 80005050 <CONSOLE_STATUS+0x40>
    800018d8:	00001097          	auipc	ra,0x1
    800018dc:	32c080e7          	jalr	812(ra) # 80002c04 <_Z11printStringPKc>
        printInteger(i);
    800018e0:	00048513          	mv	a0,s1
    800018e4:	00001097          	auipc	ra,0x1
    800018e8:	3a4080e7          	jalr	932(ra) # 80002c88 <_Z12printIntegerm>
        printString("\n");
    800018ec:	00004517          	auipc	a0,0x4
    800018f0:	8ec50513          	addi	a0,a0,-1812 # 800051d8 <CONSOLE_STATUS+0x1c8>
    800018f4:	00001097          	auipc	ra,0x1
    800018f8:	310080e7          	jalr	784(ra) # 80002c04 <_Z11printStringPKc>
    for (; i < 16; i++)
    800018fc:	0014849b          	addiw	s1,s1,1
    80001900:	0ff4f493          	andi	s1,s1,255
    80001904:	00f00793          	li	a5,15
    80001908:	fc97f4e3          	bgeu	a5,s1,800018d0 <_Z11workerBodyBv+0xb8>
    8000190c:	00005797          	auipc	a5,0x5
    80001910:	8ec7b783          	ld	a5,-1812(a5) # 800061f8 <_ZN3CCB7runningE>
    80001914:	00100713          	li	a4,1
    80001918:	02e78823          	sb	a4,48(a5)
    }

    CCB::running->setFinished(true);
    CCB::yield();
    8000191c:	00000097          	auipc	ra,0x0
    80001920:	718080e7          	jalr	1816(ra) # 80002034 <_ZN3CCB5yieldEv>
    80001924:	01813083          	ld	ra,24(sp)
    80001928:	01013403          	ld	s0,16(sp)
    8000192c:	00813483          	ld	s1,8(sp)
    80001930:	00013903          	ld	s2,0(sp)
    80001934:	02010113          	addi	sp,sp,32
    80001938:	00008067          	ret

000000008000193c <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(CCB *tren) {
    readyCoroutineQueue.addLast(tren);
}
    8000193c:	ff010113          	addi	sp,sp,-16
    80001940:	00813423          	sd	s0,8(sp)
    80001944:	01010413          	addi	s0,sp,16
    80001948:	00100793          	li	a5,1
    8000194c:	00f50863          	beq	a0,a5,8000195c <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001950:	00813403          	ld	s0,8(sp)
    80001954:	01010113          	addi	sp,sp,16
    80001958:	00008067          	ret
    8000195c:	000107b7          	lui	a5,0x10
    80001960:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001964:	fef596e3          	bne	a1,a5,80001950 <_Z41__static_initialization_and_destruction_0ii+0x14>
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80001968:	00005797          	auipc	a5,0x5
    8000196c:	8e878793          	addi	a5,a5,-1816 # 80006250 <_ZN9Scheduler19readyCoroutineQueueE>
    80001970:	0007b023          	sd	zero,0(a5)
    80001974:	0007b423          	sd	zero,8(a5)
    80001978:	fd9ff06f          	j	80001950 <_Z41__static_initialization_and_destruction_0ii+0x14>

000000008000197c <_ZN9Scheduler3getEv>:
CCB *Scheduler::get() {
    8000197c:	fe010113          	addi	sp,sp,-32
    80001980:	00113c23          	sd	ra,24(sp)
    80001984:	00813823          	sd	s0,16(sp)
    80001988:	00913423          	sd	s1,8(sp)
    8000198c:	02010413          	addi	s0,sp,32
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }
    80001990:	00005517          	auipc	a0,0x5
    80001994:	8c053503          	ld	a0,-1856(a0) # 80006250 <_ZN9Scheduler19readyCoroutineQueueE>
    80001998:	04050263          	beqz	a0,800019dc <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    8000199c:	00853783          	ld	a5,8(a0)
    800019a0:	00005717          	auipc	a4,0x5
    800019a4:	8af73823          	sd	a5,-1872(a4) # 80006250 <_ZN9Scheduler19readyCoroutineQueueE>
        if (!head) { tail = 0; }
    800019a8:	02078463          	beqz	a5,800019d0 <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    800019ac:	00053483          	ld	s1,0(a0)
        delete elem;
    800019b0:	00000097          	auipc	ra,0x0
    800019b4:	5dc080e7          	jalr	1500(ra) # 80001f8c <_ZdlPv>
}
    800019b8:	00048513          	mv	a0,s1
    800019bc:	01813083          	ld	ra,24(sp)
    800019c0:	01013403          	ld	s0,16(sp)
    800019c4:	00813483          	ld	s1,8(sp)
    800019c8:	02010113          	addi	sp,sp,32
    800019cc:	00008067          	ret
        if (!head) { tail = 0; }
    800019d0:	00005797          	auipc	a5,0x5
    800019d4:	8807b423          	sd	zero,-1912(a5) # 80006258 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    800019d8:	fd5ff06f          	j	800019ac <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    800019dc:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    800019e0:	fd9ff06f          	j	800019b8 <_ZN9Scheduler3getEv+0x3c>

00000000800019e4 <_ZN9Scheduler3putEP3CCB>:
void Scheduler::put(CCB *tren) {
    800019e4:	fe010113          	addi	sp,sp,-32
    800019e8:	00113c23          	sd	ra,24(sp)
    800019ec:	00813823          	sd	s0,16(sp)
    800019f0:	00913423          	sd	s1,8(sp)
    800019f4:	02010413          	addi	s0,sp,32
    800019f8:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    800019fc:	01000513          	li	a0,16
    80001a00:	00000097          	auipc	ra,0x0
    80001a04:	53c080e7          	jalr	1340(ra) # 80001f3c <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80001a08:	00953023          	sd	s1,0(a0)
    80001a0c:	00053423          	sd	zero,8(a0)
        if (tail)
    80001a10:	00005797          	auipc	a5,0x5
    80001a14:	8487b783          	ld	a5,-1976(a5) # 80006258 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001a18:	02078263          	beqz	a5,80001a3c <_ZN9Scheduler3putEP3CCB+0x58>
            tail->next = elem;
    80001a1c:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001a20:	00005797          	auipc	a5,0x5
    80001a24:	82a7bc23          	sd	a0,-1992(a5) # 80006258 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
}
    80001a28:	01813083          	ld	ra,24(sp)
    80001a2c:	01013403          	ld	s0,16(sp)
    80001a30:	00813483          	ld	s1,8(sp)
    80001a34:	02010113          	addi	sp,sp,32
    80001a38:	00008067          	ret
            head = tail = elem;
    80001a3c:	00005797          	auipc	a5,0x5
    80001a40:	81478793          	addi	a5,a5,-2028 # 80006250 <_ZN9Scheduler19readyCoroutineQueueE>
    80001a44:	00a7b423          	sd	a0,8(a5)
    80001a48:	00a7b023          	sd	a0,0(a5)
    80001a4c:	fddff06f          	j	80001a28 <_ZN9Scheduler3putEP3CCB+0x44>

0000000080001a50 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80001a50:	ff010113          	addi	sp,sp,-16
    80001a54:	00113423          	sd	ra,8(sp)
    80001a58:	00813023          	sd	s0,0(sp)
    80001a5c:	01010413          	addi	s0,sp,16
    80001a60:	000105b7          	lui	a1,0x10
    80001a64:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001a68:	00100513          	li	a0,1
    80001a6c:	00000097          	auipc	ra,0x0
    80001a70:	ed0080e7          	jalr	-304(ra) # 8000193c <_Z41__static_initialization_and_destruction_0ii>
    80001a74:	00813083          	ld	ra,8(sp)
    80001a78:	00013403          	ld	s0,0(sp)
    80001a7c:	01010113          	addi	sp,sp,16
    80001a80:	00008067          	ret

0000000080001a84 <_ZL16idle_thread_bodyPv>:
// Kernel objekti (direktno, ne C API handle-ovi)
_sem* mutex = nullptr;
_sem* console_mutex = nullptr;
bool scheduler_started = false;

static void idle_thread_body(void*) {
    80001a84:	ff010113          	addi	sp,sp,-16
    80001a88:	00113423          	sd	ra,8(sp)
    80001a8c:	00813023          	sd	s0,0(sp)
    80001a90:	01010413          	addi	s0,sp,16
    while (true) {
        CCB::yield();
    80001a94:	00000097          	auipc	ra,0x0
    80001a98:	5a0080e7          	jalr	1440(ra) # 80002034 <_ZN3CCB5yieldEv>
    while (true) {
    80001a9c:	ff9ff06f          	j	80001a94 <_ZL16idle_thread_bodyPv+0x10>

0000000080001aa0 <_ZL15worker_body_decPv>:
        shared_data++;
        mutex->signal();
    }
}

static void worker_body_dec(void* arg) {
    80001aa0:	fd010113          	addi	sp,sp,-48
    80001aa4:	02113423          	sd	ra,40(sp)
    80001aa8:	02813023          	sd	s0,32(sp)
    80001aac:	00913c23          	sd	s1,24(sp)
    80001ab0:	01213823          	sd	s2,16(sp)
    80001ab4:	01313423          	sd	s3,8(sp)
    80001ab8:	03010413          	addi	s0,sp,48
    int limit = *((int*)arg);
    80001abc:	00052983          	lw	s3,0(a0)
    for (int i = 0; i < limit; i++) {
    80001ac0:	00000493          	li	s1,0
    80001ac4:	0534d063          	bge	s1,s3,80001b04 <_ZL15worker_body_decPv+0x64>
        mutex->wait();
    80001ac8:	00004917          	auipc	s2,0x4
    80001acc:	71890913          	addi	s2,s2,1816 # 800061e0 <mutex>
    80001ad0:	00093503          	ld	a0,0(s2)
    80001ad4:	00000097          	auipc	ra,0x0
    80001ad8:	8c8080e7          	jalr	-1848(ra) # 8000139c <_ZN4_sem4waitEv>
        shared_data--;
    80001adc:	00004717          	auipc	a4,0x4
    80001ae0:	70c70713          	addi	a4,a4,1804 # 800061e8 <shared_data>
    80001ae4:	00072783          	lw	a5,0(a4)
    80001ae8:	fff7879b          	addiw	a5,a5,-1
    80001aec:	00f72023          	sw	a5,0(a4)
        mutex->signal();
    80001af0:	00093503          	ld	a0,0(s2)
    80001af4:	00000097          	auipc	ra,0x0
    80001af8:	954080e7          	jalr	-1708(ra) # 80001448 <_ZN4_sem6signalEv>
    for (int i = 0; i < limit; i++) {
    80001afc:	0014849b          	addiw	s1,s1,1
    80001b00:	fc5ff06f          	j	80001ac4 <_ZL15worker_body_decPv+0x24>
    }
}
    80001b04:	02813083          	ld	ra,40(sp)
    80001b08:	02013403          	ld	s0,32(sp)
    80001b0c:	01813483          	ld	s1,24(sp)
    80001b10:	01013903          	ld	s2,16(sp)
    80001b14:	00813983          	ld	s3,8(sp)
    80001b18:	03010113          	addi	sp,sp,48
    80001b1c:	00008067          	ret

0000000080001b20 <_ZL11worker_bodyPv>:
static void worker_body(void* arg) {
    80001b20:	fd010113          	addi	sp,sp,-48
    80001b24:	02113423          	sd	ra,40(sp)
    80001b28:	02813023          	sd	s0,32(sp)
    80001b2c:	00913c23          	sd	s1,24(sp)
    80001b30:	01213823          	sd	s2,16(sp)
    80001b34:	01313423          	sd	s3,8(sp)
    80001b38:	03010413          	addi	s0,sp,48
    int limit = *((int*)arg);
    80001b3c:	00052983          	lw	s3,0(a0)
    for (int i = 0; i < limit; i++) {
    80001b40:	00000493          	li	s1,0
    80001b44:	0534d063          	bge	s1,s3,80001b84 <_ZL11worker_bodyPv+0x64>
        mutex->wait();
    80001b48:	00004917          	auipc	s2,0x4
    80001b4c:	69890913          	addi	s2,s2,1688 # 800061e0 <mutex>
    80001b50:	00093503          	ld	a0,0(s2)
    80001b54:	00000097          	auipc	ra,0x0
    80001b58:	848080e7          	jalr	-1976(ra) # 8000139c <_ZN4_sem4waitEv>
        shared_data++;
    80001b5c:	00004717          	auipc	a4,0x4
    80001b60:	68c70713          	addi	a4,a4,1676 # 800061e8 <shared_data>
    80001b64:	00072783          	lw	a5,0(a4)
    80001b68:	0017879b          	addiw	a5,a5,1
    80001b6c:	00f72023          	sw	a5,0(a4)
        mutex->signal();
    80001b70:	00093503          	ld	a0,0(s2)
    80001b74:	00000097          	auipc	ra,0x0
    80001b78:	8d4080e7          	jalr	-1836(ra) # 80001448 <_ZN4_sem6signalEv>
    for (int i = 0; i < limit; i++) {
    80001b7c:	0014849b          	addiw	s1,s1,1
    80001b80:	fc5ff06f          	j	80001b44 <_ZL11worker_bodyPv+0x24>
}
    80001b84:	02813083          	ld	ra,40(sp)
    80001b88:	02013403          	ld	s0,32(sp)
    80001b8c:	01813483          	ld	s1,24(sp)
    80001b90:	01013903          	ld	s2,16(sp)
    80001b94:	00813983          	ld	s3,8(sp)
    80001b98:	03010113          	addi	sp,sp,48
    80001b9c:	00008067          	ret

0000000080001ba0 <main>:

int main() {
    80001ba0:	fb010113          	addi	sp,sp,-80
    80001ba4:	04113423          	sd	ra,72(sp)
    80001ba8:	04813023          	sd	s0,64(sp)
    80001bac:	02913c23          	sd	s1,56(sp)
    80001bb0:	03213823          	sd	s2,48(sp)
    80001bb4:	03313423          	sd	s3,40(sp)
    80001bb8:	03413023          	sd	s4,32(sp)
    80001bbc:	01513c23          	sd	s5,24(sp)
    80001bc0:	05010413          	addi	s0,sp,80
    // 1) Heap/allocator
    MemoryAllocator::init();
    80001bc4:	00001097          	auipc	ra,0x1
    80001bc8:	924080e7          	jalr	-1756(ra) # 800024e8 <_ZN15MemoryAllocator4initEv>

    // 2) Postavi trap vektor
    Riscv::w_stvec((uint64)&supervisorTrap);
    80001bcc:	fffff797          	auipc	a5,0xfffff
    80001bd0:	43478793          	addi	a5,a5,1076 # 80001000 <supervisorTrap>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001bd4:	10579073          	csrw	stvec,a5

    printString("Kernel initialized.\n");
    80001bd8:	00003517          	auipc	a0,0x3
    80001bdc:	4a050513          	addi	a0,a0,1184 # 80005078 <CONSOLE_STATUS+0x68>
    80001be0:	00001097          	auipc	ra,0x1
    80001be4:	024080e7          	jalr	36(ra) # 80002c04 <_Z11printStringPKc>

    // 3) Kreiraj konzolni mutex pre bilo kog ispisa pod schedulerom
    console_mutex = new _sem(1);
    80001be8:	01800513          	li	a0,24
    80001bec:	00000097          	auipc	ra,0x0
    80001bf0:	8f8080e7          	jalr	-1800(ra) # 800014e4 <_ZN4_semnwEm>
    80001bf4:	00050493          	mv	s1,a0
    80001bf8:	00100593          	li	a1,1
    80001bfc:	fffff097          	auipc	ra,0xfffff
    80001c00:	77c080e7          	jalr	1916(ra) # 80001378 <_ZN4_semC1Ej>
    80001c04:	00004797          	auipc	a5,0x4
    80001c08:	5c97ba23          	sd	s1,1492(a5) # 800061d8 <console_mutex>

    // 4) Kreiraj i registruj main/idle nit pre uključivanja prekida
    CCB* main_thread = CCB::createCoroutine(idle_thread_body, nullptr);
    80001c0c:	00000593          	li	a1,0
    80001c10:	00000517          	auipc	a0,0x0
    80001c14:	e7450513          	addi	a0,a0,-396 # 80001a84 <_ZL16idle_thread_bodyPv>
    80001c18:	00000097          	auipc	ra,0x0
    80001c1c:	4dc080e7          	jalr	1244(ra) # 800020f4 <_ZN3CCB15createCoroutineEPFvPvES0_>
    CCB::running    = main_thread;
    80001c20:	00004717          	auipc	a4,0x4
    80001c24:	5ca73c23          	sd	a0,1496(a4) # 800061f8 <_ZN3CCB7runningE>
    CCB::mainThread = main_thread;
    80001c28:	00004717          	auipc	a4,0x4
    80001c2c:	5ca73423          	sd	a0,1480(a4) # 800061f0 <_ZN3CCB10mainThreadE>
    Scheduler::put(main_thread);
    80001c30:	00000097          	auipc	ra,0x0
    80001c34:	db4080e7          	jalr	-588(ra) # 800019e4 <_ZN9Scheduler3putEP3CCB>
inline void Riscv::ms_sie(uint64 mask) {
    __asm__ volatile ("csrs sie, %[mask]" : : [mask] "r"(mask));
}

inline void Riscv::mc_sie(uint64 mask) {
    __asm__ volatile ("csrc sie, %[mask]" : : [mask] "r"(mask));
    80001c38:	20000793          	li	a5,512
    80001c3c:	1047b073          	csrc	sie,a5
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001c40:	00200793          	li	a5,2
    80001c44:	1007a073          	csrs	sstatus,a5

    // 5) Tek sada uključi prekide (ima valjana running nit i scheduler)
    Riscv::mc_sie(Riscv::SIE_SEIE);
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    printString("Main thread and console mutex created.\n");
    80001c48:	00003517          	auipc	a0,0x3
    80001c4c:	44850513          	addi	a0,a0,1096 # 80005090 <CONSOLE_STATUS+0x80>
    80001c50:	00001097          	auipc	ra,0x1
    80001c54:	fb4080e7          	jalr	-76(ra) # 80002c04 <_Z11printStringPKc>
    printString("Starting semaphore test...\n");
    80001c58:	00003517          	auipc	a0,0x3
    80001c5c:	46050513          	addi	a0,a0,1120 # 800050b8 <CONSOLE_STATUS+0xa8>
    80001c60:	00001097          	auipc	ra,0x1
    80001c64:	fa4080e7          	jalr	-92(ra) # 80002c04 <_Z11printStringPKc>

    // 6) Test mutex i radne niti
    mutex = new _sem(1);
    80001c68:	01800513          	li	a0,24
    80001c6c:	00000097          	auipc	ra,0x0
    80001c70:	878080e7          	jalr	-1928(ra) # 800014e4 <_ZN4_semnwEm>
    80001c74:	00050493          	mv	s1,a0
    80001c78:	00100593          	li	a1,1
    80001c7c:	fffff097          	auipc	ra,0xfffff
    80001c80:	6fc080e7          	jalr	1788(ra) # 80001378 <_ZN4_semC1Ej>
    80001c84:	00004797          	auipc	a5,0x4
    80001c88:	5497be23          	sd	s1,1372(a5) # 800061e0 <mutex>

    int loops = 10; // slobodno menjaš
    80001c8c:	00a00793          	li	a5,10
    80001c90:	faf42e23          	sw	a5,-68(s0)
    CCB *thread1 = CCB::createCoroutine(worker_body, &loops);
    80001c94:	fbc40593          	addi	a1,s0,-68
    80001c98:	00000517          	auipc	a0,0x0
    80001c9c:	e8850513          	addi	a0,a0,-376 # 80001b20 <_ZL11worker_bodyPv>
    80001ca0:	00000097          	auipc	ra,0x0
    80001ca4:	454080e7          	jalr	1108(ra) # 800020f4 <_ZN3CCB15createCoroutineEPFvPvES0_>
    80001ca8:	00050493          	mv	s1,a0
    printString("Thread 1 (inc) created.\n");
    80001cac:	00003517          	auipc	a0,0x3
    80001cb0:	42c50513          	addi	a0,a0,1068 # 800050d8 <CONSOLE_STATUS+0xc8>
    80001cb4:	00001097          	auipc	ra,0x1
    80001cb8:	f50080e7          	jalr	-176(ra) # 80002c04 <_Z11printStringPKc>

    CCB *thread2 = CCB::createCoroutine(worker_body, &loops);
    80001cbc:	fbc40593          	addi	a1,s0,-68
    80001cc0:	00000517          	auipc	a0,0x0
    80001cc4:	e6050513          	addi	a0,a0,-416 # 80001b20 <_ZL11worker_bodyPv>
    80001cc8:	00000097          	auipc	ra,0x0
    80001ccc:	42c080e7          	jalr	1068(ra) # 800020f4 <_ZN3CCB15createCoroutineEPFvPvES0_>
    80001cd0:	00050913          	mv	s2,a0
    printString("Thread 2 (inc) created.\n");
    80001cd4:	00003517          	auipc	a0,0x3
    80001cd8:	42450513          	addi	a0,a0,1060 # 800050f8 <CONSOLE_STATUS+0xe8>
    80001cdc:	00001097          	auipc	ra,0x1
    80001ce0:	f28080e7          	jalr	-216(ra) # 80002c04 <_Z11printStringPKc>

    CCB *thread3 = CCB::createCoroutine(worker_body_dec, &loops);
    80001ce4:	fbc40593          	addi	a1,s0,-68
    80001ce8:	00000517          	auipc	a0,0x0
    80001cec:	db850513          	addi	a0,a0,-584 # 80001aa0 <_ZL15worker_body_decPv>
    80001cf0:	00000097          	auipc	ra,0x0
    80001cf4:	404080e7          	jalr	1028(ra) # 800020f4 <_ZN3CCB15createCoroutineEPFvPvES0_>
    80001cf8:	00050993          	mv	s3,a0
    printString("Thread 3 (dec) created.\n");
    80001cfc:	00003517          	auipc	a0,0x3
    80001d00:	41c50513          	addi	a0,a0,1052 # 80005118 <CONSOLE_STATUS+0x108>
    80001d04:	00001097          	auipc	ra,0x1
    80001d08:	f00080e7          	jalr	-256(ra) # 80002c04 <_Z11printStringPKc>

    CCB *thread4 = CCB::createCoroutine(worker_body_dec, &loops);
    80001d0c:	fbc40593          	addi	a1,s0,-68
    80001d10:	00000517          	auipc	a0,0x0
    80001d14:	d9050513          	addi	a0,a0,-624 # 80001aa0 <_ZL15worker_body_decPv>
    80001d18:	00000097          	auipc	ra,0x0
    80001d1c:	3dc080e7          	jalr	988(ra) # 800020f4 <_ZN3CCB15createCoroutineEPFvPvES0_>
    80001d20:	00050a13          	mv	s4,a0
    printString("Thread 4 (dec) created.\n");
    80001d24:	00003517          	auipc	a0,0x3
    80001d28:	41450513          	addi	a0,a0,1044 # 80005138 <CONSOLE_STATUS+0x128>
    80001d2c:	00001097          	auipc	ra,0x1
    80001d30:	ed8080e7          	jalr	-296(ra) # 80002c04 <_Z11printStringPKc>

    printString("Main thread yielding to workers...\n");
    80001d34:	00003517          	auipc	a0,0x3
    80001d38:	42450513          	addi	a0,a0,1060 # 80005158 <CONSOLE_STATUS+0x148>
    80001d3c:	00001097          	auipc	ra,0x1
    80001d40:	ec8080e7          	jalr	-312(ra) # 80002c04 <_Z11printStringPKc>

    scheduler_started = true;
    80001d44:	00100793          	li	a5,1
    80001d48:	00004717          	auipc	a4,0x4
    80001d4c:	48f70423          	sb	a5,1160(a4) # 800061d0 <scheduler_started>
    80001d50:	00c0006f          	j	80001d5c <main+0x1bc>

    // 7) Čekaj završetak svih niti (ne briši ih u dispatch-u!)
    while (!thread1->isFinished() || !thread2->isFinished()
           || !thread3->isFinished() || !thread4->isFinished()) {
        CCB::yield();
    80001d54:	00000097          	auipc	ra,0x0
    80001d58:	2e0080e7          	jalr	736(ra) # 80002034 <_ZN3CCB5yieldEv>
    bool isFinished() const { return finished; }
    80001d5c:	0304c783          	lbu	a5,48(s1)
           || !thread3->isFinished() || !thread4->isFinished()) {
    80001d60:	fe078ae3          	beqz	a5,80001d54 <main+0x1b4>
    80001d64:	03094783          	lbu	a5,48(s2)
    while (!thread1->isFinished() || !thread2->isFinished()
    80001d68:	fe0786e3          	beqz	a5,80001d54 <main+0x1b4>
    80001d6c:	0309c783          	lbu	a5,48(s3)
           || !thread3->isFinished() || !thread4->isFinished()) {
    80001d70:	fe0782e3          	beqz	a5,80001d54 <main+0x1b4>
    80001d74:	030a4783          	lbu	a5,48(s4)
    80001d78:	fc078ee3          	beqz	a5,80001d54 <main+0x1b4>
    }

    printString("All threads finished.\n");
    80001d7c:	00003517          	auipc	a0,0x3
    80001d80:	40450513          	addi	a0,a0,1028 # 80005180 <CONSOLE_STATUS+0x170>
    80001d84:	00001097          	auipc	ra,0x1
    80001d88:	e80080e7          	jalr	-384(ra) # 80002c04 <_Z11printStringPKc>

    printString("Final value of shared_data: ");
    80001d8c:	00003517          	auipc	a0,0x3
    80001d90:	40c50513          	addi	a0,a0,1036 # 80005198 <CONSOLE_STATUS+0x188>
    80001d94:	00001097          	auipc	ra,0x1
    80001d98:	e70080e7          	jalr	-400(ra) # 80002c04 <_Z11printStringPKc>
    printInteger(shared_data);
    80001d9c:	00004a97          	auipc	s5,0x4
    80001da0:	44ca8a93          	addi	s5,s5,1100 # 800061e8 <shared_data>
    80001da4:	000aa503          	lw	a0,0(s5)
    80001da8:	0005051b          	sext.w	a0,a0
    80001dac:	00001097          	auipc	ra,0x1
    80001db0:	edc080e7          	jalr	-292(ra) # 80002c88 <_Z12printIntegerm>
    printString("\n");
    80001db4:	00003517          	auipc	a0,0x3
    80001db8:	42450513          	addi	a0,a0,1060 # 800051d8 <CONSOLE_STATUS+0x1c8>
    80001dbc:	00001097          	auipc	ra,0x1
    80001dc0:	e48080e7          	jalr	-440(ra) # 80002c04 <_Z11printStringPKc>

    if (shared_data == 0) {
    80001dc4:	000aa783          	lw	a5,0(s5)
    80001dc8:	0007879b          	sext.w	a5,a5
    80001dcc:	12079263          	bnez	a5,80001ef0 <main+0x350>
        printString("SUCCESS: Race condition avoided!\n");
    80001dd0:	00003517          	auipc	a0,0x3
    80001dd4:	3e850513          	addi	a0,a0,1000 # 800051b8 <CONSOLE_STATUS+0x1a8>
    80001dd8:	00001097          	auipc	ra,0x1
    80001ddc:	e2c080e7          	jalr	-468(ra) # 80002c04 <_Z11printStringPKc>
    } else {
        printString("ERROR: Race condition detected!\n");
    }

    // 8) Bezbedno čišćenje: prvo obriši niti (glavna ih više ne dereferencira)
    delete thread1;
    80001de0:	02048063          	beqz	s1,80001e00 <main+0x260>
    ~CCB() {delete[] stack;}
    80001de4:	0184b503          	ld	a0,24(s1)
    80001de8:	00050663          	beqz	a0,80001df4 <main+0x254>
    80001dec:	00000097          	auipc	ra,0x0
    80001df0:	1c8080e7          	jalr	456(ra) # 80001fb4 <_ZdaPv>
    80001df4:	00048513          	mv	a0,s1
    80001df8:	00000097          	auipc	ra,0x0
    80001dfc:	194080e7          	jalr	404(ra) # 80001f8c <_ZdlPv>
    delete thread2;
    80001e00:	02090063          	beqz	s2,80001e20 <main+0x280>
    80001e04:	01893503          	ld	a0,24(s2)
    80001e08:	00050663          	beqz	a0,80001e14 <main+0x274>
    80001e0c:	00000097          	auipc	ra,0x0
    80001e10:	1a8080e7          	jalr	424(ra) # 80001fb4 <_ZdaPv>
    80001e14:	00090513          	mv	a0,s2
    80001e18:	00000097          	auipc	ra,0x0
    80001e1c:	174080e7          	jalr	372(ra) # 80001f8c <_ZdlPv>
    delete thread3;
    80001e20:	02098063          	beqz	s3,80001e40 <main+0x2a0>
    80001e24:	0189b503          	ld	a0,24(s3)
    80001e28:	00050663          	beqz	a0,80001e34 <main+0x294>
    80001e2c:	00000097          	auipc	ra,0x0
    80001e30:	188080e7          	jalr	392(ra) # 80001fb4 <_ZdaPv>
    80001e34:	00098513          	mv	a0,s3
    80001e38:	00000097          	auipc	ra,0x0
    80001e3c:	154080e7          	jalr	340(ra) # 80001f8c <_ZdlPv>
    delete thread4;
    80001e40:	020a0063          	beqz	s4,80001e60 <main+0x2c0>
    80001e44:	018a3503          	ld	a0,24(s4)
    80001e48:	00050663          	beqz	a0,80001e54 <main+0x2b4>
    80001e4c:	00000097          	auipc	ra,0x0
    80001e50:	168080e7          	jalr	360(ra) # 80001fb4 <_ZdaPv>
    80001e54:	000a0513          	mv	a0,s4
    80001e58:	00000097          	auipc	ra,0x0
    80001e5c:	134080e7          	jalr	308(ra) # 80001f8c <_ZdlPv>

    // 9) Završi sa ispisima PRE brisanja console_mutex-a
    printString("Main finished.\n");
    80001e60:	00003517          	auipc	a0,0x3
    80001e64:	3a850513          	addi	a0,a0,936 # 80005208 <CONSOLE_STATUS+0x1f8>
    80001e68:	00001097          	auipc	ra,0x1
    80001e6c:	d9c080e7          	jalr	-612(ra) # 80002c04 <_Z11printStringPKc>

    // Ako želiš, možeš ugasiti “console locking”
    scheduler_started = false;
    80001e70:	00004797          	auipc	a5,0x4
    80001e74:	36078023          	sb	zero,864(a5) # 800061d0 <scheduler_started>

    // 10) Sad je bezbedno obrisati semafore
    delete mutex;
    80001e78:	00004497          	auipc	s1,0x4
    80001e7c:	3684b483          	ld	s1,872(s1) # 800061e0 <mutex>
    80001e80:	00048e63          	beqz	s1,80001e9c <main+0x2fc>
    80001e84:	00048513          	mv	a0,s1
    80001e88:	fffff097          	auipc	ra,0xfffff
    80001e8c:	788080e7          	jalr	1928(ra) # 80001610 <_ZN4_semD1Ev>
    80001e90:	00048513          	mv	a0,s1
    80001e94:	fffff097          	auipc	ra,0xfffff
    80001e98:	678080e7          	jalr	1656(ra) # 8000150c <_ZN4_semdlEPv>
    delete console_mutex;
    80001e9c:	00004497          	auipc	s1,0x4
    80001ea0:	33c4b483          	ld	s1,828(s1) # 800061d8 <console_mutex>
    80001ea4:	00048e63          	beqz	s1,80001ec0 <main+0x320>
    80001ea8:	00048513          	mv	a0,s1
    80001eac:	fffff097          	auipc	ra,0xfffff
    80001eb0:	764080e7          	jalr	1892(ra) # 80001610 <_ZN4_semD1Ev>
    80001eb4:	00048513          	mv	a0,s1
    80001eb8:	fffff097          	auipc	ra,0xfffff
    80001ebc:	654080e7          	jalr	1620(ra) # 8000150c <_ZN4_semdlEPv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001ec0:	00200793          	li	a5,2
    80001ec4:	1007b073          	csrc	sstatus,a5

    // (opcionalno) isključi prekide pre izlaska iz main-a
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80001ec8:	00000513          	li	a0,0
    80001ecc:	04813083          	ld	ra,72(sp)
    80001ed0:	04013403          	ld	s0,64(sp)
    80001ed4:	03813483          	ld	s1,56(sp)
    80001ed8:	03013903          	ld	s2,48(sp)
    80001edc:	02813983          	ld	s3,40(sp)
    80001ee0:	02013a03          	ld	s4,32(sp)
    80001ee4:	01813a83          	ld	s5,24(sp)
    80001ee8:	05010113          	addi	sp,sp,80
    80001eec:	00008067          	ret
        printString("ERROR: Race condition detected!\n");
    80001ef0:	00003517          	auipc	a0,0x3
    80001ef4:	2f050513          	addi	a0,a0,752 # 800051e0 <CONSOLE_STATUS+0x1d0>
    80001ef8:	00001097          	auipc	ra,0x1
    80001efc:	d0c080e7          	jalr	-756(ra) # 80002c04 <_Z11printStringPKc>
    80001f00:	ee1ff06f          	j	80001de0 <main+0x240>
    80001f04:	00050913          	mv	s2,a0
    console_mutex = new _sem(1);
    80001f08:	00048513          	mv	a0,s1
    80001f0c:	fffff097          	auipc	ra,0xfffff
    80001f10:	600080e7          	jalr	1536(ra) # 8000150c <_ZN4_semdlEPv>
    80001f14:	00090513          	mv	a0,s2
    80001f18:	00005097          	auipc	ra,0x5
    80001f1c:	410080e7          	jalr	1040(ra) # 80007328 <_Unwind_Resume>
    80001f20:	00050913          	mv	s2,a0
    mutex = new _sem(1);
    80001f24:	00048513          	mv	a0,s1
    80001f28:	fffff097          	auipc	ra,0xfffff
    80001f2c:	5e4080e7          	jalr	1508(ra) # 8000150c <_ZN4_semdlEPv>
    80001f30:	00090513          	mv	a0,s2
    80001f34:	00005097          	auipc	ra,0x5
    80001f38:	3f4080e7          	jalr	1012(ra) # 80007328 <_Unwind_Resume>

0000000080001f3c <_Znwm>:
#include "../h/MemoryAllocator.hpp"

void *operator new(uint64 n)
{
    80001f3c:	ff010113          	addi	sp,sp,-16
    80001f40:	00113423          	sd	ra,8(sp)
    80001f44:	00813023          	sd	s0,0(sp)
    80001f48:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(n);
    80001f4c:	00001097          	auipc	ra,0x1
    80001f50:	920080e7          	jalr	-1760(ra) # 8000286c <_ZN15MemoryAllocator9mem_allocEm>
}
    80001f54:	00813083          	ld	ra,8(sp)
    80001f58:	00013403          	ld	s0,0(sp)
    80001f5c:	01010113          	addi	sp,sp,16
    80001f60:	00008067          	ret

0000000080001f64 <_Znam>:

void *operator new[](uint64 n)
{
    80001f64:	ff010113          	addi	sp,sp,-16
    80001f68:	00113423          	sd	ra,8(sp)
    80001f6c:	00813023          	sd	s0,0(sp)
    80001f70:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(n);
    80001f74:	00001097          	auipc	ra,0x1
    80001f78:	8f8080e7          	jalr	-1800(ra) # 8000286c <_ZN15MemoryAllocator9mem_allocEm>
}
    80001f7c:	00813083          	ld	ra,8(sp)
    80001f80:	00013403          	ld	s0,0(sp)
    80001f84:	01010113          	addi	sp,sp,16
    80001f88:	00008067          	ret

0000000080001f8c <_ZdlPv>:

void operator delete(void *p) noexcept
{
    80001f8c:	ff010113          	addi	sp,sp,-16
    80001f90:	00113423          	sd	ra,8(sp)
    80001f94:	00813023          	sd	s0,0(sp)
    80001f98:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(p);
    80001f9c:	00001097          	auipc	ra,0x1
    80001fa0:	a9c080e7          	jalr	-1380(ra) # 80002a38 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001fa4:	00813083          	ld	ra,8(sp)
    80001fa8:	00013403          	ld	s0,0(sp)
    80001fac:	01010113          	addi	sp,sp,16
    80001fb0:	00008067          	ret

0000000080001fb4 <_ZdaPv>:

void operator delete[](void *p) noexcept
{
    80001fb4:	ff010113          	addi	sp,sp,-16
    80001fb8:	00113423          	sd	ra,8(sp)
    80001fbc:	00813023          	sd	s0,0(sp)
    80001fc0:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(p);
    80001fc4:	00001097          	auipc	ra,0x1
    80001fc8:	a74080e7          	jalr	-1420(ra) # 80002a38 <_ZN15MemoryAllocator8mem_freeEPv>
    80001fcc:	00813083          	ld	ra,8(sp)
    80001fd0:	00013403          	ld	s0,0(sp)
    80001fd4:	01010113          	addi	sp,sp,16
    80001fd8:	00008067          	ret

0000000080001fdc <_ZN3CCB16coroutineWrapperEv>:
        Scheduler::put(ccb);
    }
    return ccb;
}

void CCB::coroutineWrapper() {
    80001fdc:	ff010113          	addi	sp,sp,-16
    80001fe0:	00113423          	sd	ra,8(sp)
    80001fe4:	00813023          	sd	s0,0(sp)
    80001fe8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001fec:	00200793          	li	a5,2
    80001ff0:	1007a073          	csrs	sstatus,a5
    // Uključi prekide, nastavi normalno
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    if (running->body) {
    80001ff4:	00004717          	auipc	a4,0x4
    80001ff8:	20473703          	ld	a4,516(a4) # 800061f8 <_ZN3CCB7runningE>
    80001ffc:	00873783          	ld	a5,8(a4)
    80002000:	00078663          	beqz	a5,8000200c <_ZN3CCB16coroutineWrapperEv+0x30>
        running->body(running->arg);
    80002004:	01073503          	ld	a0,16(a4)
    80002008:	000780e7          	jalr	a5
        CCB::finished = finished;
    8000200c:	00004797          	auipc	a5,0x4
    80002010:	1ec7b783          	ld	a5,492(a5) # 800061f8 <_ZN3CCB7runningE>
    80002014:	00100713          	li	a4,1
    80002018:	02e78823          	sb	a4,48(a5)
    }

    running->setFinished(true);
    thread_exit(); // ne vraća se
    8000201c:	fffff097          	auipc	ra,0xfffff
    80002020:	1d0080e7          	jalr	464(ra) # 800011ec <_Z11thread_exitv>
}
    80002024:	00813083          	ld	ra,8(sp)
    80002028:	00013403          	ld	s0,0(sp)
    8000202c:	01010113          	addi	sp,sp,16
    80002030:	00008067          	ret

0000000080002034 <_ZN3CCB5yieldEv>:
void CCB::yield() {
    80002034:	ff010113          	addi	sp,sp,-16
    80002038:	00113423          	sd	ra,8(sp)
    8000203c:	00813023          	sd	s0,0(sp)
    80002040:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002044:	fffff097          	auipc	ra,0xfffff
    80002048:	1e4080e7          	jalr	484(ra) # 80001228 <_Z15thread_dispatchv>
}
    8000204c:	00813083          	ld	ra,8(sp)
    80002050:	00013403          	ld	s0,0(sp)
    80002054:	01010113          	addi	sp,sp,16
    80002058:	00008067          	ret

000000008000205c <_ZN3CCB8dispatchEv>:
void CCB::dispatch() {
    8000205c:	fe010113          	addi	sp,sp,-32
    80002060:	00113c23          	sd	ra,24(sp)
    80002064:	00813823          	sd	s0,16(sp)
    80002068:	00913423          	sd	s1,8(sp)
    8000206c:	02010413          	addi	s0,sp,32
    CCB *old = running;
    80002070:	00004497          	auipc	s1,0x4
    80002074:	1884b483          	ld	s1,392(s1) # 800061f8 <_ZN3CCB7runningE>
    if (old != CCB::mainThread && !old->isFinished()) {
    80002078:	00004797          	auipc	a5,0x4
    8000207c:	1787b783          	ld	a5,376(a5) # 800061f0 <_ZN3CCB10mainThreadE>
    80002080:	00978663          	beq	a5,s1,8000208c <_ZN3CCB8dispatchEv+0x30>
    bool isFinished() const { return finished; }
    80002084:	0304c783          	lbu	a5,48(s1)
    80002088:	04078463          	beqz	a5,800020d0 <_ZN3CCB8dispatchEv+0x74>
    running = Scheduler::get();
    8000208c:	00000097          	auipc	ra,0x0
    80002090:	8f0080e7          	jalr	-1808(ra) # 8000197c <_ZN9Scheduler3getEv>
    80002094:	00004797          	auipc	a5,0x4
    80002098:	16a7b223          	sd	a0,356(a5) # 800061f8 <_ZN3CCB7runningE>
    if (!running) running = CCB::mainThread;
    8000209c:	04050263          	beqz	a0,800020e0 <_ZN3CCB8dispatchEv+0x84>
    if (old != running) {
    800020a0:	00004597          	auipc	a1,0x4
    800020a4:	1585b583          	ld	a1,344(a1) # 800061f8 <_ZN3CCB7runningE>
    800020a8:	00958a63          	beq	a1,s1,800020bc <_ZN3CCB8dispatchEv+0x60>
        contextSwitch(old->getContext(), running->getContext());
    800020ac:	02058593          	addi	a1,a1,32
    800020b0:	02048513          	addi	a0,s1,32
    800020b4:	fffff097          	auipc	ra,0xfffff
    800020b8:	054080e7          	jalr	84(ra) # 80001108 <_ZN3CCB13contextSwitchEPNS_7ContextES1_>
}
    800020bc:	01813083          	ld	ra,24(sp)
    800020c0:	01013403          	ld	s0,16(sp)
    800020c4:	00813483          	ld	s1,8(sp)
    800020c8:	02010113          	addi	sp,sp,32
    800020cc:	00008067          	ret
        Scheduler::put(old);
    800020d0:	00048513          	mv	a0,s1
    800020d4:	00000097          	auipc	ra,0x0
    800020d8:	910080e7          	jalr	-1776(ra) # 800019e4 <_ZN9Scheduler3putEP3CCB>
    800020dc:	fb1ff06f          	j	8000208c <_ZN3CCB8dispatchEv+0x30>
    if (!running) running = CCB::mainThread;
    800020e0:	00004797          	auipc	a5,0x4
    800020e4:	1107b783          	ld	a5,272(a5) # 800061f0 <_ZN3CCB10mainThreadE>
    800020e8:	00004717          	auipc	a4,0x4
    800020ec:	10f73823          	sd	a5,272(a4) # 800061f8 <_ZN3CCB7runningE>
    800020f0:	fb1ff06f          	j	800020a0 <_ZN3CCB8dispatchEv+0x44>

00000000800020f4 <_ZN3CCB15createCoroutineEPFvPvES0_>:
CCB* CCB::createCoroutine(Body body, void* arg) {
    800020f4:	fd010113          	addi	sp,sp,-48
    800020f8:	02113423          	sd	ra,40(sp)
    800020fc:	02813023          	sd	s0,32(sp)
    80002100:	00913c23          	sd	s1,24(sp)
    80002104:	01213823          	sd	s2,16(sp)
    80002108:	01313423          	sd	s3,8(sp)
    8000210c:	03010413          	addi	s0,sp,48
    80002110:	00050913          	mv	s2,a0
    80002114:	00058993          	mv	s3,a1
    CCB* ccb = new CCB(body, arg);
    80002118:	03800513          	li	a0,56
    8000211c:	00000097          	auipc	ra,0x0
    80002120:	e20080e7          	jalr	-480(ra) # 80001f3c <_Znwm>
    80002124:	00050493          	mv	s1,a0
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
            context({
                            body != nullptr ? (uint64)&coroutineWrapper : 0,
                            stack != nullptr ? (uint64)&stack[STACK_SIZE] : 0
                    }),
            finished(false)
    80002128:	00053023          	sd	zero,0(a0)
    8000212c:	01253423          	sd	s2,8(a0)
    80002130:	01353823          	sd	s3,16(a0)
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    80002134:	00090a63          	beqz	s2,80002148 <_ZN3CCB15createCoroutineEPFvPvES0_+0x54>
    80002138:	00002537          	lui	a0,0x2
    8000213c:	00000097          	auipc	ra,0x0
    80002140:	e28080e7          	jalr	-472(ra) # 80001f64 <_Znam>
    80002144:	0080006f          	j	8000214c <_ZN3CCB15createCoroutineEPFvPvES0_+0x58>
    80002148:	00000513          	li	a0,0
            finished(false)
    8000214c:	00a4bc23          	sd	a0,24(s1)
                            body != nullptr ? (uint64)&coroutineWrapper : 0,
    80002150:	02090c63          	beqz	s2,80002188 <_ZN3CCB15createCoroutineEPFvPvES0_+0x94>
    80002154:	00000797          	auipc	a5,0x0
    80002158:	e8878793          	addi	a5,a5,-376 # 80001fdc <_ZN3CCB16coroutineWrapperEv>
            finished(false)
    8000215c:	02f4b023          	sd	a5,32(s1)
                            stack != nullptr ? (uint64)&stack[STACK_SIZE] : 0
    80002160:	02050863          	beqz	a0,80002190 <_ZN3CCB15createCoroutineEPFvPvES0_+0x9c>
    80002164:	000027b7          	lui	a5,0x2
    80002168:	00f50533          	add	a0,a0,a5
            finished(false)
    8000216c:	02a4b423          	sd	a0,40(s1)
    80002170:	02048823          	sb	zero,48(s1)
    {
        if (body != nullptr) Scheduler::put(this);
    80002174:	02090263          	beqz	s2,80002198 <_ZN3CCB15createCoroutineEPFvPvES0_+0xa4>
    80002178:	00048513          	mv	a0,s1
    8000217c:	00000097          	auipc	ra,0x0
    80002180:	868080e7          	jalr	-1944(ra) # 800019e4 <_ZN9Scheduler3putEP3CCB>
    80002184:	0140006f          	j	80002198 <_ZN3CCB15createCoroutineEPFvPvES0_+0xa4>
                            body != nullptr ? (uint64)&coroutineWrapper : 0,
    80002188:	00000793          	li	a5,0
    8000218c:	fd1ff06f          	j	8000215c <_ZN3CCB15createCoroutineEPFvPvES0_+0x68>
                            stack != nullptr ? (uint64)&stack[STACK_SIZE] : 0
    80002190:	00000513          	li	a0,0
    80002194:	fd9ff06f          	j	8000216c <_ZN3CCB15createCoroutineEPFvPvES0_+0x78>
    if (ccb && body) {
    80002198:	00048a63          	beqz	s1,800021ac <_ZN3CCB15createCoroutineEPFvPvES0_+0xb8>
    8000219c:	00090863          	beqz	s2,800021ac <_ZN3CCB15createCoroutineEPFvPvES0_+0xb8>
        Scheduler::put(ccb);
    800021a0:	00048513          	mv	a0,s1
    800021a4:	00000097          	auipc	ra,0x0
    800021a8:	840080e7          	jalr	-1984(ra) # 800019e4 <_ZN9Scheduler3putEP3CCB>
}
    800021ac:	00048513          	mv	a0,s1
    800021b0:	02813083          	ld	ra,40(sp)
    800021b4:	02013403          	ld	s0,32(sp)
    800021b8:	01813483          	ld	s1,24(sp)
    800021bc:	01013903          	ld	s2,16(sp)
    800021c0:	00813983          	ld	s3,8(sp)
    800021c4:	03010113          	addi	sp,sp,48
    800021c8:	00008067          	ret
    800021cc:	00050913          	mv	s2,a0
    CCB* ccb = new CCB(body, arg);
    800021d0:	00048513          	mv	a0,s1
    800021d4:	00000097          	auipc	ra,0x0
    800021d8:	db8080e7          	jalr	-584(ra) # 80001f8c <_ZdlPv>
    800021dc:	00090513          	mv	a0,s2
    800021e0:	00005097          	auipc	ra,0x5
    800021e4:	148080e7          	jalr	328(ra) # 80007328 <_Unwind_Resume>

00000000800021e8 <_ZN5Riscv10popSppSpieEv>:
    SEM_CLOSE = 0x22,
    SEM_WAIT = 0x23,
    SEM_SIGNAL = 0x24
};

void Riscv::popSppSpie() {
    800021e8:	ff010113          	addi	sp,sp,-16
    800021ec:	00813423          	sd	s0,8(sp)
    800021f0:	01010413          	addi	s0,sp,16
    // VraÄ‡a se na adresu saÄuvanu u sepc, menja reÅ¾im i dozvoljava prekide
    __asm__ volatile("csrw sepc, ra");
    800021f4:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    800021f8:	10200073          	sret
}
    800021fc:	00813403          	ld	s0,8(sp)
    80002200:	01010113          	addi	sp,sp,16
    80002204:	00008067          	ret

0000000080002208 <_ZN5Riscv20handleSupervisorTrapEv>:

// promeni potpis:
// riscv.hpp: promeni potpis na:
// static uint64 handleSupervisorTrap();

uint64 Riscv::handleSupervisorTrap() {
    80002208:	fb010113          	addi	sp,sp,-80
    8000220c:	04113423          	sd	ra,72(sp)
    80002210:	04813023          	sd	s0,64(sp)
    80002214:	02913c23          	sd	s1,56(sp)
    80002218:	03213823          	sd	s2,48(sp)
    8000221c:	03313423          	sd	s3,40(sp)
    80002220:	03413023          	sd	s4,32(sp)
    80002224:	05010413          	addi	s0,sp,80
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002228:	142027f3          	csrr	a5,scause
    8000222c:	fcf43023          	sd	a5,-64(s0)
    return scause;
    80002230:	fc043903          	ld	s2,-64(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002234:	141027f3          	csrr	a5,sepc
    80002238:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    8000223c:	fb843483          	ld	s1,-72(s0)
    uint64 scause = r_scause();
    uint64 sepc   = r_sepc();

    if (scause == 0x08 || scause == 0x09) { // ecall from U/S
    80002240:	ff890713          	addi	a4,s2,-8
    80002244:	00100793          	li	a5,1
    80002248:	0ae7f863          	bgeu	a5,a4,800022f8 <_ZN5Riscv20handleSupervisorTrapEv+0xf0>
        }
        // nepoznat ecall:
        w_sepc(sepc + 4);
        return 0;

    } else if (scause == 0x8000000000000001UL) {  // timer/software interrupt
    8000224c:	fff00793          	li	a5,-1
    80002250:	03f79793          	slli	a5,a5,0x3f
    80002254:	00178793          	addi	a5,a5,1 # 2001 <_entry-0x7fffdfff>
    80002258:	24f90e63          	beq	s2,a5,800024b4 <_ZN5Riscv20handleSupervisorTrapEv+0x2ac>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    8000225c:	143027f3          	csrr	a5,stval
    80002260:	fcf43423          	sd	a5,-56(s0)
    return stval;
    80002264:	fc843983          	ld	s3,-56(s0)
        CCB::dispatch();   // promena konteksta
        return 1;          // ret

    } else {
        uint64 stval = r_stval();
        printString("Neocekivani prekid! scause: "); printInteger(scause);
    80002268:	00003517          	auipc	a0,0x3
    8000226c:	fb050513          	addi	a0,a0,-80 # 80005218 <CONSOLE_STATUS+0x208>
    80002270:	00001097          	auipc	ra,0x1
    80002274:	994080e7          	jalr	-1644(ra) # 80002c04 <_Z11printStringPKc>
    80002278:	00090513          	mv	a0,s2
    8000227c:	00001097          	auipc	ra,0x1
    80002280:	a0c080e7          	jalr	-1524(ra) # 80002c88 <_Z12printIntegerm>
        printString(", sepc: "); printInteger(sepc);
    80002284:	00003517          	auipc	a0,0x3
    80002288:	fb450513          	addi	a0,a0,-76 # 80005238 <CONSOLE_STATUS+0x228>
    8000228c:	00001097          	auipc	ra,0x1
    80002290:	978080e7          	jalr	-1672(ra) # 80002c04 <_Z11printStringPKc>
    80002294:	00048513          	mv	a0,s1
    80002298:	00001097          	auipc	ra,0x1
    8000229c:	9f0080e7          	jalr	-1552(ra) # 80002c88 <_Z12printIntegerm>
        printString(", stval: "); printInteger(stval); printString("\n");
    800022a0:	00003517          	auipc	a0,0x3
    800022a4:	fa850513          	addi	a0,a0,-88 # 80005248 <CONSOLE_STATUS+0x238>
    800022a8:	00001097          	auipc	ra,0x1
    800022ac:	95c080e7          	jalr	-1700(ra) # 80002c04 <_Z11printStringPKc>
    800022b0:	00098513          	mv	a0,s3
    800022b4:	00001097          	auipc	ra,0x1
    800022b8:	9d4080e7          	jalr	-1580(ra) # 80002c88 <_Z12printIntegerm>
    800022bc:	00003517          	auipc	a0,0x3
    800022c0:	f1c50513          	addi	a0,a0,-228 # 800051d8 <CONSOLE_STATUS+0x1c8>
    800022c4:	00001097          	auipc	ra,0x1
    800022c8:	940080e7          	jalr	-1728(ra) # 80002c04 <_Z11printStringPKc>
        w_sepc(sepc + 4);
    800022cc:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800022d0:	14149073          	csrw	sepc,s1
        return 0;          // sret
    800022d4:	00000513          	li	a0,0
    }
}
    800022d8:	04813083          	ld	ra,72(sp)
    800022dc:	04013403          	ld	s0,64(sp)
    800022e0:	03813483          	ld	s1,56(sp)
    800022e4:	03013903          	ld	s2,48(sp)
    800022e8:	02813983          	ld	s3,40(sp)
    800022ec:	02013a03          	ld	s4,32(sp)
    800022f0:	05010113          	addi	sp,sp,80
    800022f4:	00008067          	ret
        __asm__ volatile("mv %0, a0" : "=r"(code));
    800022f8:	00050793          	mv	a5,a0
        __asm__ volatile("mv %0, a1" : "=r"(a1));
    800022fc:	00058913          	mv	s2,a1
        __asm__ volatile("mv %0, a2" : "=r"(a2));
    80002300:	00060513          	mv	a0,a2
        __asm__ volatile("mv %0, a3" : "=r"(a3));
    80002304:	00068593          	mv	a1,a3
        __asm__ volatile("mv %0, a4" : "=r"(a4));
    80002308:	00070713          	mv	a4,a4
        switch (code) {
    8000230c:	02400713          	li	a4,36
    80002310:	18f76a63          	bltu	a4,a5,800024a4 <_ZN5Riscv20handleSupervisorTrapEv+0x29c>
    80002314:	00279793          	slli	a5,a5,0x2
    80002318:	00003717          	auipc	a4,0x3
    8000231c:	f3c70713          	addi	a4,a4,-196 # 80005254 <CONSOLE_STATUS+0x244>
    80002320:	00e787b3          	add	a5,a5,a4
    80002324:	0007a783          	lw	a5,0(a5)
    80002328:	00e787b3          	add	a5,a5,a4
    8000232c:	00078067          	jr	a5
                void* ret = MemoryAllocator::mem_alloc((size_t)a1);
    80002330:	00090513          	mv	a0,s2
    80002334:	00000097          	auipc	ra,0x0
    80002338:	538080e7          	jalr	1336(ra) # 8000286c <_ZN15MemoryAllocator9mem_allocEm>
                __asm__ volatile("mv a0, %0" : : "r"(ret));
    8000233c:	00050513          	mv	a0,a0
                w_sepc(sepc + 4);
    80002340:	00448493          	addi	s1,s1,4
    80002344:	14149073          	csrw	sepc,s1
                return 0;
    80002348:	00000513          	li	a0,0
    8000234c:	f8dff06f          	j	800022d8 <_ZN5Riscv20handleSupervisorTrapEv+0xd0>
                int ret = MemoryAllocator::mem_free((void*)a1);
    80002350:	00090513          	mv	a0,s2
    80002354:	00000097          	auipc	ra,0x0
    80002358:	6e4080e7          	jalr	1764(ra) # 80002a38 <_ZN15MemoryAllocator8mem_freeEPv>
                __asm__ volatile("mv a0, %0" : : "r"((uint64)ret));
    8000235c:	00050513          	mv	a0,a0
                w_sepc(sepc + 4);
    80002360:	00448493          	addi	s1,s1,4
    80002364:	14149073          	csrw	sepc,s1
                return 0;
    80002368:	00000513          	li	a0,0
    8000236c:	f6dff06f          	j	800022d8 <_ZN5Riscv20handleSupervisorTrapEv+0xd0>
                *handle = CCB::createCoroutine(start_routine, arg);
    80002370:	00000097          	auipc	ra,0x0
    80002374:	d84080e7          	jalr	-636(ra) # 800020f4 <_ZN3CCB15createCoroutineEPFvPvES0_>
    80002378:	00a93023          	sd	a0,0(s2)
                uint64 ret = (*handle) ? 0 : (uint64)-1;
    8000237c:	00050e63          	beqz	a0,80002398 <_ZN5Riscv20handleSupervisorTrapEv+0x190>
    80002380:	00000793          	li	a5,0
                __asm__ volatile("mv a0, %0" : : "r"(ret));
    80002384:	00078513          	mv	a0,a5
                w_sepc(sepc + 4);
    80002388:	00448493          	addi	s1,s1,4
    8000238c:	14149073          	csrw	sepc,s1
                return 0;
    80002390:	00000513          	li	a0,0
    80002394:	f45ff06f          	j	800022d8 <_ZN5Riscv20handleSupervisorTrapEv+0xd0>
                uint64 ret = (*handle) ? 0 : (uint64)-1;
    80002398:	fff00793          	li	a5,-1
    8000239c:	fe9ff06f          	j	80002384 <_ZN5Riscv20handleSupervisorTrapEv+0x17c>
                CCB::dispatch();  // promenjen kontekst
    800023a0:	00000097          	auipc	ra,0x0
    800023a4:	cbc080e7          	jalr	-836(ra) # 8000205c <_ZN3CCB8dispatchEv>
                return 1;         // ret
    800023a8:	00100513          	li	a0,1
    800023ac:	f2dff06f          	j	800022d8 <_ZN5Riscv20handleSupervisorTrapEv+0xd0>
        CCB::finished = finished;
    800023b0:	00004797          	auipc	a5,0x4
    800023b4:	e487b783          	ld	a5,-440(a5) # 800061f8 <_ZN3CCB7runningE>
    800023b8:	00100713          	li	a4,1
    800023bc:	02e78823          	sb	a4,48(a5)
                CCB::dispatch();  // promenjen kontekst
    800023c0:	00000097          	auipc	ra,0x0
    800023c4:	c9c080e7          	jalr	-868(ra) # 8000205c <_ZN3CCB8dispatchEv>
                return 1;         // ret
    800023c8:	00100513          	li	a0,1
    800023cc:	f0dff06f          	j	800022d8 <_ZN5Riscv20handleSupervisorTrapEv+0xd0>
                unsigned init = (unsigned)a2;
    800023d0:	0005099b          	sext.w	s3,a0
                *handle = new _sem(init);
    800023d4:	01800513          	li	a0,24
    800023d8:	fffff097          	auipc	ra,0xfffff
    800023dc:	10c080e7          	jalr	268(ra) # 800014e4 <_ZN4_semnwEm>
    800023e0:	00050a13          	mv	s4,a0
    800023e4:	00098593          	mv	a1,s3
    800023e8:	fffff097          	auipc	ra,0xfffff
    800023ec:	f90080e7          	jalr	-112(ra) # 80001378 <_ZN4_semC1Ej>
    800023f0:	01493023          	sd	s4,0(s2)
                uint64 ret = (*handle) ? 0 : (uint64)-1;
    800023f4:	000a0e63          	beqz	s4,80002410 <_ZN5Riscv20handleSupervisorTrapEv+0x208>
    800023f8:	00000793          	li	a5,0
                __asm__ volatile("mv a0, %0" : : "r"(ret));
    800023fc:	00078513          	mv	a0,a5
                w_sepc(sepc + 4);
    80002400:	00448493          	addi	s1,s1,4
    80002404:	14149073          	csrw	sepc,s1
                return 0;
    80002408:	00000513          	li	a0,0
    8000240c:	ecdff06f          	j	800022d8 <_ZN5Riscv20handleSupervisorTrapEv+0xd0>
                uint64 ret = (*handle) ? 0 : (uint64)-1;
    80002410:	fff00793          	li	a5,-1
    80002414:	fe9ff06f          	j	800023fc <_ZN5Riscv20handleSupervisorTrapEv+0x1f4>
                if (handle) delete handle;
    80002418:	00091c63          	bnez	s2,80002430 <_ZN5Riscv20handleSupervisorTrapEv+0x228>
                __asm__ volatile("li a0, 0");
    8000241c:	00000513          	li	a0,0
                w_sepc(sepc + 4);
    80002420:	00448493          	addi	s1,s1,4
    80002424:	14149073          	csrw	sepc,s1
                return 0;
    80002428:	00000513          	li	a0,0
    8000242c:	eadff06f          	j	800022d8 <_ZN5Riscv20handleSupervisorTrapEv+0xd0>
                if (handle) delete handle;
    80002430:	00090513          	mv	a0,s2
    80002434:	fffff097          	auipc	ra,0xfffff
    80002438:	1dc080e7          	jalr	476(ra) # 80001610 <_ZN4_semD1Ev>
    8000243c:	00090513          	mv	a0,s2
    80002440:	fffff097          	auipc	ra,0xfffff
    80002444:	0cc080e7          	jalr	204(ra) # 8000150c <_ZN4_semdlEPv>
    80002448:	fd5ff06f          	j	8000241c <_ZN5Riscv20handleSupervisorTrapEv+0x214>
                int ret = handle ? handle->wait() : -1;
    8000244c:	00091e63          	bnez	s2,80002468 <_ZN5Riscv20handleSupervisorTrapEv+0x260>
    80002450:	fff00513          	li	a0,-1
                __asm__ volatile("mv a0, %0" : : "r"((uint64)ret));
    80002454:	00050513          	mv	a0,a0
                w_sepc(sepc + 4);
    80002458:	00448493          	addi	s1,s1,4
    8000245c:	14149073          	csrw	sepc,s1
                return 0;
    80002460:	00000513          	li	a0,0
    80002464:	e75ff06f          	j	800022d8 <_ZN5Riscv20handleSupervisorTrapEv+0xd0>
                int ret = handle ? handle->wait() : -1;
    80002468:	00090513          	mv	a0,s2
    8000246c:	fffff097          	auipc	ra,0xfffff
    80002470:	f30080e7          	jalr	-208(ra) # 8000139c <_ZN4_sem4waitEv>
    80002474:	fe1ff06f          	j	80002454 <_ZN5Riscv20handleSupervisorTrapEv+0x24c>
                int ret = handle ? handle->signal() : -1;
    80002478:	00091e63          	bnez	s2,80002494 <_ZN5Riscv20handleSupervisorTrapEv+0x28c>
    8000247c:	fff00513          	li	a0,-1
                __asm__ volatile("mv a0, %0" : : "r"((uint64)ret));
    80002480:	00050513          	mv	a0,a0
                w_sepc(sepc + 4);
    80002484:	00448493          	addi	s1,s1,4
    80002488:	14149073          	csrw	sepc,s1
                return 0;
    8000248c:	00000513          	li	a0,0
    80002490:	e49ff06f          	j	800022d8 <_ZN5Riscv20handleSupervisorTrapEv+0xd0>
                int ret = handle ? handle->signal() : -1;
    80002494:	00090513          	mv	a0,s2
    80002498:	fffff097          	auipc	ra,0xfffff
    8000249c:	fb0080e7          	jalr	-80(ra) # 80001448 <_ZN4_sem6signalEv>
    800024a0:	fe1ff06f          	j	80002480 <_ZN5Riscv20handleSupervisorTrapEv+0x278>
        w_sepc(sepc + 4);
    800024a4:	00448493          	addi	s1,s1,4
    800024a8:	14149073          	csrw	sepc,s1
        return 0;
    800024ac:	00000513          	li	a0,0
    800024b0:	e29ff06f          	j	800022d8 <_ZN5Riscv20handleSupervisorTrapEv+0xd0>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800024b4:	00200793          	li	a5,2
    800024b8:	1447b073          	csrc	sip,a5
        CCB::dispatch();   // promena konteksta
    800024bc:	00000097          	auipc	ra,0x0
    800024c0:	ba0080e7          	jalr	-1120(ra) # 8000205c <_ZN3CCB8dispatchEv>
        return 1;          // ret
    800024c4:	00100513          	li	a0,1
    800024c8:	e11ff06f          	j	800022d8 <_ZN5Riscv20handleSupervisorTrapEv+0xd0>
    800024cc:	00050493          	mv	s1,a0
                *handle = new _sem(init);
    800024d0:	000a0513          	mv	a0,s4
    800024d4:	fffff097          	auipc	ra,0xfffff
    800024d8:	038080e7          	jalr	56(ra) # 8000150c <_ZN4_semdlEPv>
    800024dc:	00048513          	mv	a0,s1
    800024e0:	00005097          	auipc	ra,0x5
    800024e4:	e48080e7          	jalr	-440(ra) # 80007328 <_Unwind_Resume>

00000000800024e8 <_ZN15MemoryAllocator4initEv>:
uint64 MemoryAllocator::heapStart = 0;
uint64 MemoryAllocator::heapEnd = 0;
const size_t HEADER_BLOCKS = MemoryAllocator::sizeToBlocks(sizeof(MemoryAllocator::memBlock));

// Inicijalizuje alokator memorije
void MemoryAllocator::init() {
    800024e8:	ff010113          	addi	sp,sp,-16
    800024ec:	00113423          	sd	ra,8(sp)
    800024f0:	00813023          	sd	s0,0(sp)
    800024f4:	01010413          	addi	s0,sp,16
    printString("--> MA::init() started.\n");
    800024f8:	00003517          	auipc	a0,0x3
    800024fc:	df050513          	addi	a0,a0,-528 # 800052e8 <CONSOLE_STATUS+0x2d8>
    80002500:	00000097          	auipc	ra,0x0
    80002504:	704080e7          	jalr	1796(ra) # 80002c04 <_Z11printStringPKc>
    uint64 start = (uint64)HEAP_START_ADDR;
    uint64 end   = (uint64)HEAP_END_ADDR;

    // Poravnaj granice heap-a
    heapStart = ((start + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    80002508:	00004797          	auipc	a5,0x4
    8000250c:	bb87b783          	ld	a5,-1096(a5) # 800060c0 <HEAP_START_ADDR>
    80002510:	03f78793          	addi	a5,a5,63
    80002514:	fc07f793          	andi	a5,a5,-64
    80002518:	00004717          	auipc	a4,0x4
    8000251c:	cef73c23          	sd	a5,-776(a4) # 80006210 <_ZN15MemoryAllocator9heapStartE>
    heapEnd   = (end / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    80002520:	00004717          	auipc	a4,0x4
    80002524:	b9873703          	ld	a4,-1128(a4) # 800060b8 <HEAP_END_ADDR>
    80002528:	fc077713          	andi	a4,a4,-64
    8000252c:	00004697          	auipc	a3,0x4
    80002530:	cce6be23          	sd	a4,-804(a3) # 80006208 <_ZN15MemoryAllocator7heapEndE>

    if (heapEnd <= heapStart) {
    80002534:	0ee7f663          	bgeu	a5,a4,80002620 <_ZN15MemoryAllocator4initEv+0x138>
        printString("<-- MA::init() failed: No heap space.\n");
        return;
    }

    // Postavi početni slobodan blok
    freeHead = (memBlock*) heapStart;
    80002538:	00004697          	auipc	a3,0x4
    8000253c:	cef6b023          	sd	a5,-800(a3) # 80006218 <_ZN15MemoryAllocator8freeHeadE>
    freeHead->isFree = true;
    80002540:	00100693          	li	a3,1
    80002544:	00d78423          	sb	a3,8(a5)
    freeHead->prev = nullptr;
    80002548:	0007bc23          	sd	zero,24(a5)
    freeHead->next = nullptr;
    8000254c:	0007b823          	sd	zero,16(a5)

    size_t totalBlocks = (heapEnd - heapStart) / MEM_BLOCK_SIZE;
    80002550:	40f70733          	sub	a4,a4,a5
    80002554:	00675713          	srli	a4,a4,0x6
    if (totalBlocks <= HEADER_BLOCKS) {
    80002558:	00004697          	auipc	a3,0x4
    8000255c:	ca86b683          	ld	a3,-856(a3) # 80006200 <_ZL13HEADER_BLOCKS>
    80002560:	0ce6fe63          	bgeu	a3,a4,8000263c <_ZN15MemoryAllocator4initEv+0x154>
        freeHead = nullptr;
        printString("<-- MA::init() failed: Not enough space for header.\n");
        return;
    }
    freeHead->sizeBlocks = totalBlocks - HEADER_BLOCKS;
    80002564:	40d70733          	sub	a4,a4,a3
    80002568:	00e7b023          	sd	a4,0(a5)

    printString("    Heap start: "); printInteger(heapStart); printString("\n");
    8000256c:	00003517          	auipc	a0,0x3
    80002570:	dfc50513          	addi	a0,a0,-516 # 80005368 <CONSOLE_STATUS+0x358>
    80002574:	00000097          	auipc	ra,0x0
    80002578:	690080e7          	jalr	1680(ra) # 80002c04 <_Z11printStringPKc>
    8000257c:	00004517          	auipc	a0,0x4
    80002580:	c9453503          	ld	a0,-876(a0) # 80006210 <_ZN15MemoryAllocator9heapStartE>
    80002584:	00000097          	auipc	ra,0x0
    80002588:	704080e7          	jalr	1796(ra) # 80002c88 <_Z12printIntegerm>
    8000258c:	00003517          	auipc	a0,0x3
    80002590:	c4c50513          	addi	a0,a0,-948 # 800051d8 <CONSOLE_STATUS+0x1c8>
    80002594:	00000097          	auipc	ra,0x0
    80002598:	670080e7          	jalr	1648(ra) # 80002c04 <_Z11printStringPKc>
    printString("    Heap end:   "); printInteger(heapEnd); printString("\n");
    8000259c:	00003517          	auipc	a0,0x3
    800025a0:	de450513          	addi	a0,a0,-540 # 80005380 <CONSOLE_STATUS+0x370>
    800025a4:	00000097          	auipc	ra,0x0
    800025a8:	660080e7          	jalr	1632(ra) # 80002c04 <_Z11printStringPKc>
    800025ac:	00004517          	auipc	a0,0x4
    800025b0:	c5c53503          	ld	a0,-932(a0) # 80006208 <_ZN15MemoryAllocator7heapEndE>
    800025b4:	00000097          	auipc	ra,0x0
    800025b8:	6d4080e7          	jalr	1748(ra) # 80002c88 <_Z12printIntegerm>
    800025bc:	00003517          	auipc	a0,0x3
    800025c0:	c1c50513          	addi	a0,a0,-996 # 800051d8 <CONSOLE_STATUS+0x1c8>
    800025c4:	00000097          	auipc	ra,0x0
    800025c8:	640080e7          	jalr	1600(ra) # 80002c04 <_Z11printStringPKc>
    printString("    Initial free block size (payload): "); printInteger(freeHead->sizeBlocks); printString(" blocks.\n");
    800025cc:	00003517          	auipc	a0,0x3
    800025d0:	dcc50513          	addi	a0,a0,-564 # 80005398 <CONSOLE_STATUS+0x388>
    800025d4:	00000097          	auipc	ra,0x0
    800025d8:	630080e7          	jalr	1584(ra) # 80002c04 <_Z11printStringPKc>
    800025dc:	00004797          	auipc	a5,0x4
    800025e0:	c3c7b783          	ld	a5,-964(a5) # 80006218 <_ZN15MemoryAllocator8freeHeadE>
    800025e4:	0007b503          	ld	a0,0(a5)
    800025e8:	00000097          	auipc	ra,0x0
    800025ec:	6a0080e7          	jalr	1696(ra) # 80002c88 <_Z12printIntegerm>
    800025f0:	00003517          	auipc	a0,0x3
    800025f4:	dd050513          	addi	a0,a0,-560 # 800053c0 <CONSOLE_STATUS+0x3b0>
    800025f8:	00000097          	auipc	ra,0x0
    800025fc:	60c080e7          	jalr	1548(ra) # 80002c04 <_Z11printStringPKc>
    printString("<-- MA::init() finished.\n");
    80002600:	00003517          	auipc	a0,0x3
    80002604:	dd050513          	addi	a0,a0,-560 # 800053d0 <CONSOLE_STATUS+0x3c0>
    80002608:	00000097          	auipc	ra,0x0
    8000260c:	5fc080e7          	jalr	1532(ra) # 80002c04 <_Z11printStringPKc>
}
    80002610:	00813083          	ld	ra,8(sp)
    80002614:	00013403          	ld	s0,0(sp)
    80002618:	01010113          	addi	sp,sp,16
    8000261c:	00008067          	ret
        freeHead = nullptr;
    80002620:	00004797          	auipc	a5,0x4
    80002624:	be07bc23          	sd	zero,-1032(a5) # 80006218 <_ZN15MemoryAllocator8freeHeadE>
        printString("<-- MA::init() failed: No heap space.\n");
    80002628:	00003517          	auipc	a0,0x3
    8000262c:	ce050513          	addi	a0,a0,-800 # 80005308 <CONSOLE_STATUS+0x2f8>
    80002630:	00000097          	auipc	ra,0x0
    80002634:	5d4080e7          	jalr	1492(ra) # 80002c04 <_Z11printStringPKc>
        return;
    80002638:	fd9ff06f          	j	80002610 <_ZN15MemoryAllocator4initEv+0x128>
        freeHead = nullptr;
    8000263c:	00004797          	auipc	a5,0x4
    80002640:	bc07be23          	sd	zero,-1060(a5) # 80006218 <_ZN15MemoryAllocator8freeHeadE>
        printString("<-- MA::init() failed: Not enough space for header.\n");
    80002644:	00003517          	auipc	a0,0x3
    80002648:	cec50513          	addi	a0,a0,-788 # 80005330 <CONSOLE_STATUS+0x320>
    8000264c:	00000097          	auipc	ra,0x0
    80002650:	5b8080e7          	jalr	1464(ra) # 80002c04 <_Z11printStringPKc>
        return;
    80002654:	fbdff06f          	j	80002610 <_ZN15MemoryAllocator4initEv+0x128>

0000000080002658 <_ZN15MemoryAllocator12sizeToBlocksEm>:

// Pretvara bajtove u blokove
size_t MemoryAllocator::sizeToBlocks(size_t bytes) {
    80002658:	ff010113          	addi	sp,sp,-16
    8000265c:	00813423          	sd	s0,8(sp)
    80002660:	01010413          	addi	s0,sp,16
    if (bytes == 0) return 0;
    80002664:	00050663          	beqz	a0,80002670 <_ZN15MemoryAllocator12sizeToBlocksEm+0x18>
    return (bytes + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80002668:	03f50513          	addi	a0,a0,63
    8000266c:	00655513          	srli	a0,a0,0x6
}
    80002670:	00813403          	ld	s0,8(sp)
    80002674:	01010113          	addi	sp,sp,16
    80002678:	00008067          	ret

000000008000267c <_Z41__static_initialization_and_destruction_0ii>:
        if (right->next) right->next->prev = blk;
    }

    printString("<-- MA::mem_free() finished.\n");
    return 0;
}
    8000267c:	00100793          	li	a5,1
    80002680:	00f50463          	beq	a0,a5,80002688 <_Z41__static_initialization_and_destruction_0ii+0xc>
    80002684:	00008067          	ret
    80002688:	000107b7          	lui	a5,0x10
    8000268c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002690:	fef59ae3          	bne	a1,a5,80002684 <_Z41__static_initialization_and_destruction_0ii+0x8>
    80002694:	ff010113          	addi	sp,sp,-16
    80002698:	00113423          	sd	ra,8(sp)
    8000269c:	00813023          	sd	s0,0(sp)
    800026a0:	01010413          	addi	s0,sp,16
const size_t HEADER_BLOCKS = MemoryAllocator::sizeToBlocks(sizeof(MemoryAllocator::memBlock));
    800026a4:	02000513          	li	a0,32
    800026a8:	00000097          	auipc	ra,0x0
    800026ac:	fb0080e7          	jalr	-80(ra) # 80002658 <_ZN15MemoryAllocator12sizeToBlocksEm>
    800026b0:	00004797          	auipc	a5,0x4
    800026b4:	b4a7b823          	sd	a0,-1200(a5) # 80006200 <_ZL13HEADER_BLOCKS>
}
    800026b8:	00813083          	ld	ra,8(sp)
    800026bc:	00013403          	ld	s0,0(sp)
    800026c0:	01010113          	addi	sp,sp,16
    800026c4:	00008067          	ret

00000000800026c8 <_ZN15MemoryAllocator10headerUserEPNS_8memBlockE>:
void* MemoryAllocator::headerUser(memBlock* h) {
    800026c8:	ff010113          	addi	sp,sp,-16
    800026cc:	00813423          	sd	s0,8(sp)
    800026d0:	01010413          	addi	s0,sp,16
    if (!h) return nullptr;
    800026d4:	00050463          	beqz	a0,800026dc <_ZN15MemoryAllocator10headerUserEPNS_8memBlockE+0x14>
    return (void*)((uint8*)h + sizeof(memBlock));
    800026d8:	02050513          	addi	a0,a0,32
}
    800026dc:	00813403          	ld	s0,8(sp)
    800026e0:	01010113          	addi	sp,sp,16
    800026e4:	00008067          	ret

00000000800026e8 <_ZN15MemoryAllocator10userHeaderEPv>:
MemoryAllocator::memBlock* MemoryAllocator::userHeader(void* userPtr) {
    800026e8:	ff010113          	addi	sp,sp,-16
    800026ec:	00813423          	sd	s0,8(sp)
    800026f0:	01010413          	addi	s0,sp,16
    if (!userPtr) return nullptr;
    800026f4:	00050463          	beqz	a0,800026fc <_ZN15MemoryAllocator10userHeaderEPv+0x14>
    return (memBlock*)((uint8*)userPtr - sizeof(memBlock));
    800026f8:	fe050513          	addi	a0,a0,-32
}
    800026fc:	00813403          	ld	s0,8(sp)
    80002700:	01010113          	addi	sp,sp,16
    80002704:	00008067          	ret

0000000080002708 <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE>:
void MemoryAllocator::removeFree(memBlock* blk) {
    80002708:	ff010113          	addi	sp,sp,-16
    8000270c:	00813423          	sd	s0,8(sp)
    80002710:	01010413          	addi	s0,sp,16
    if (!blk) return;
    80002714:	02050663          	beqz	a0,80002740 <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE+0x38>
    if (blk->prev) blk->prev->next = blk->next;
    80002718:	01853783          	ld	a5,24(a0)
    8000271c:	02078863          	beqz	a5,8000274c <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE+0x44>
    80002720:	01053703          	ld	a4,16(a0)
    80002724:	00e7b823          	sd	a4,16(a5)
    if (blk->next) blk->next->prev = blk->prev;
    80002728:	01053783          	ld	a5,16(a0)
    8000272c:	00078663          	beqz	a5,80002738 <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE+0x30>
    80002730:	01853703          	ld	a4,24(a0)
    80002734:	00e7bc23          	sd	a4,24(a5)
    blk->prev = blk->next = nullptr;
    80002738:	00053823          	sd	zero,16(a0)
    8000273c:	00053c23          	sd	zero,24(a0)
}
    80002740:	00813403          	ld	s0,8(sp)
    80002744:	01010113          	addi	sp,sp,16
    80002748:	00008067          	ret
    else           freeHead       = blk->next;
    8000274c:	01053783          	ld	a5,16(a0)
    80002750:	00004717          	auipc	a4,0x4
    80002754:	acf73423          	sd	a5,-1336(a4) # 80006218 <_ZN15MemoryAllocator8freeHeadE>
    80002758:	fd1ff06f          	j	80002728 <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE+0x20>

000000008000275c <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE>:
void MemoryAllocator::insertSorted(memBlock* blk) {
    8000275c:	ff010113          	addi	sp,sp,-16
    80002760:	00813423          	sd	s0,8(sp)
    80002764:	01010413          	addi	s0,sp,16
    blk->isFree = true;
    80002768:	00100793          	li	a5,1
    8000276c:	00f50423          	sb	a5,8(a0)
    blk->prev = blk->next = nullptr;
    80002770:	00053823          	sd	zero,16(a0)
    80002774:	00053c23          	sd	zero,24(a0)
    if (!freeHead) { freeHead = blk; return; }
    80002778:	00004797          	auipc	a5,0x4
    8000277c:	aa07b783          	ld	a5,-1376(a5) # 80006218 <_ZN15MemoryAllocator8freeHeadE>
    80002780:	02078063          	beqz	a5,800027a0 <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x44>
    uint64 addr = (uint64)blk;
    80002784:	00050693          	mv	a3,a0
    memBlock* pv = nullptr;
    80002788:	00000713          	li	a4,0
    while (it && (uint64)it < addr) { pv = it; it = it->next; }
    8000278c:	02078063          	beqz	a5,800027ac <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x50>
    80002790:	00d7fe63          	bgeu	a5,a3,800027ac <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x50>
    80002794:	00078713          	mv	a4,a5
    80002798:	0107b783          	ld	a5,16(a5)
    8000279c:	ff1ff06f          	j	8000278c <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x30>
    if (!freeHead) { freeHead = blk; return; }
    800027a0:	00004797          	auipc	a5,0x4
    800027a4:	a6a7bc23          	sd	a0,-1416(a5) # 80006218 <_ZN15MemoryAllocator8freeHeadE>
    800027a8:	01c0006f          	j	800027c4 <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x68>
    blk->next = it;
    800027ac:	00f53823          	sd	a5,16(a0)
    blk->prev = pv;
    800027b0:	00e53c23          	sd	a4,24(a0)
    if (it) it->prev = blk;
    800027b4:	00078463          	beqz	a5,800027bc <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x60>
    800027b8:	00a7bc23          	sd	a0,24(a5)
    if (pv) pv->next = blk;
    800027bc:	00070a63          	beqz	a4,800027d0 <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x74>
    800027c0:	00a73823          	sd	a0,16(a4)
}
    800027c4:	00813403          	ld	s0,8(sp)
    800027c8:	01010113          	addi	sp,sp,16
    800027cc:	00008067          	ret
    else    freeHead = blk;
    800027d0:	00004797          	auipc	a5,0x4
    800027d4:	a4a7b423          	sd	a0,-1464(a5) # 80006218 <_ZN15MemoryAllocator8freeHeadE>
    800027d8:	fedff06f          	j	800027c4 <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x68>

00000000800027dc <_ZN15MemoryAllocator5splitEPNS_8memBlockEm>:
void MemoryAllocator::split(memBlock* blk, uint64 needBlocks) {
    800027dc:	fd010113          	addi	sp,sp,-48
    800027e0:	02113423          	sd	ra,40(sp)
    800027e4:	02813023          	sd	s0,32(sp)
    800027e8:	00913c23          	sd	s1,24(sp)
    800027ec:	01213823          	sd	s2,16(sp)
    800027f0:	01313423          	sd	s3,8(sp)
    800027f4:	01413023          	sd	s4,0(sp)
    800027f8:	03010413          	addi	s0,sp,48
    800027fc:	00050993          	mv	s3,a0
    80002800:	00058493          	mv	s1,a1
    size_t haveBlocks  = blk->sizeBlocks;
    80002804:	00053903          	ld	s2,0(a0)
    size_t remainingPayloadBlocks = haveBlocks - needBlocks;
    80002808:	40b90933          	sub	s2,s2,a1
    size_t neededForRemainderHeader = sizeToBlocks(sizeof(memBlock));
    8000280c:	02000513          	li	a0,32
    80002810:	00000097          	auipc	ra,0x0
    80002814:	e48080e7          	jalr	-440(ra) # 80002658 <_ZN15MemoryAllocator12sizeToBlocksEm>
    if (remainingPayloadBlocks > neededForRemainderHeader) {
    80002818:	03256263          	bltu	a0,s2,8000283c <_ZN15MemoryAllocator5splitEPNS_8memBlockEm+0x60>
}
    8000281c:	02813083          	ld	ra,40(sp)
    80002820:	02013403          	ld	s0,32(sp)
    80002824:	01813483          	ld	s1,24(sp)
    80002828:	01013903          	ld	s2,16(sp)
    8000282c:	00813983          	ld	s3,8(sp)
    80002830:	00013a03          	ld	s4,0(sp)
    80002834:	03010113          	addi	sp,sp,48
    80002838:	00008067          	ret
    8000283c:	00050a13          	mv	s4,a0
        blk->sizeBlocks = (size_t)needBlocks;
    80002840:	0099b023          	sd	s1,0(s3)
        memBlock* right = (memBlock*)((uint8*)headerUser(blk) + (size_t)needBlocks * MEM_BLOCK_SIZE);
    80002844:	00098513          	mv	a0,s3
    80002848:	00000097          	auipc	ra,0x0
    8000284c:	e80080e7          	jalr	-384(ra) # 800026c8 <_ZN15MemoryAllocator10headerUserEPNS_8memBlockE>
    80002850:	00649493          	slli	s1,s1,0x6
    80002854:	00950533          	add	a0,a0,s1
        right->sizeBlocks = remainingPayloadBlocks - neededForRemainderHeader;
    80002858:	41490933          	sub	s2,s2,s4
    8000285c:	01253023          	sd	s2,0(a0)
        insertSorted(right);
    80002860:	00000097          	auipc	ra,0x0
    80002864:	efc080e7          	jalr	-260(ra) # 8000275c <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE>
}
    80002868:	fb5ff06f          	j	8000281c <_ZN15MemoryAllocator5splitEPNS_8memBlockEm+0x40>

000000008000286c <_ZN15MemoryAllocator9mem_allocEm>:
void* MemoryAllocator::mem_alloc(size_t size) {
    8000286c:	fe010113          	addi	sp,sp,-32
    80002870:	00113c23          	sd	ra,24(sp)
    80002874:	00813823          	sd	s0,16(sp)
    80002878:	00913423          	sd	s1,8(sp)
    8000287c:	01213023          	sd	s2,0(sp)
    80002880:	02010413          	addi	s0,sp,32
    80002884:	00050493          	mv	s1,a0
    printString("--> MA::mem_alloc() called for size: "); printInteger(size); printString(" bytes.\n");
    80002888:	00003517          	auipc	a0,0x3
    8000288c:	b6850513          	addi	a0,a0,-1176 # 800053f0 <CONSOLE_STATUS+0x3e0>
    80002890:	00000097          	auipc	ra,0x0
    80002894:	374080e7          	jalr	884(ra) # 80002c04 <_Z11printStringPKc>
    80002898:	00048513          	mv	a0,s1
    8000289c:	00000097          	auipc	ra,0x0
    800028a0:	3ec080e7          	jalr	1004(ra) # 80002c88 <_Z12printIntegerm>
    800028a4:	00003517          	auipc	a0,0x3
    800028a8:	b7450513          	addi	a0,a0,-1164 # 80005418 <CONSOLE_STATUS+0x408>
    800028ac:	00000097          	auipc	ra,0x0
    800028b0:	358080e7          	jalr	856(ra) # 80002c04 <_Z11printStringPKc>
    if (!freeHead || size == 0) {
    800028b4:	00004797          	auipc	a5,0x4
    800028b8:	9647b783          	ld	a5,-1692(a5) # 80006218 <_ZN15MemoryAllocator8freeHeadE>
    800028bc:	0a078863          	beqz	a5,8000296c <_ZN15MemoryAllocator9mem_allocEm+0x100>
    800028c0:	0a048663          	beqz	s1,8000296c <_ZN15MemoryAllocator9mem_allocEm+0x100>
    size_t needBlocks = sizeToBlocks(size);
    800028c4:	00048513          	mv	a0,s1
    800028c8:	00000097          	auipc	ra,0x0
    800028cc:	d90080e7          	jalr	-624(ra) # 80002658 <_ZN15MemoryAllocator12sizeToBlocksEm>
    800028d0:	00050913          	mv	s2,a0
    if (needBlocks == (size_t)-1) {
    800028d4:	fff00793          	li	a5,-1
    800028d8:	0af50663          	beq	a0,a5,80002984 <_ZN15MemoryAllocator9mem_allocEm+0x118>
    printString("    Converted to "); printInteger(needBlocks); printString(" blocks.\n");
    800028dc:	00003517          	auipc	a0,0x3
    800028e0:	bbc50513          	addi	a0,a0,-1092 # 80005498 <CONSOLE_STATUS+0x488>
    800028e4:	00000097          	auipc	ra,0x0
    800028e8:	320080e7          	jalr	800(ra) # 80002c04 <_Z11printStringPKc>
    800028ec:	00090513          	mv	a0,s2
    800028f0:	00000097          	auipc	ra,0x0
    800028f4:	398080e7          	jalr	920(ra) # 80002c88 <_Z12printIntegerm>
    800028f8:	00003517          	auipc	a0,0x3
    800028fc:	ac850513          	addi	a0,a0,-1336 # 800053c0 <CONSOLE_STATUS+0x3b0>
    80002900:	00000097          	auipc	ra,0x0
    80002904:	304080e7          	jalr	772(ra) # 80002c04 <_Z11printStringPKc>
    for (memBlock* it = freeHead; it; it = it->next) {
    80002908:	00004497          	auipc	s1,0x4
    8000290c:	9104b483          	ld	s1,-1776(s1) # 80006218 <_ZN15MemoryAllocator8freeHeadE>
    80002910:	0e048e63          	beqz	s1,80002a0c <_ZN15MemoryAllocator9mem_allocEm+0x1a0>
        printString("    Checking block at: "); printInteger((uint64)it); printString(" with payload size: "); printInteger(it->sizeBlocks); printString(" blocks.\n");
    80002914:	00003517          	auipc	a0,0x3
    80002918:	b9c50513          	addi	a0,a0,-1124 # 800054b0 <CONSOLE_STATUS+0x4a0>
    8000291c:	00000097          	auipc	ra,0x0
    80002920:	2e8080e7          	jalr	744(ra) # 80002c04 <_Z11printStringPKc>
    80002924:	00048513          	mv	a0,s1
    80002928:	00000097          	auipc	ra,0x0
    8000292c:	360080e7          	jalr	864(ra) # 80002c88 <_Z12printIntegerm>
    80002930:	00003517          	auipc	a0,0x3
    80002934:	b9850513          	addi	a0,a0,-1128 # 800054c8 <CONSOLE_STATUS+0x4b8>
    80002938:	00000097          	auipc	ra,0x0
    8000293c:	2cc080e7          	jalr	716(ra) # 80002c04 <_Z11printStringPKc>
    80002940:	0004b503          	ld	a0,0(s1)
    80002944:	00000097          	auipc	ra,0x0
    80002948:	344080e7          	jalr	836(ra) # 80002c88 <_Z12printIntegerm>
    8000294c:	00003517          	auipc	a0,0x3
    80002950:	a7450513          	addi	a0,a0,-1420 # 800053c0 <CONSOLE_STATUS+0x3b0>
    80002954:	00000097          	auipc	ra,0x0
    80002958:	2b0080e7          	jalr	688(ra) # 80002c04 <_Z11printStringPKc>
        if (it->sizeBlocks >= needBlocks) {
    8000295c:	0004b783          	ld	a5,0(s1)
    80002960:	0327fe63          	bgeu	a5,s2,8000299c <_ZN15MemoryAllocator9mem_allocEm+0x130>
    for (memBlock* it = freeHead; it; it = it->next) {
    80002964:	0104b483          	ld	s1,16(s1)
    80002968:	fa9ff06f          	j	80002910 <_ZN15MemoryAllocator9mem_allocEm+0xa4>
        printString("<-- MA::mem_alloc() failed: freeHead is null or size is 0.\n");
    8000296c:	00003517          	auipc	a0,0x3
    80002970:	abc50513          	addi	a0,a0,-1348 # 80005428 <CONSOLE_STATUS+0x418>
    80002974:	00000097          	auipc	ra,0x0
    80002978:	290080e7          	jalr	656(ra) # 80002c04 <_Z11printStringPKc>
        return nullptr;
    8000297c:	00000493          	li	s1,0
    80002980:	09c0006f          	j	80002a1c <_ZN15MemoryAllocator9mem_allocEm+0x1b0>
        printString("<-- MA::mem_alloc() failed: size overflow.\n");
    80002984:	00003517          	auipc	a0,0x3
    80002988:	ae450513          	addi	a0,a0,-1308 # 80005468 <CONSOLE_STATUS+0x458>
    8000298c:	00000097          	auipc	ra,0x0
    80002990:	278080e7          	jalr	632(ra) # 80002c04 <_Z11printStringPKc>
        return nullptr;
    80002994:	00000493          	li	s1,0
    80002998:	0840006f          	j	80002a1c <_ZN15MemoryAllocator9mem_allocEm+0x1b0>
            printString("    Found suitable block!\n");
    8000299c:	00003517          	auipc	a0,0x3
    800029a0:	b4450513          	addi	a0,a0,-1212 # 800054e0 <CONSOLE_STATUS+0x4d0>
    800029a4:	00000097          	auipc	ra,0x0
    800029a8:	260080e7          	jalr	608(ra) # 80002c04 <_Z11printStringPKc>
            removeFree(it);
    800029ac:	00048513          	mv	a0,s1
    800029b0:	00000097          	auipc	ra,0x0
    800029b4:	d58080e7          	jalr	-680(ra) # 80002708 <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE>
            split(it, (uint64)needBlocks);
    800029b8:	00090593          	mv	a1,s2
    800029bc:	00048513          	mv	a0,s1
    800029c0:	00000097          	auipc	ra,0x0
    800029c4:	e1c080e7          	jalr	-484(ra) # 800027dc <_ZN15MemoryAllocator5splitEPNS_8memBlockEm>
            it->isFree = false;
    800029c8:	00048423          	sb	zero,8(s1)
            void* userPtr = headerUser(it);
    800029cc:	00048513          	mv	a0,s1
    800029d0:	00000097          	auipc	ra,0x0
    800029d4:	cf8080e7          	jalr	-776(ra) # 800026c8 <_ZN15MemoryAllocator10headerUserEPNS_8memBlockE>
    800029d8:	00050493          	mv	s1,a0
            printString("<-- MA::mem_alloc() returning address: "); printInteger((uint64)userPtr); printString("\n");
    800029dc:	00003517          	auipc	a0,0x3
    800029e0:	b2450513          	addi	a0,a0,-1244 # 80005500 <CONSOLE_STATUS+0x4f0>
    800029e4:	00000097          	auipc	ra,0x0
    800029e8:	220080e7          	jalr	544(ra) # 80002c04 <_Z11printStringPKc>
    800029ec:	00048513          	mv	a0,s1
    800029f0:	00000097          	auipc	ra,0x0
    800029f4:	298080e7          	jalr	664(ra) # 80002c88 <_Z12printIntegerm>
    800029f8:	00002517          	auipc	a0,0x2
    800029fc:	7e050513          	addi	a0,a0,2016 # 800051d8 <CONSOLE_STATUS+0x1c8>
    80002a00:	00000097          	auipc	ra,0x0
    80002a04:	204080e7          	jalr	516(ra) # 80002c04 <_Z11printStringPKc>
            return userPtr;
    80002a08:	0140006f          	j	80002a1c <_ZN15MemoryAllocator9mem_allocEm+0x1b0>
    printString("<-- MA::mem_alloc() failed: No suitable block found!\n");
    80002a0c:	00003517          	auipc	a0,0x3
    80002a10:	b1c50513          	addi	a0,a0,-1252 # 80005528 <CONSOLE_STATUS+0x518>
    80002a14:	00000097          	auipc	ra,0x0
    80002a18:	1f0080e7          	jalr	496(ra) # 80002c04 <_Z11printStringPKc>
}
    80002a1c:	00048513          	mv	a0,s1
    80002a20:	01813083          	ld	ra,24(sp)
    80002a24:	01013403          	ld	s0,16(sp)
    80002a28:	00813483          	ld	s1,8(sp)
    80002a2c:	00013903          	ld	s2,0(sp)
    80002a30:	02010113          	addi	sp,sp,32
    80002a34:	00008067          	ret

0000000080002a38 <_ZN15MemoryAllocator8mem_freeEPv>:
int MemoryAllocator::mem_free(void* addr) {
    80002a38:	fe010113          	addi	sp,sp,-32
    80002a3c:	00113c23          	sd	ra,24(sp)
    80002a40:	00813823          	sd	s0,16(sp)
    80002a44:	00913423          	sd	s1,8(sp)
    80002a48:	02010413          	addi	s0,sp,32
    80002a4c:	00050493          	mv	s1,a0
    printString("--> MA::mem_free() called for address: "); printInteger((uint64)addr); printString("\n");
    80002a50:	00003517          	auipc	a0,0x3
    80002a54:	b1050513          	addi	a0,a0,-1264 # 80005560 <CONSOLE_STATUS+0x550>
    80002a58:	00000097          	auipc	ra,0x0
    80002a5c:	1ac080e7          	jalr	428(ra) # 80002c04 <_Z11printStringPKc>
    80002a60:	00048513          	mv	a0,s1
    80002a64:	00000097          	auipc	ra,0x0
    80002a68:	224080e7          	jalr	548(ra) # 80002c88 <_Z12printIntegerm>
    80002a6c:	00002517          	auipc	a0,0x2
    80002a70:	76c50513          	addi	a0,a0,1900 # 800051d8 <CONSOLE_STATUS+0x1c8>
    80002a74:	00000097          	auipc	ra,0x0
    80002a78:	190080e7          	jalr	400(ra) # 80002c04 <_Z11printStringPKc>
    if (!addr) return -1;
    80002a7c:	12048663          	beqz	s1,80002ba8 <_ZN15MemoryAllocator8mem_freeEPv+0x170>
    auto* blk = (memBlock*)((char*)addr - sizeof(memBlock));
    80002a80:	fe048713          	addi	a4,s1,-32
    if ((uint64)blk < heapStart || (uint64)blk >= heapEnd) return -2;
    80002a84:	00003797          	auipc	a5,0x3
    80002a88:	78c7b783          	ld	a5,1932(a5) # 80006210 <_ZN15MemoryAllocator9heapStartE>
    80002a8c:	12f76263          	bltu	a4,a5,80002bb0 <_ZN15MemoryAllocator8mem_freeEPv+0x178>
    80002a90:	00003797          	auipc	a5,0x3
    80002a94:	7787b783          	ld	a5,1912(a5) # 80006208 <_ZN15MemoryAllocator7heapEndE>
    80002a98:	12f77063          	bgeu	a4,a5,80002bb8 <_ZN15MemoryAllocator8mem_freeEPv+0x180>
    if (blk->sizeBlocks == 0) return -3;     // korupcija
    80002a9c:	fe04b783          	ld	a5,-32(s1)
    80002aa0:	12078063          	beqz	a5,80002bc0 <_ZN15MemoryAllocator8mem_freeEPv+0x188>
    if (blk->isFree)         return -4;     // double free
    80002aa4:	fe84c783          	lbu	a5,-24(s1)
    80002aa8:	12079063          	bnez	a5,80002bc8 <_ZN15MemoryAllocator8mem_freeEPv+0x190>
    blk->isFree = true;
    80002aac:	00100793          	li	a5,1
    80002ab0:	fef48423          	sb	a5,-24(s1)
    memBlock* cur  = freeHead;
    80002ab4:	00003797          	auipc	a5,0x3
    80002ab8:	7647b783          	ld	a5,1892(a5) # 80006218 <_ZN15MemoryAllocator8freeHeadE>
    memBlock* prev = nullptr;
    80002abc:	00000693          	li	a3,0
    while (cur && cur < blk) { prev = cur; cur = cur->next; }
    80002ac0:	00078a63          	beqz	a5,80002ad4 <_ZN15MemoryAllocator8mem_freeEPv+0x9c>
    80002ac4:	00e7f863          	bgeu	a5,a4,80002ad4 <_ZN15MemoryAllocator8mem_freeEPv+0x9c>
    80002ac8:	00078693          	mv	a3,a5
    80002acc:	0107b783          	ld	a5,16(a5)
    80002ad0:	ff1ff06f          	j	80002ac0 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
    blk->prev = prev;
    80002ad4:	fed4bc23          	sd	a3,-8(s1)
    blk->next = cur;
    80002ad8:	fef4b823          	sd	a5,-16(s1)
    if (prev) prev->next = blk; else freeHead = blk;
    80002adc:	06068863          	beqz	a3,80002b4c <_ZN15MemoryAllocator8mem_freeEPv+0x114>
    80002ae0:	00e6b823          	sd	a4,16(a3)
    if (cur)  cur->prev  = blk;
    80002ae4:	00078463          	beqz	a5,80002aec <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
    80002ae8:	00e7bc23          	sd	a4,24(a5)
    if (blk->prev && is_adjacent(blk->prev, blk)) {
    80002aec:	ff84b683          	ld	a3,-8(s1)
    80002af0:	00068c63          	beqz	a3,80002b08 <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
        return sizeof(memBlock) + b->sizeBlocks * MEM_BLOCK_SIZE; // header + payload
    80002af4:	0006b603          	ld	a2,0(a3)
    80002af8:	00661793          	slli	a5,a2,0x6
    80002afc:	02078793          	addi	a5,a5,32
        return (char*)left + totalBytes(left) == (char*)right;
    80002b00:	00f687b3          	add	a5,a3,a5
    if (blk->prev && is_adjacent(blk->prev, blk)) {
    80002b04:	04f70a63          	beq	a4,a5,80002b58 <_ZN15MemoryAllocator8mem_freeEPv+0x120>
    if (blk->next && is_adjacent(blk, blk->next)) {
    80002b08:	01073683          	ld	a3,16(a4)
    80002b0c:	00068c63          	beqz	a3,80002b24 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
        return sizeof(memBlock) + b->sizeBlocks * MEM_BLOCK_SIZE; // header + payload
    80002b10:	00073603          	ld	a2,0(a4)
    80002b14:	00661793          	slli	a5,a2,0x6
    80002b18:	02078793          	addi	a5,a5,32
        return (char*)left + totalBytes(left) == (char*)right;
    80002b1c:	00f707b3          	add	a5,a4,a5
    if (blk->next && is_adjacent(blk, blk->next)) {
    80002b20:	06f68263          	beq	a3,a5,80002b84 <_ZN15MemoryAllocator8mem_freeEPv+0x14c>
    printString("<-- MA::mem_free() finished.\n");
    80002b24:	00003517          	auipc	a0,0x3
    80002b28:	a6450513          	addi	a0,a0,-1436 # 80005588 <CONSOLE_STATUS+0x578>
    80002b2c:	00000097          	auipc	ra,0x0
    80002b30:	0d8080e7          	jalr	216(ra) # 80002c04 <_Z11printStringPKc>
    return 0;
    80002b34:	00000513          	li	a0,0
}
    80002b38:	01813083          	ld	ra,24(sp)
    80002b3c:	01013403          	ld	s0,16(sp)
    80002b40:	00813483          	ld	s1,8(sp)
    80002b44:	02010113          	addi	sp,sp,32
    80002b48:	00008067          	ret
    if (prev) prev->next = blk; else freeHead = blk;
    80002b4c:	00003697          	auipc	a3,0x3
    80002b50:	6ce6b623          	sd	a4,1740(a3) # 80006218 <_ZN15MemoryAllocator8freeHeadE>
    80002b54:	f91ff06f          	j	80002ae4 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
        left->sizeBlocks += blk->sizeBlocks;     // ⚠️ samo payload, bez headera
    80002b58:	fe04b783          	ld	a5,-32(s1)
    80002b5c:	00c78633          	add	a2,a5,a2
    80002b60:	00c6b023          	sd	a2,0(a3)
        left->next = blk->next;
    80002b64:	ff04b783          	ld	a5,-16(s1)
    80002b68:	00f6b823          	sd	a5,16(a3)
        if (blk->next) blk->next->prev = left;
    80002b6c:	00078863          	beqz	a5,80002b7c <_ZN15MemoryAllocator8mem_freeEPv+0x144>
    80002b70:	00d7bc23          	sd	a3,24(a5)
        blk = left; // nastavi dalje od uvećanog levog
    80002b74:	00068713          	mv	a4,a3
    80002b78:	f91ff06f          	j	80002b08 <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
    80002b7c:	00068713          	mv	a4,a3
    80002b80:	f89ff06f          	j	80002b08 <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
        blk->sizeBlocks += right->sizeBlocks;    // ⚠️ samo payload
    80002b84:	0006b783          	ld	a5,0(a3)
    80002b88:	00c78633          	add	a2,a5,a2
    80002b8c:	00c73023          	sd	a2,0(a4)
        blk->next = right->next;
    80002b90:	0106b783          	ld	a5,16(a3)
    80002b94:	00f73823          	sd	a5,16(a4)
        if (right->next) right->next->prev = blk;
    80002b98:	0106b783          	ld	a5,16(a3)
    80002b9c:	f80784e3          	beqz	a5,80002b24 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    80002ba0:	00e7bc23          	sd	a4,24(a5)
    80002ba4:	f81ff06f          	j	80002b24 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    if (!addr) return -1;
    80002ba8:	fff00513          	li	a0,-1
    80002bac:	f8dff06f          	j	80002b38 <_ZN15MemoryAllocator8mem_freeEPv+0x100>
    if ((uint64)blk < heapStart || (uint64)blk >= heapEnd) return -2;
    80002bb0:	ffe00513          	li	a0,-2
    80002bb4:	f85ff06f          	j	80002b38 <_ZN15MemoryAllocator8mem_freeEPv+0x100>
    80002bb8:	ffe00513          	li	a0,-2
    80002bbc:	f7dff06f          	j	80002b38 <_ZN15MemoryAllocator8mem_freeEPv+0x100>
    if (blk->sizeBlocks == 0) return -3;     // korupcija
    80002bc0:	ffd00513          	li	a0,-3
    80002bc4:	f75ff06f          	j	80002b38 <_ZN15MemoryAllocator8mem_freeEPv+0x100>
    if (blk->isFree)         return -4;     // double free
    80002bc8:	ffc00513          	li	a0,-4
    80002bcc:	f6dff06f          	j	80002b38 <_ZN15MemoryAllocator8mem_freeEPv+0x100>

0000000080002bd0 <_GLOBAL__sub_I__ZN15MemoryAllocator8freeHeadE>:
}
    80002bd0:	ff010113          	addi	sp,sp,-16
    80002bd4:	00113423          	sd	ra,8(sp)
    80002bd8:	00813023          	sd	s0,0(sp)
    80002bdc:	01010413          	addi	s0,sp,16
    80002be0:	000105b7          	lui	a1,0x10
    80002be4:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002be8:	00100513          	li	a0,1
    80002bec:	00000097          	auipc	ra,0x0
    80002bf0:	a90080e7          	jalr	-1392(ra) # 8000267c <_Z41__static_initialization_and_destruction_0ii>
    80002bf4:	00813083          	ld	ra,8(sp)
    80002bf8:	00013403          	ld	s0,0(sp)
    80002bfc:	01010113          	addi	sp,sp,16
    80002c00:	00008067          	ret

0000000080002c04 <_Z11printStringPKc>:
#include "../lib/console.h"

extern _sem* console_mutex;
extern bool scheduler_started;

void printString(const char *string) {
    80002c04:	fe010113          	addi	sp,sp,-32
    80002c08:	00113c23          	sd	ra,24(sp)
    80002c0c:	00813823          	sd	s0,16(sp)
    80002c10:	00913423          	sd	s1,8(sp)
    80002c14:	02010413          	addi	s0,sp,32
    80002c18:	00050493          	mv	s1,a0
    if (scheduler_started && console_mutex) {
    80002c1c:	00003797          	auipc	a5,0x3
    80002c20:	5b47c783          	lbu	a5,1460(a5) # 800061d0 <scheduler_started>
    80002c24:	00078c63          	beqz	a5,80002c3c <_Z11printStringPKc+0x38>
    80002c28:	00003517          	auipc	a0,0x3
    80002c2c:	5b053503          	ld	a0,1456(a0) # 800061d8 <console_mutex>
    80002c30:	00050663          	beqz	a0,80002c3c <_Z11printStringPKc+0x38>
        console_mutex->wait();
    80002c34:	ffffe097          	auipc	ra,0xffffe
    80002c38:	768080e7          	jalr	1896(ra) # 8000139c <_ZN4_sem4waitEv>
    }
    while (*string != '\0') {
    80002c3c:	0004c503          	lbu	a0,0(s1)
    80002c40:	00050a63          	beqz	a0,80002c54 <_Z11printStringPKc+0x50>
        __putc(*string);
    80002c44:	00002097          	auipc	ra,0x2
    80002c48:	188080e7          	jalr	392(ra) # 80004dcc <__putc>
        string++;
    80002c4c:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80002c50:	fedff06f          	j	80002c3c <_Z11printStringPKc+0x38>
    }
    if (scheduler_started && console_mutex) {
    80002c54:	00003797          	auipc	a5,0x3
    80002c58:	57c7c783          	lbu	a5,1404(a5) # 800061d0 <scheduler_started>
    80002c5c:	00078c63          	beqz	a5,80002c74 <_Z11printStringPKc+0x70>
    80002c60:	00003517          	auipc	a0,0x3
    80002c64:	57853503          	ld	a0,1400(a0) # 800061d8 <console_mutex>
    80002c68:	00050663          	beqz	a0,80002c74 <_Z11printStringPKc+0x70>
        console_mutex->signal();
    80002c6c:	ffffe097          	auipc	ra,0xffffe
    80002c70:	7dc080e7          	jalr	2012(ra) # 80001448 <_ZN4_sem6signalEv>
    }
}
    80002c74:	01813083          	ld	ra,24(sp)
    80002c78:	01013403          	ld	s0,16(sp)
    80002c7c:	00813483          	ld	s1,8(sp)
    80002c80:	02010113          	addi	sp,sp,32
    80002c84:	00008067          	ret

0000000080002c88 <_Z12printIntegerm>:

void printInteger(uint64 integer) {
    80002c88:	fd010113          	addi	sp,sp,-48
    80002c8c:	02113423          	sd	ra,40(sp)
    80002c90:	02813023          	sd	s0,32(sp)
    80002c94:	03010413          	addi	s0,sp,48
    static char digits[] = "0123456789";
    char buf[21];
    int i = sizeof(buf) - 1;
    buf[i] = '\0';
    80002c98:	fe040623          	sb	zero,-20(s0)

    if (integer == 0) {
    80002c9c:	02051863          	bnez	a0,80002ccc <_Z12printIntegerm+0x44>
        buf[--i] = '0';
    80002ca0:	03000793          	li	a5,48
    80002ca4:	fef405a3          	sb	a5,-21(s0)
    80002ca8:	01300713          	li	a4,19
        } while (integer != 0);
    }

    // Pozivamo printString koji će se pobrinuti za zaključavanje.
    // Nema __putc, wait, ili signal poziva ovde!
    printString(&buf[i]);
    80002cac:	fd840793          	addi	a5,s0,-40
    80002cb0:	00e78533          	add	a0,a5,a4
    80002cb4:	00000097          	auipc	ra,0x0
    80002cb8:	f50080e7          	jalr	-176(ra) # 80002c04 <_Z11printStringPKc>
    80002cbc:	02813083          	ld	ra,40(sp)
    80002cc0:	02013403          	ld	s0,32(sp)
    80002cc4:	03010113          	addi	sp,sp,48
    80002cc8:	00008067          	ret
    int i = sizeof(buf) - 1;
    80002ccc:	01400713          	li	a4,20
            buf[--i] = digits[integer % 10];
    80002cd0:	00a00693          	li	a3,10
    80002cd4:	02d57633          	remu	a2,a0,a3
    80002cd8:	fff7071b          	addiw	a4,a4,-1
    80002cdc:	00003797          	auipc	a5,0x3
    80002ce0:	8cc78793          	addi	a5,a5,-1844 # 800055a8 <_ZZ12printIntegermE6digits>
    80002ce4:	00c787b3          	add	a5,a5,a2
    80002ce8:	0007c603          	lbu	a2,0(a5)
    80002cec:	ff040793          	addi	a5,s0,-16
    80002cf0:	00e787b3          	add	a5,a5,a4
    80002cf4:	fec78423          	sb	a2,-24(a5)
            integer /= 10;
    80002cf8:	00050613          	mv	a2,a0
    80002cfc:	02d55533          	divu	a0,a0,a3
        } while (integer != 0);
    80002d00:	00900793          	li	a5,9
    80002d04:	fcc7e6e3          	bltu	a5,a2,80002cd0 <_Z12printIntegerm+0x48>
    80002d08:	fa5ff06f          	j	80002cac <_Z12printIntegerm+0x24>

0000000080002d0c <start>:
    80002d0c:	ff010113          	addi	sp,sp,-16
    80002d10:	00813423          	sd	s0,8(sp)
    80002d14:	01010413          	addi	s0,sp,16
    80002d18:	300027f3          	csrr	a5,mstatus
    80002d1c:	ffffe737          	lui	a4,0xffffe
    80002d20:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff733f>
    80002d24:	00e7f7b3          	and	a5,a5,a4
    80002d28:	00001737          	lui	a4,0x1
    80002d2c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002d30:	00e7e7b3          	or	a5,a5,a4
    80002d34:	30079073          	csrw	mstatus,a5
    80002d38:	00000797          	auipc	a5,0x0
    80002d3c:	16078793          	addi	a5,a5,352 # 80002e98 <system_main>
    80002d40:	34179073          	csrw	mepc,a5
    80002d44:	00000793          	li	a5,0
    80002d48:	18079073          	csrw	satp,a5
    80002d4c:	000107b7          	lui	a5,0x10
    80002d50:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002d54:	30279073          	csrw	medeleg,a5
    80002d58:	30379073          	csrw	mideleg,a5
    80002d5c:	104027f3          	csrr	a5,sie
    80002d60:	2227e793          	ori	a5,a5,546
    80002d64:	10479073          	csrw	sie,a5
    80002d68:	fff00793          	li	a5,-1
    80002d6c:	00a7d793          	srli	a5,a5,0xa
    80002d70:	3b079073          	csrw	pmpaddr0,a5
    80002d74:	00f00793          	li	a5,15
    80002d78:	3a079073          	csrw	pmpcfg0,a5
    80002d7c:	f14027f3          	csrr	a5,mhartid
    80002d80:	0200c737          	lui	a4,0x200c
    80002d84:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002d88:	0007869b          	sext.w	a3,a5
    80002d8c:	00269713          	slli	a4,a3,0x2
    80002d90:	000f4637          	lui	a2,0xf4
    80002d94:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002d98:	00d70733          	add	a4,a4,a3
    80002d9c:	0037979b          	slliw	a5,a5,0x3
    80002da0:	020046b7          	lui	a3,0x2004
    80002da4:	00d787b3          	add	a5,a5,a3
    80002da8:	00c585b3          	add	a1,a1,a2
    80002dac:	00371693          	slli	a3,a4,0x3
    80002db0:	00003717          	auipc	a4,0x3
    80002db4:	4b070713          	addi	a4,a4,1200 # 80006260 <timer_scratch>
    80002db8:	00b7b023          	sd	a1,0(a5)
    80002dbc:	00d70733          	add	a4,a4,a3
    80002dc0:	00f73c23          	sd	a5,24(a4)
    80002dc4:	02c73023          	sd	a2,32(a4)
    80002dc8:	34071073          	csrw	mscratch,a4
    80002dcc:	00000797          	auipc	a5,0x0
    80002dd0:	6e478793          	addi	a5,a5,1764 # 800034b0 <timervec>
    80002dd4:	30579073          	csrw	mtvec,a5
    80002dd8:	300027f3          	csrr	a5,mstatus
    80002ddc:	0087e793          	ori	a5,a5,8
    80002de0:	30079073          	csrw	mstatus,a5
    80002de4:	304027f3          	csrr	a5,mie
    80002de8:	0807e793          	ori	a5,a5,128
    80002dec:	30479073          	csrw	mie,a5
    80002df0:	f14027f3          	csrr	a5,mhartid
    80002df4:	0007879b          	sext.w	a5,a5
    80002df8:	00078213          	mv	tp,a5
    80002dfc:	30200073          	mret
    80002e00:	00813403          	ld	s0,8(sp)
    80002e04:	01010113          	addi	sp,sp,16
    80002e08:	00008067          	ret

0000000080002e0c <timerinit>:
    80002e0c:	ff010113          	addi	sp,sp,-16
    80002e10:	00813423          	sd	s0,8(sp)
    80002e14:	01010413          	addi	s0,sp,16
    80002e18:	f14027f3          	csrr	a5,mhartid
    80002e1c:	0200c737          	lui	a4,0x200c
    80002e20:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002e24:	0007869b          	sext.w	a3,a5
    80002e28:	00269713          	slli	a4,a3,0x2
    80002e2c:	000f4637          	lui	a2,0xf4
    80002e30:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002e34:	00d70733          	add	a4,a4,a3
    80002e38:	0037979b          	slliw	a5,a5,0x3
    80002e3c:	020046b7          	lui	a3,0x2004
    80002e40:	00d787b3          	add	a5,a5,a3
    80002e44:	00c585b3          	add	a1,a1,a2
    80002e48:	00371693          	slli	a3,a4,0x3
    80002e4c:	00003717          	auipc	a4,0x3
    80002e50:	41470713          	addi	a4,a4,1044 # 80006260 <timer_scratch>
    80002e54:	00b7b023          	sd	a1,0(a5)
    80002e58:	00d70733          	add	a4,a4,a3
    80002e5c:	00f73c23          	sd	a5,24(a4)
    80002e60:	02c73023          	sd	a2,32(a4)
    80002e64:	34071073          	csrw	mscratch,a4
    80002e68:	00000797          	auipc	a5,0x0
    80002e6c:	64878793          	addi	a5,a5,1608 # 800034b0 <timervec>
    80002e70:	30579073          	csrw	mtvec,a5
    80002e74:	300027f3          	csrr	a5,mstatus
    80002e78:	0087e793          	ori	a5,a5,8
    80002e7c:	30079073          	csrw	mstatus,a5
    80002e80:	304027f3          	csrr	a5,mie
    80002e84:	0807e793          	ori	a5,a5,128
    80002e88:	30479073          	csrw	mie,a5
    80002e8c:	00813403          	ld	s0,8(sp)
    80002e90:	01010113          	addi	sp,sp,16
    80002e94:	00008067          	ret

0000000080002e98 <system_main>:
    80002e98:	fe010113          	addi	sp,sp,-32
    80002e9c:	00813823          	sd	s0,16(sp)
    80002ea0:	00913423          	sd	s1,8(sp)
    80002ea4:	00113c23          	sd	ra,24(sp)
    80002ea8:	02010413          	addi	s0,sp,32
    80002eac:	00000097          	auipc	ra,0x0
    80002eb0:	0c4080e7          	jalr	196(ra) # 80002f70 <cpuid>
    80002eb4:	00003497          	auipc	s1,0x3
    80002eb8:	36c48493          	addi	s1,s1,876 # 80006220 <started>
    80002ebc:	02050263          	beqz	a0,80002ee0 <system_main+0x48>
    80002ec0:	0004a783          	lw	a5,0(s1)
    80002ec4:	0007879b          	sext.w	a5,a5
    80002ec8:	fe078ce3          	beqz	a5,80002ec0 <system_main+0x28>
    80002ecc:	0ff0000f          	fence
    80002ed0:	00002517          	auipc	a0,0x2
    80002ed4:	71850513          	addi	a0,a0,1816 # 800055e8 <_ZZ12printIntegermE6digits+0x40>
    80002ed8:	00001097          	auipc	ra,0x1
    80002edc:	a74080e7          	jalr	-1420(ra) # 8000394c <panic>
    80002ee0:	00001097          	auipc	ra,0x1
    80002ee4:	9c8080e7          	jalr	-1592(ra) # 800038a8 <consoleinit>
    80002ee8:	00001097          	auipc	ra,0x1
    80002eec:	154080e7          	jalr	340(ra) # 8000403c <printfinit>
    80002ef0:	00002517          	auipc	a0,0x2
    80002ef4:	2e850513          	addi	a0,a0,744 # 800051d8 <CONSOLE_STATUS+0x1c8>
    80002ef8:	00001097          	auipc	ra,0x1
    80002efc:	ab0080e7          	jalr	-1360(ra) # 800039a8 <__printf>
    80002f00:	00002517          	auipc	a0,0x2
    80002f04:	6b850513          	addi	a0,a0,1720 # 800055b8 <_ZZ12printIntegermE6digits+0x10>
    80002f08:	00001097          	auipc	ra,0x1
    80002f0c:	aa0080e7          	jalr	-1376(ra) # 800039a8 <__printf>
    80002f10:	00002517          	auipc	a0,0x2
    80002f14:	2c850513          	addi	a0,a0,712 # 800051d8 <CONSOLE_STATUS+0x1c8>
    80002f18:	00001097          	auipc	ra,0x1
    80002f1c:	a90080e7          	jalr	-1392(ra) # 800039a8 <__printf>
    80002f20:	00001097          	auipc	ra,0x1
    80002f24:	4a8080e7          	jalr	1192(ra) # 800043c8 <kinit>
    80002f28:	00000097          	auipc	ra,0x0
    80002f2c:	148080e7          	jalr	328(ra) # 80003070 <trapinit>
    80002f30:	00000097          	auipc	ra,0x0
    80002f34:	16c080e7          	jalr	364(ra) # 8000309c <trapinithart>
    80002f38:	00000097          	auipc	ra,0x0
    80002f3c:	5b8080e7          	jalr	1464(ra) # 800034f0 <plicinit>
    80002f40:	00000097          	auipc	ra,0x0
    80002f44:	5d8080e7          	jalr	1496(ra) # 80003518 <plicinithart>
    80002f48:	00000097          	auipc	ra,0x0
    80002f4c:	078080e7          	jalr	120(ra) # 80002fc0 <userinit>
    80002f50:	0ff0000f          	fence
    80002f54:	00100793          	li	a5,1
    80002f58:	00002517          	auipc	a0,0x2
    80002f5c:	67850513          	addi	a0,a0,1656 # 800055d0 <_ZZ12printIntegermE6digits+0x28>
    80002f60:	00f4a023          	sw	a5,0(s1)
    80002f64:	00001097          	auipc	ra,0x1
    80002f68:	a44080e7          	jalr	-1468(ra) # 800039a8 <__printf>
    80002f6c:	0000006f          	j	80002f6c <system_main+0xd4>

0000000080002f70 <cpuid>:
    80002f70:	ff010113          	addi	sp,sp,-16
    80002f74:	00813423          	sd	s0,8(sp)
    80002f78:	01010413          	addi	s0,sp,16
    80002f7c:	00020513          	mv	a0,tp
    80002f80:	00813403          	ld	s0,8(sp)
    80002f84:	0005051b          	sext.w	a0,a0
    80002f88:	01010113          	addi	sp,sp,16
    80002f8c:	00008067          	ret

0000000080002f90 <mycpu>:
    80002f90:	ff010113          	addi	sp,sp,-16
    80002f94:	00813423          	sd	s0,8(sp)
    80002f98:	01010413          	addi	s0,sp,16
    80002f9c:	00020793          	mv	a5,tp
    80002fa0:	00813403          	ld	s0,8(sp)
    80002fa4:	0007879b          	sext.w	a5,a5
    80002fa8:	00779793          	slli	a5,a5,0x7
    80002fac:	00004517          	auipc	a0,0x4
    80002fb0:	2e450513          	addi	a0,a0,740 # 80007290 <cpus>
    80002fb4:	00f50533          	add	a0,a0,a5
    80002fb8:	01010113          	addi	sp,sp,16
    80002fbc:	00008067          	ret

0000000080002fc0 <userinit>:
    80002fc0:	ff010113          	addi	sp,sp,-16
    80002fc4:	00813423          	sd	s0,8(sp)
    80002fc8:	01010413          	addi	s0,sp,16
    80002fcc:	00813403          	ld	s0,8(sp)
    80002fd0:	01010113          	addi	sp,sp,16
    80002fd4:	fffff317          	auipc	t1,0xfffff
    80002fd8:	bcc30067          	jr	-1076(t1) # 80001ba0 <main>

0000000080002fdc <either_copyout>:
    80002fdc:	ff010113          	addi	sp,sp,-16
    80002fe0:	00813023          	sd	s0,0(sp)
    80002fe4:	00113423          	sd	ra,8(sp)
    80002fe8:	01010413          	addi	s0,sp,16
    80002fec:	02051663          	bnez	a0,80003018 <either_copyout+0x3c>
    80002ff0:	00058513          	mv	a0,a1
    80002ff4:	00060593          	mv	a1,a2
    80002ff8:	0006861b          	sext.w	a2,a3
    80002ffc:	00002097          	auipc	ra,0x2
    80003000:	c58080e7          	jalr	-936(ra) # 80004c54 <__memmove>
    80003004:	00813083          	ld	ra,8(sp)
    80003008:	00013403          	ld	s0,0(sp)
    8000300c:	00000513          	li	a0,0
    80003010:	01010113          	addi	sp,sp,16
    80003014:	00008067          	ret
    80003018:	00002517          	auipc	a0,0x2
    8000301c:	5f850513          	addi	a0,a0,1528 # 80005610 <_ZZ12printIntegermE6digits+0x68>
    80003020:	00001097          	auipc	ra,0x1
    80003024:	92c080e7          	jalr	-1748(ra) # 8000394c <panic>

0000000080003028 <either_copyin>:
    80003028:	ff010113          	addi	sp,sp,-16
    8000302c:	00813023          	sd	s0,0(sp)
    80003030:	00113423          	sd	ra,8(sp)
    80003034:	01010413          	addi	s0,sp,16
    80003038:	02059463          	bnez	a1,80003060 <either_copyin+0x38>
    8000303c:	00060593          	mv	a1,a2
    80003040:	0006861b          	sext.w	a2,a3
    80003044:	00002097          	auipc	ra,0x2
    80003048:	c10080e7          	jalr	-1008(ra) # 80004c54 <__memmove>
    8000304c:	00813083          	ld	ra,8(sp)
    80003050:	00013403          	ld	s0,0(sp)
    80003054:	00000513          	li	a0,0
    80003058:	01010113          	addi	sp,sp,16
    8000305c:	00008067          	ret
    80003060:	00002517          	auipc	a0,0x2
    80003064:	5d850513          	addi	a0,a0,1496 # 80005638 <_ZZ12printIntegermE6digits+0x90>
    80003068:	00001097          	auipc	ra,0x1
    8000306c:	8e4080e7          	jalr	-1820(ra) # 8000394c <panic>

0000000080003070 <trapinit>:
    80003070:	ff010113          	addi	sp,sp,-16
    80003074:	00813423          	sd	s0,8(sp)
    80003078:	01010413          	addi	s0,sp,16
    8000307c:	00813403          	ld	s0,8(sp)
    80003080:	00002597          	auipc	a1,0x2
    80003084:	5e058593          	addi	a1,a1,1504 # 80005660 <_ZZ12printIntegermE6digits+0xb8>
    80003088:	00004517          	auipc	a0,0x4
    8000308c:	28850513          	addi	a0,a0,648 # 80007310 <tickslock>
    80003090:	01010113          	addi	sp,sp,16
    80003094:	00001317          	auipc	t1,0x1
    80003098:	5c430067          	jr	1476(t1) # 80004658 <initlock>

000000008000309c <trapinithart>:
    8000309c:	ff010113          	addi	sp,sp,-16
    800030a0:	00813423          	sd	s0,8(sp)
    800030a4:	01010413          	addi	s0,sp,16
    800030a8:	00000797          	auipc	a5,0x0
    800030ac:	2f878793          	addi	a5,a5,760 # 800033a0 <kernelvec>
    800030b0:	10579073          	csrw	stvec,a5
    800030b4:	00813403          	ld	s0,8(sp)
    800030b8:	01010113          	addi	sp,sp,16
    800030bc:	00008067          	ret

00000000800030c0 <usertrap>:
    800030c0:	ff010113          	addi	sp,sp,-16
    800030c4:	00813423          	sd	s0,8(sp)
    800030c8:	01010413          	addi	s0,sp,16
    800030cc:	00813403          	ld	s0,8(sp)
    800030d0:	01010113          	addi	sp,sp,16
    800030d4:	00008067          	ret

00000000800030d8 <usertrapret>:
    800030d8:	ff010113          	addi	sp,sp,-16
    800030dc:	00813423          	sd	s0,8(sp)
    800030e0:	01010413          	addi	s0,sp,16
    800030e4:	00813403          	ld	s0,8(sp)
    800030e8:	01010113          	addi	sp,sp,16
    800030ec:	00008067          	ret

00000000800030f0 <kerneltrap>:
    800030f0:	fe010113          	addi	sp,sp,-32
    800030f4:	00813823          	sd	s0,16(sp)
    800030f8:	00113c23          	sd	ra,24(sp)
    800030fc:	00913423          	sd	s1,8(sp)
    80003100:	02010413          	addi	s0,sp,32
    80003104:	142025f3          	csrr	a1,scause
    80003108:	100027f3          	csrr	a5,sstatus
    8000310c:	0027f793          	andi	a5,a5,2
    80003110:	10079c63          	bnez	a5,80003228 <kerneltrap+0x138>
    80003114:	142027f3          	csrr	a5,scause
    80003118:	0207ce63          	bltz	a5,80003154 <kerneltrap+0x64>
    8000311c:	00002517          	auipc	a0,0x2
    80003120:	58c50513          	addi	a0,a0,1420 # 800056a8 <_ZZ12printIntegermE6digits+0x100>
    80003124:	00001097          	auipc	ra,0x1
    80003128:	884080e7          	jalr	-1916(ra) # 800039a8 <__printf>
    8000312c:	141025f3          	csrr	a1,sepc
    80003130:	14302673          	csrr	a2,stval
    80003134:	00002517          	auipc	a0,0x2
    80003138:	58450513          	addi	a0,a0,1412 # 800056b8 <_ZZ12printIntegermE6digits+0x110>
    8000313c:	00001097          	auipc	ra,0x1
    80003140:	86c080e7          	jalr	-1940(ra) # 800039a8 <__printf>
    80003144:	00002517          	auipc	a0,0x2
    80003148:	58c50513          	addi	a0,a0,1420 # 800056d0 <_ZZ12printIntegermE6digits+0x128>
    8000314c:	00001097          	auipc	ra,0x1
    80003150:	800080e7          	jalr	-2048(ra) # 8000394c <panic>
    80003154:	0ff7f713          	andi	a4,a5,255
    80003158:	00900693          	li	a3,9
    8000315c:	04d70063          	beq	a4,a3,8000319c <kerneltrap+0xac>
    80003160:	fff00713          	li	a4,-1
    80003164:	03f71713          	slli	a4,a4,0x3f
    80003168:	00170713          	addi	a4,a4,1
    8000316c:	fae798e3          	bne	a5,a4,8000311c <kerneltrap+0x2c>
    80003170:	00000097          	auipc	ra,0x0
    80003174:	e00080e7          	jalr	-512(ra) # 80002f70 <cpuid>
    80003178:	06050663          	beqz	a0,800031e4 <kerneltrap+0xf4>
    8000317c:	144027f3          	csrr	a5,sip
    80003180:	ffd7f793          	andi	a5,a5,-3
    80003184:	14479073          	csrw	sip,a5
    80003188:	01813083          	ld	ra,24(sp)
    8000318c:	01013403          	ld	s0,16(sp)
    80003190:	00813483          	ld	s1,8(sp)
    80003194:	02010113          	addi	sp,sp,32
    80003198:	00008067          	ret
    8000319c:	00000097          	auipc	ra,0x0
    800031a0:	3c8080e7          	jalr	968(ra) # 80003564 <plic_claim>
    800031a4:	00a00793          	li	a5,10
    800031a8:	00050493          	mv	s1,a0
    800031ac:	06f50863          	beq	a0,a5,8000321c <kerneltrap+0x12c>
    800031b0:	fc050ce3          	beqz	a0,80003188 <kerneltrap+0x98>
    800031b4:	00050593          	mv	a1,a0
    800031b8:	00002517          	auipc	a0,0x2
    800031bc:	4d050513          	addi	a0,a0,1232 # 80005688 <_ZZ12printIntegermE6digits+0xe0>
    800031c0:	00000097          	auipc	ra,0x0
    800031c4:	7e8080e7          	jalr	2024(ra) # 800039a8 <__printf>
    800031c8:	01013403          	ld	s0,16(sp)
    800031cc:	01813083          	ld	ra,24(sp)
    800031d0:	00048513          	mv	a0,s1
    800031d4:	00813483          	ld	s1,8(sp)
    800031d8:	02010113          	addi	sp,sp,32
    800031dc:	00000317          	auipc	t1,0x0
    800031e0:	3c030067          	jr	960(t1) # 8000359c <plic_complete>
    800031e4:	00004517          	auipc	a0,0x4
    800031e8:	12c50513          	addi	a0,a0,300 # 80007310 <tickslock>
    800031ec:	00001097          	auipc	ra,0x1
    800031f0:	490080e7          	jalr	1168(ra) # 8000467c <acquire>
    800031f4:	00003717          	auipc	a4,0x3
    800031f8:	03070713          	addi	a4,a4,48 # 80006224 <ticks>
    800031fc:	00072783          	lw	a5,0(a4)
    80003200:	00004517          	auipc	a0,0x4
    80003204:	11050513          	addi	a0,a0,272 # 80007310 <tickslock>
    80003208:	0017879b          	addiw	a5,a5,1
    8000320c:	00f72023          	sw	a5,0(a4)
    80003210:	00001097          	auipc	ra,0x1
    80003214:	538080e7          	jalr	1336(ra) # 80004748 <release>
    80003218:	f65ff06f          	j	8000317c <kerneltrap+0x8c>
    8000321c:	00001097          	auipc	ra,0x1
    80003220:	094080e7          	jalr	148(ra) # 800042b0 <uartintr>
    80003224:	fa5ff06f          	j	800031c8 <kerneltrap+0xd8>
    80003228:	00002517          	auipc	a0,0x2
    8000322c:	44050513          	addi	a0,a0,1088 # 80005668 <_ZZ12printIntegermE6digits+0xc0>
    80003230:	00000097          	auipc	ra,0x0
    80003234:	71c080e7          	jalr	1820(ra) # 8000394c <panic>

0000000080003238 <clockintr>:
    80003238:	fe010113          	addi	sp,sp,-32
    8000323c:	00813823          	sd	s0,16(sp)
    80003240:	00913423          	sd	s1,8(sp)
    80003244:	00113c23          	sd	ra,24(sp)
    80003248:	02010413          	addi	s0,sp,32
    8000324c:	00004497          	auipc	s1,0x4
    80003250:	0c448493          	addi	s1,s1,196 # 80007310 <tickslock>
    80003254:	00048513          	mv	a0,s1
    80003258:	00001097          	auipc	ra,0x1
    8000325c:	424080e7          	jalr	1060(ra) # 8000467c <acquire>
    80003260:	00003717          	auipc	a4,0x3
    80003264:	fc470713          	addi	a4,a4,-60 # 80006224 <ticks>
    80003268:	00072783          	lw	a5,0(a4)
    8000326c:	01013403          	ld	s0,16(sp)
    80003270:	01813083          	ld	ra,24(sp)
    80003274:	00048513          	mv	a0,s1
    80003278:	0017879b          	addiw	a5,a5,1
    8000327c:	00813483          	ld	s1,8(sp)
    80003280:	00f72023          	sw	a5,0(a4)
    80003284:	02010113          	addi	sp,sp,32
    80003288:	00001317          	auipc	t1,0x1
    8000328c:	4c030067          	jr	1216(t1) # 80004748 <release>

0000000080003290 <devintr>:
    80003290:	142027f3          	csrr	a5,scause
    80003294:	00000513          	li	a0,0
    80003298:	0007c463          	bltz	a5,800032a0 <devintr+0x10>
    8000329c:	00008067          	ret
    800032a0:	fe010113          	addi	sp,sp,-32
    800032a4:	00813823          	sd	s0,16(sp)
    800032a8:	00113c23          	sd	ra,24(sp)
    800032ac:	00913423          	sd	s1,8(sp)
    800032b0:	02010413          	addi	s0,sp,32
    800032b4:	0ff7f713          	andi	a4,a5,255
    800032b8:	00900693          	li	a3,9
    800032bc:	04d70c63          	beq	a4,a3,80003314 <devintr+0x84>
    800032c0:	fff00713          	li	a4,-1
    800032c4:	03f71713          	slli	a4,a4,0x3f
    800032c8:	00170713          	addi	a4,a4,1
    800032cc:	00e78c63          	beq	a5,a4,800032e4 <devintr+0x54>
    800032d0:	01813083          	ld	ra,24(sp)
    800032d4:	01013403          	ld	s0,16(sp)
    800032d8:	00813483          	ld	s1,8(sp)
    800032dc:	02010113          	addi	sp,sp,32
    800032e0:	00008067          	ret
    800032e4:	00000097          	auipc	ra,0x0
    800032e8:	c8c080e7          	jalr	-884(ra) # 80002f70 <cpuid>
    800032ec:	06050663          	beqz	a0,80003358 <devintr+0xc8>
    800032f0:	144027f3          	csrr	a5,sip
    800032f4:	ffd7f793          	andi	a5,a5,-3
    800032f8:	14479073          	csrw	sip,a5
    800032fc:	01813083          	ld	ra,24(sp)
    80003300:	01013403          	ld	s0,16(sp)
    80003304:	00813483          	ld	s1,8(sp)
    80003308:	00200513          	li	a0,2
    8000330c:	02010113          	addi	sp,sp,32
    80003310:	00008067          	ret
    80003314:	00000097          	auipc	ra,0x0
    80003318:	250080e7          	jalr	592(ra) # 80003564 <plic_claim>
    8000331c:	00a00793          	li	a5,10
    80003320:	00050493          	mv	s1,a0
    80003324:	06f50663          	beq	a0,a5,80003390 <devintr+0x100>
    80003328:	00100513          	li	a0,1
    8000332c:	fa0482e3          	beqz	s1,800032d0 <devintr+0x40>
    80003330:	00048593          	mv	a1,s1
    80003334:	00002517          	auipc	a0,0x2
    80003338:	35450513          	addi	a0,a0,852 # 80005688 <_ZZ12printIntegermE6digits+0xe0>
    8000333c:	00000097          	auipc	ra,0x0
    80003340:	66c080e7          	jalr	1644(ra) # 800039a8 <__printf>
    80003344:	00048513          	mv	a0,s1
    80003348:	00000097          	auipc	ra,0x0
    8000334c:	254080e7          	jalr	596(ra) # 8000359c <plic_complete>
    80003350:	00100513          	li	a0,1
    80003354:	f7dff06f          	j	800032d0 <devintr+0x40>
    80003358:	00004517          	auipc	a0,0x4
    8000335c:	fb850513          	addi	a0,a0,-72 # 80007310 <tickslock>
    80003360:	00001097          	auipc	ra,0x1
    80003364:	31c080e7          	jalr	796(ra) # 8000467c <acquire>
    80003368:	00003717          	auipc	a4,0x3
    8000336c:	ebc70713          	addi	a4,a4,-324 # 80006224 <ticks>
    80003370:	00072783          	lw	a5,0(a4)
    80003374:	00004517          	auipc	a0,0x4
    80003378:	f9c50513          	addi	a0,a0,-100 # 80007310 <tickslock>
    8000337c:	0017879b          	addiw	a5,a5,1
    80003380:	00f72023          	sw	a5,0(a4)
    80003384:	00001097          	auipc	ra,0x1
    80003388:	3c4080e7          	jalr	964(ra) # 80004748 <release>
    8000338c:	f65ff06f          	j	800032f0 <devintr+0x60>
    80003390:	00001097          	auipc	ra,0x1
    80003394:	f20080e7          	jalr	-224(ra) # 800042b0 <uartintr>
    80003398:	fadff06f          	j	80003344 <devintr+0xb4>
    8000339c:	0000                	unimp
	...

00000000800033a0 <kernelvec>:
    800033a0:	f0010113          	addi	sp,sp,-256
    800033a4:	00113023          	sd	ra,0(sp)
    800033a8:	00213423          	sd	sp,8(sp)
    800033ac:	00313823          	sd	gp,16(sp)
    800033b0:	00413c23          	sd	tp,24(sp)
    800033b4:	02513023          	sd	t0,32(sp)
    800033b8:	02613423          	sd	t1,40(sp)
    800033bc:	02713823          	sd	t2,48(sp)
    800033c0:	02813c23          	sd	s0,56(sp)
    800033c4:	04913023          	sd	s1,64(sp)
    800033c8:	04a13423          	sd	a0,72(sp)
    800033cc:	04b13823          	sd	a1,80(sp)
    800033d0:	04c13c23          	sd	a2,88(sp)
    800033d4:	06d13023          	sd	a3,96(sp)
    800033d8:	06e13423          	sd	a4,104(sp)
    800033dc:	06f13823          	sd	a5,112(sp)
    800033e0:	07013c23          	sd	a6,120(sp)
    800033e4:	09113023          	sd	a7,128(sp)
    800033e8:	09213423          	sd	s2,136(sp)
    800033ec:	09313823          	sd	s3,144(sp)
    800033f0:	09413c23          	sd	s4,152(sp)
    800033f4:	0b513023          	sd	s5,160(sp)
    800033f8:	0b613423          	sd	s6,168(sp)
    800033fc:	0b713823          	sd	s7,176(sp)
    80003400:	0b813c23          	sd	s8,184(sp)
    80003404:	0d913023          	sd	s9,192(sp)
    80003408:	0da13423          	sd	s10,200(sp)
    8000340c:	0db13823          	sd	s11,208(sp)
    80003410:	0dc13c23          	sd	t3,216(sp)
    80003414:	0fd13023          	sd	t4,224(sp)
    80003418:	0fe13423          	sd	t5,232(sp)
    8000341c:	0ff13823          	sd	t6,240(sp)
    80003420:	cd1ff0ef          	jal	ra,800030f0 <kerneltrap>
    80003424:	00013083          	ld	ra,0(sp)
    80003428:	00813103          	ld	sp,8(sp)
    8000342c:	01013183          	ld	gp,16(sp)
    80003430:	02013283          	ld	t0,32(sp)
    80003434:	02813303          	ld	t1,40(sp)
    80003438:	03013383          	ld	t2,48(sp)
    8000343c:	03813403          	ld	s0,56(sp)
    80003440:	04013483          	ld	s1,64(sp)
    80003444:	04813503          	ld	a0,72(sp)
    80003448:	05013583          	ld	a1,80(sp)
    8000344c:	05813603          	ld	a2,88(sp)
    80003450:	06013683          	ld	a3,96(sp)
    80003454:	06813703          	ld	a4,104(sp)
    80003458:	07013783          	ld	a5,112(sp)
    8000345c:	07813803          	ld	a6,120(sp)
    80003460:	08013883          	ld	a7,128(sp)
    80003464:	08813903          	ld	s2,136(sp)
    80003468:	09013983          	ld	s3,144(sp)
    8000346c:	09813a03          	ld	s4,152(sp)
    80003470:	0a013a83          	ld	s5,160(sp)
    80003474:	0a813b03          	ld	s6,168(sp)
    80003478:	0b013b83          	ld	s7,176(sp)
    8000347c:	0b813c03          	ld	s8,184(sp)
    80003480:	0c013c83          	ld	s9,192(sp)
    80003484:	0c813d03          	ld	s10,200(sp)
    80003488:	0d013d83          	ld	s11,208(sp)
    8000348c:	0d813e03          	ld	t3,216(sp)
    80003490:	0e013e83          	ld	t4,224(sp)
    80003494:	0e813f03          	ld	t5,232(sp)
    80003498:	0f013f83          	ld	t6,240(sp)
    8000349c:	10010113          	addi	sp,sp,256
    800034a0:	10200073          	sret
    800034a4:	00000013          	nop
    800034a8:	00000013          	nop
    800034ac:	00000013          	nop

00000000800034b0 <timervec>:
    800034b0:	34051573          	csrrw	a0,mscratch,a0
    800034b4:	00b53023          	sd	a1,0(a0)
    800034b8:	00c53423          	sd	a2,8(a0)
    800034bc:	00d53823          	sd	a3,16(a0)
    800034c0:	01853583          	ld	a1,24(a0)
    800034c4:	02053603          	ld	a2,32(a0)
    800034c8:	0005b683          	ld	a3,0(a1)
    800034cc:	00c686b3          	add	a3,a3,a2
    800034d0:	00d5b023          	sd	a3,0(a1)
    800034d4:	00200593          	li	a1,2
    800034d8:	14459073          	csrw	sip,a1
    800034dc:	01053683          	ld	a3,16(a0)
    800034e0:	00853603          	ld	a2,8(a0)
    800034e4:	00053583          	ld	a1,0(a0)
    800034e8:	34051573          	csrrw	a0,mscratch,a0
    800034ec:	30200073          	mret

00000000800034f0 <plicinit>:
    800034f0:	ff010113          	addi	sp,sp,-16
    800034f4:	00813423          	sd	s0,8(sp)
    800034f8:	01010413          	addi	s0,sp,16
    800034fc:	00813403          	ld	s0,8(sp)
    80003500:	0c0007b7          	lui	a5,0xc000
    80003504:	00100713          	li	a4,1
    80003508:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000350c:	00e7a223          	sw	a4,4(a5)
    80003510:	01010113          	addi	sp,sp,16
    80003514:	00008067          	ret

0000000080003518 <plicinithart>:
    80003518:	ff010113          	addi	sp,sp,-16
    8000351c:	00813023          	sd	s0,0(sp)
    80003520:	00113423          	sd	ra,8(sp)
    80003524:	01010413          	addi	s0,sp,16
    80003528:	00000097          	auipc	ra,0x0
    8000352c:	a48080e7          	jalr	-1464(ra) # 80002f70 <cpuid>
    80003530:	0085171b          	slliw	a4,a0,0x8
    80003534:	0c0027b7          	lui	a5,0xc002
    80003538:	00e787b3          	add	a5,a5,a4
    8000353c:	40200713          	li	a4,1026
    80003540:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003544:	00813083          	ld	ra,8(sp)
    80003548:	00013403          	ld	s0,0(sp)
    8000354c:	00d5151b          	slliw	a0,a0,0xd
    80003550:	0c2017b7          	lui	a5,0xc201
    80003554:	00a78533          	add	a0,a5,a0
    80003558:	00052023          	sw	zero,0(a0)
    8000355c:	01010113          	addi	sp,sp,16
    80003560:	00008067          	ret

0000000080003564 <plic_claim>:
    80003564:	ff010113          	addi	sp,sp,-16
    80003568:	00813023          	sd	s0,0(sp)
    8000356c:	00113423          	sd	ra,8(sp)
    80003570:	01010413          	addi	s0,sp,16
    80003574:	00000097          	auipc	ra,0x0
    80003578:	9fc080e7          	jalr	-1540(ra) # 80002f70 <cpuid>
    8000357c:	00813083          	ld	ra,8(sp)
    80003580:	00013403          	ld	s0,0(sp)
    80003584:	00d5151b          	slliw	a0,a0,0xd
    80003588:	0c2017b7          	lui	a5,0xc201
    8000358c:	00a78533          	add	a0,a5,a0
    80003590:	00452503          	lw	a0,4(a0)
    80003594:	01010113          	addi	sp,sp,16
    80003598:	00008067          	ret

000000008000359c <plic_complete>:
    8000359c:	fe010113          	addi	sp,sp,-32
    800035a0:	00813823          	sd	s0,16(sp)
    800035a4:	00913423          	sd	s1,8(sp)
    800035a8:	00113c23          	sd	ra,24(sp)
    800035ac:	02010413          	addi	s0,sp,32
    800035b0:	00050493          	mv	s1,a0
    800035b4:	00000097          	auipc	ra,0x0
    800035b8:	9bc080e7          	jalr	-1604(ra) # 80002f70 <cpuid>
    800035bc:	01813083          	ld	ra,24(sp)
    800035c0:	01013403          	ld	s0,16(sp)
    800035c4:	00d5179b          	slliw	a5,a0,0xd
    800035c8:	0c201737          	lui	a4,0xc201
    800035cc:	00f707b3          	add	a5,a4,a5
    800035d0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800035d4:	00813483          	ld	s1,8(sp)
    800035d8:	02010113          	addi	sp,sp,32
    800035dc:	00008067          	ret

00000000800035e0 <consolewrite>:
    800035e0:	fb010113          	addi	sp,sp,-80
    800035e4:	04813023          	sd	s0,64(sp)
    800035e8:	04113423          	sd	ra,72(sp)
    800035ec:	02913c23          	sd	s1,56(sp)
    800035f0:	03213823          	sd	s2,48(sp)
    800035f4:	03313423          	sd	s3,40(sp)
    800035f8:	03413023          	sd	s4,32(sp)
    800035fc:	01513c23          	sd	s5,24(sp)
    80003600:	05010413          	addi	s0,sp,80
    80003604:	06c05c63          	blez	a2,8000367c <consolewrite+0x9c>
    80003608:	00060993          	mv	s3,a2
    8000360c:	00050a13          	mv	s4,a0
    80003610:	00058493          	mv	s1,a1
    80003614:	00000913          	li	s2,0
    80003618:	fff00a93          	li	s5,-1
    8000361c:	01c0006f          	j	80003638 <consolewrite+0x58>
    80003620:	fbf44503          	lbu	a0,-65(s0)
    80003624:	0019091b          	addiw	s2,s2,1
    80003628:	00148493          	addi	s1,s1,1
    8000362c:	00001097          	auipc	ra,0x1
    80003630:	a9c080e7          	jalr	-1380(ra) # 800040c8 <uartputc>
    80003634:	03298063          	beq	s3,s2,80003654 <consolewrite+0x74>
    80003638:	00048613          	mv	a2,s1
    8000363c:	00100693          	li	a3,1
    80003640:	000a0593          	mv	a1,s4
    80003644:	fbf40513          	addi	a0,s0,-65
    80003648:	00000097          	auipc	ra,0x0
    8000364c:	9e0080e7          	jalr	-1568(ra) # 80003028 <either_copyin>
    80003650:	fd5518e3          	bne	a0,s5,80003620 <consolewrite+0x40>
    80003654:	04813083          	ld	ra,72(sp)
    80003658:	04013403          	ld	s0,64(sp)
    8000365c:	03813483          	ld	s1,56(sp)
    80003660:	02813983          	ld	s3,40(sp)
    80003664:	02013a03          	ld	s4,32(sp)
    80003668:	01813a83          	ld	s5,24(sp)
    8000366c:	00090513          	mv	a0,s2
    80003670:	03013903          	ld	s2,48(sp)
    80003674:	05010113          	addi	sp,sp,80
    80003678:	00008067          	ret
    8000367c:	00000913          	li	s2,0
    80003680:	fd5ff06f          	j	80003654 <consolewrite+0x74>

0000000080003684 <consoleread>:
    80003684:	f9010113          	addi	sp,sp,-112
    80003688:	06813023          	sd	s0,96(sp)
    8000368c:	04913c23          	sd	s1,88(sp)
    80003690:	05213823          	sd	s2,80(sp)
    80003694:	05313423          	sd	s3,72(sp)
    80003698:	05413023          	sd	s4,64(sp)
    8000369c:	03513c23          	sd	s5,56(sp)
    800036a0:	03613823          	sd	s6,48(sp)
    800036a4:	03713423          	sd	s7,40(sp)
    800036a8:	03813023          	sd	s8,32(sp)
    800036ac:	06113423          	sd	ra,104(sp)
    800036b0:	01913c23          	sd	s9,24(sp)
    800036b4:	07010413          	addi	s0,sp,112
    800036b8:	00060b93          	mv	s7,a2
    800036bc:	00050913          	mv	s2,a0
    800036c0:	00058c13          	mv	s8,a1
    800036c4:	00060b1b          	sext.w	s6,a2
    800036c8:	00004497          	auipc	s1,0x4
    800036cc:	c7048493          	addi	s1,s1,-912 # 80007338 <cons>
    800036d0:	00400993          	li	s3,4
    800036d4:	fff00a13          	li	s4,-1
    800036d8:	00a00a93          	li	s5,10
    800036dc:	05705e63          	blez	s7,80003738 <consoleread+0xb4>
    800036e0:	09c4a703          	lw	a4,156(s1)
    800036e4:	0984a783          	lw	a5,152(s1)
    800036e8:	0007071b          	sext.w	a4,a4
    800036ec:	08e78463          	beq	a5,a4,80003774 <consoleread+0xf0>
    800036f0:	07f7f713          	andi	a4,a5,127
    800036f4:	00e48733          	add	a4,s1,a4
    800036f8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800036fc:	0017869b          	addiw	a3,a5,1
    80003700:	08d4ac23          	sw	a3,152(s1)
    80003704:	00070c9b          	sext.w	s9,a4
    80003708:	0b370663          	beq	a4,s3,800037b4 <consoleread+0x130>
    8000370c:	00100693          	li	a3,1
    80003710:	f9f40613          	addi	a2,s0,-97
    80003714:	000c0593          	mv	a1,s8
    80003718:	00090513          	mv	a0,s2
    8000371c:	f8e40fa3          	sb	a4,-97(s0)
    80003720:	00000097          	auipc	ra,0x0
    80003724:	8bc080e7          	jalr	-1860(ra) # 80002fdc <either_copyout>
    80003728:	01450863          	beq	a0,s4,80003738 <consoleread+0xb4>
    8000372c:	001c0c13          	addi	s8,s8,1
    80003730:	fffb8b9b          	addiw	s7,s7,-1
    80003734:	fb5c94e3          	bne	s9,s5,800036dc <consoleread+0x58>
    80003738:	000b851b          	sext.w	a0,s7
    8000373c:	06813083          	ld	ra,104(sp)
    80003740:	06013403          	ld	s0,96(sp)
    80003744:	05813483          	ld	s1,88(sp)
    80003748:	05013903          	ld	s2,80(sp)
    8000374c:	04813983          	ld	s3,72(sp)
    80003750:	04013a03          	ld	s4,64(sp)
    80003754:	03813a83          	ld	s5,56(sp)
    80003758:	02813b83          	ld	s7,40(sp)
    8000375c:	02013c03          	ld	s8,32(sp)
    80003760:	01813c83          	ld	s9,24(sp)
    80003764:	40ab053b          	subw	a0,s6,a0
    80003768:	03013b03          	ld	s6,48(sp)
    8000376c:	07010113          	addi	sp,sp,112
    80003770:	00008067          	ret
    80003774:	00001097          	auipc	ra,0x1
    80003778:	1d8080e7          	jalr	472(ra) # 8000494c <push_on>
    8000377c:	0984a703          	lw	a4,152(s1)
    80003780:	09c4a783          	lw	a5,156(s1)
    80003784:	0007879b          	sext.w	a5,a5
    80003788:	fef70ce3          	beq	a4,a5,80003780 <consoleread+0xfc>
    8000378c:	00001097          	auipc	ra,0x1
    80003790:	234080e7          	jalr	564(ra) # 800049c0 <pop_on>
    80003794:	0984a783          	lw	a5,152(s1)
    80003798:	07f7f713          	andi	a4,a5,127
    8000379c:	00e48733          	add	a4,s1,a4
    800037a0:	01874703          	lbu	a4,24(a4)
    800037a4:	0017869b          	addiw	a3,a5,1
    800037a8:	08d4ac23          	sw	a3,152(s1)
    800037ac:	00070c9b          	sext.w	s9,a4
    800037b0:	f5371ee3          	bne	a4,s3,8000370c <consoleread+0x88>
    800037b4:	000b851b          	sext.w	a0,s7
    800037b8:	f96bf2e3          	bgeu	s7,s6,8000373c <consoleread+0xb8>
    800037bc:	08f4ac23          	sw	a5,152(s1)
    800037c0:	f7dff06f          	j	8000373c <consoleread+0xb8>

00000000800037c4 <consputc>:
    800037c4:	10000793          	li	a5,256
    800037c8:	00f50663          	beq	a0,a5,800037d4 <consputc+0x10>
    800037cc:	00001317          	auipc	t1,0x1
    800037d0:	9f430067          	jr	-1548(t1) # 800041c0 <uartputc_sync>
    800037d4:	ff010113          	addi	sp,sp,-16
    800037d8:	00113423          	sd	ra,8(sp)
    800037dc:	00813023          	sd	s0,0(sp)
    800037e0:	01010413          	addi	s0,sp,16
    800037e4:	00800513          	li	a0,8
    800037e8:	00001097          	auipc	ra,0x1
    800037ec:	9d8080e7          	jalr	-1576(ra) # 800041c0 <uartputc_sync>
    800037f0:	02000513          	li	a0,32
    800037f4:	00001097          	auipc	ra,0x1
    800037f8:	9cc080e7          	jalr	-1588(ra) # 800041c0 <uartputc_sync>
    800037fc:	00013403          	ld	s0,0(sp)
    80003800:	00813083          	ld	ra,8(sp)
    80003804:	00800513          	li	a0,8
    80003808:	01010113          	addi	sp,sp,16
    8000380c:	00001317          	auipc	t1,0x1
    80003810:	9b430067          	jr	-1612(t1) # 800041c0 <uartputc_sync>

0000000080003814 <consoleintr>:
    80003814:	fe010113          	addi	sp,sp,-32
    80003818:	00813823          	sd	s0,16(sp)
    8000381c:	00913423          	sd	s1,8(sp)
    80003820:	01213023          	sd	s2,0(sp)
    80003824:	00113c23          	sd	ra,24(sp)
    80003828:	02010413          	addi	s0,sp,32
    8000382c:	00004917          	auipc	s2,0x4
    80003830:	b0c90913          	addi	s2,s2,-1268 # 80007338 <cons>
    80003834:	00050493          	mv	s1,a0
    80003838:	00090513          	mv	a0,s2
    8000383c:	00001097          	auipc	ra,0x1
    80003840:	e40080e7          	jalr	-448(ra) # 8000467c <acquire>
    80003844:	02048c63          	beqz	s1,8000387c <consoleintr+0x68>
    80003848:	0a092783          	lw	a5,160(s2)
    8000384c:	09892703          	lw	a4,152(s2)
    80003850:	07f00693          	li	a3,127
    80003854:	40e7873b          	subw	a4,a5,a4
    80003858:	02e6e263          	bltu	a3,a4,8000387c <consoleintr+0x68>
    8000385c:	00d00713          	li	a4,13
    80003860:	04e48063          	beq	s1,a4,800038a0 <consoleintr+0x8c>
    80003864:	07f7f713          	andi	a4,a5,127
    80003868:	00e90733          	add	a4,s2,a4
    8000386c:	0017879b          	addiw	a5,a5,1
    80003870:	0af92023          	sw	a5,160(s2)
    80003874:	00970c23          	sb	s1,24(a4)
    80003878:	08f92e23          	sw	a5,156(s2)
    8000387c:	01013403          	ld	s0,16(sp)
    80003880:	01813083          	ld	ra,24(sp)
    80003884:	00813483          	ld	s1,8(sp)
    80003888:	00013903          	ld	s2,0(sp)
    8000388c:	00004517          	auipc	a0,0x4
    80003890:	aac50513          	addi	a0,a0,-1364 # 80007338 <cons>
    80003894:	02010113          	addi	sp,sp,32
    80003898:	00001317          	auipc	t1,0x1
    8000389c:	eb030067          	jr	-336(t1) # 80004748 <release>
    800038a0:	00a00493          	li	s1,10
    800038a4:	fc1ff06f          	j	80003864 <consoleintr+0x50>

00000000800038a8 <consoleinit>:
    800038a8:	fe010113          	addi	sp,sp,-32
    800038ac:	00113c23          	sd	ra,24(sp)
    800038b0:	00813823          	sd	s0,16(sp)
    800038b4:	00913423          	sd	s1,8(sp)
    800038b8:	02010413          	addi	s0,sp,32
    800038bc:	00004497          	auipc	s1,0x4
    800038c0:	a7c48493          	addi	s1,s1,-1412 # 80007338 <cons>
    800038c4:	00048513          	mv	a0,s1
    800038c8:	00002597          	auipc	a1,0x2
    800038cc:	e1858593          	addi	a1,a1,-488 # 800056e0 <_ZZ12printIntegermE6digits+0x138>
    800038d0:	00001097          	auipc	ra,0x1
    800038d4:	d88080e7          	jalr	-632(ra) # 80004658 <initlock>
    800038d8:	00000097          	auipc	ra,0x0
    800038dc:	7ac080e7          	jalr	1964(ra) # 80004084 <uartinit>
    800038e0:	01813083          	ld	ra,24(sp)
    800038e4:	01013403          	ld	s0,16(sp)
    800038e8:	00000797          	auipc	a5,0x0
    800038ec:	d9c78793          	addi	a5,a5,-612 # 80003684 <consoleread>
    800038f0:	0af4bc23          	sd	a5,184(s1)
    800038f4:	00000797          	auipc	a5,0x0
    800038f8:	cec78793          	addi	a5,a5,-788 # 800035e0 <consolewrite>
    800038fc:	0cf4b023          	sd	a5,192(s1)
    80003900:	00813483          	ld	s1,8(sp)
    80003904:	02010113          	addi	sp,sp,32
    80003908:	00008067          	ret

000000008000390c <console_read>:
    8000390c:	ff010113          	addi	sp,sp,-16
    80003910:	00813423          	sd	s0,8(sp)
    80003914:	01010413          	addi	s0,sp,16
    80003918:	00813403          	ld	s0,8(sp)
    8000391c:	00004317          	auipc	t1,0x4
    80003920:	ad433303          	ld	t1,-1324(t1) # 800073f0 <devsw+0x10>
    80003924:	01010113          	addi	sp,sp,16
    80003928:	00030067          	jr	t1

000000008000392c <console_write>:
    8000392c:	ff010113          	addi	sp,sp,-16
    80003930:	00813423          	sd	s0,8(sp)
    80003934:	01010413          	addi	s0,sp,16
    80003938:	00813403          	ld	s0,8(sp)
    8000393c:	00004317          	auipc	t1,0x4
    80003940:	abc33303          	ld	t1,-1348(t1) # 800073f8 <devsw+0x18>
    80003944:	01010113          	addi	sp,sp,16
    80003948:	00030067          	jr	t1

000000008000394c <panic>:
    8000394c:	fe010113          	addi	sp,sp,-32
    80003950:	00113c23          	sd	ra,24(sp)
    80003954:	00813823          	sd	s0,16(sp)
    80003958:	00913423          	sd	s1,8(sp)
    8000395c:	02010413          	addi	s0,sp,32
    80003960:	00050493          	mv	s1,a0
    80003964:	00002517          	auipc	a0,0x2
    80003968:	d8450513          	addi	a0,a0,-636 # 800056e8 <_ZZ12printIntegermE6digits+0x140>
    8000396c:	00004797          	auipc	a5,0x4
    80003970:	b207a623          	sw	zero,-1236(a5) # 80007498 <pr+0x18>
    80003974:	00000097          	auipc	ra,0x0
    80003978:	034080e7          	jalr	52(ra) # 800039a8 <__printf>
    8000397c:	00048513          	mv	a0,s1
    80003980:	00000097          	auipc	ra,0x0
    80003984:	028080e7          	jalr	40(ra) # 800039a8 <__printf>
    80003988:	00002517          	auipc	a0,0x2
    8000398c:	85050513          	addi	a0,a0,-1968 # 800051d8 <CONSOLE_STATUS+0x1c8>
    80003990:	00000097          	auipc	ra,0x0
    80003994:	018080e7          	jalr	24(ra) # 800039a8 <__printf>
    80003998:	00100793          	li	a5,1
    8000399c:	00003717          	auipc	a4,0x3
    800039a0:	88f72623          	sw	a5,-1908(a4) # 80006228 <panicked>
    800039a4:	0000006f          	j	800039a4 <panic+0x58>

00000000800039a8 <__printf>:
    800039a8:	f3010113          	addi	sp,sp,-208
    800039ac:	08813023          	sd	s0,128(sp)
    800039b0:	07313423          	sd	s3,104(sp)
    800039b4:	09010413          	addi	s0,sp,144
    800039b8:	05813023          	sd	s8,64(sp)
    800039bc:	08113423          	sd	ra,136(sp)
    800039c0:	06913c23          	sd	s1,120(sp)
    800039c4:	07213823          	sd	s2,112(sp)
    800039c8:	07413023          	sd	s4,96(sp)
    800039cc:	05513c23          	sd	s5,88(sp)
    800039d0:	05613823          	sd	s6,80(sp)
    800039d4:	05713423          	sd	s7,72(sp)
    800039d8:	03913c23          	sd	s9,56(sp)
    800039dc:	03a13823          	sd	s10,48(sp)
    800039e0:	03b13423          	sd	s11,40(sp)
    800039e4:	00004317          	auipc	t1,0x4
    800039e8:	a9c30313          	addi	t1,t1,-1380 # 80007480 <pr>
    800039ec:	01832c03          	lw	s8,24(t1)
    800039f0:	00b43423          	sd	a1,8(s0)
    800039f4:	00c43823          	sd	a2,16(s0)
    800039f8:	00d43c23          	sd	a3,24(s0)
    800039fc:	02e43023          	sd	a4,32(s0)
    80003a00:	02f43423          	sd	a5,40(s0)
    80003a04:	03043823          	sd	a6,48(s0)
    80003a08:	03143c23          	sd	a7,56(s0)
    80003a0c:	00050993          	mv	s3,a0
    80003a10:	4a0c1663          	bnez	s8,80003ebc <__printf+0x514>
    80003a14:	60098c63          	beqz	s3,8000402c <__printf+0x684>
    80003a18:	0009c503          	lbu	a0,0(s3)
    80003a1c:	00840793          	addi	a5,s0,8
    80003a20:	f6f43c23          	sd	a5,-136(s0)
    80003a24:	00000493          	li	s1,0
    80003a28:	22050063          	beqz	a0,80003c48 <__printf+0x2a0>
    80003a2c:	00002a37          	lui	s4,0x2
    80003a30:	00018ab7          	lui	s5,0x18
    80003a34:	000f4b37          	lui	s6,0xf4
    80003a38:	00989bb7          	lui	s7,0x989
    80003a3c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003a40:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003a44:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003a48:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80003a4c:	00148c9b          	addiw	s9,s1,1
    80003a50:	02500793          	li	a5,37
    80003a54:	01998933          	add	s2,s3,s9
    80003a58:	38f51263          	bne	a0,a5,80003ddc <__printf+0x434>
    80003a5c:	00094783          	lbu	a5,0(s2)
    80003a60:	00078c9b          	sext.w	s9,a5
    80003a64:	1e078263          	beqz	a5,80003c48 <__printf+0x2a0>
    80003a68:	0024849b          	addiw	s1,s1,2
    80003a6c:	07000713          	li	a4,112
    80003a70:	00998933          	add	s2,s3,s1
    80003a74:	38e78a63          	beq	a5,a4,80003e08 <__printf+0x460>
    80003a78:	20f76863          	bltu	a4,a5,80003c88 <__printf+0x2e0>
    80003a7c:	42a78863          	beq	a5,a0,80003eac <__printf+0x504>
    80003a80:	06400713          	li	a4,100
    80003a84:	40e79663          	bne	a5,a4,80003e90 <__printf+0x4e8>
    80003a88:	f7843783          	ld	a5,-136(s0)
    80003a8c:	0007a603          	lw	a2,0(a5)
    80003a90:	00878793          	addi	a5,a5,8
    80003a94:	f6f43c23          	sd	a5,-136(s0)
    80003a98:	42064a63          	bltz	a2,80003ecc <__printf+0x524>
    80003a9c:	00a00713          	li	a4,10
    80003aa0:	02e677bb          	remuw	a5,a2,a4
    80003aa4:	00002d97          	auipc	s11,0x2
    80003aa8:	c6cd8d93          	addi	s11,s11,-916 # 80005710 <digits>
    80003aac:	00900593          	li	a1,9
    80003ab0:	0006051b          	sext.w	a0,a2
    80003ab4:	00000c93          	li	s9,0
    80003ab8:	02079793          	slli	a5,a5,0x20
    80003abc:	0207d793          	srli	a5,a5,0x20
    80003ac0:	00fd87b3          	add	a5,s11,a5
    80003ac4:	0007c783          	lbu	a5,0(a5)
    80003ac8:	02e656bb          	divuw	a3,a2,a4
    80003acc:	f8f40023          	sb	a5,-128(s0)
    80003ad0:	14c5d863          	bge	a1,a2,80003c20 <__printf+0x278>
    80003ad4:	06300593          	li	a1,99
    80003ad8:	00100c93          	li	s9,1
    80003adc:	02e6f7bb          	remuw	a5,a3,a4
    80003ae0:	02079793          	slli	a5,a5,0x20
    80003ae4:	0207d793          	srli	a5,a5,0x20
    80003ae8:	00fd87b3          	add	a5,s11,a5
    80003aec:	0007c783          	lbu	a5,0(a5)
    80003af0:	02e6d73b          	divuw	a4,a3,a4
    80003af4:	f8f400a3          	sb	a5,-127(s0)
    80003af8:	12a5f463          	bgeu	a1,a0,80003c20 <__printf+0x278>
    80003afc:	00a00693          	li	a3,10
    80003b00:	00900593          	li	a1,9
    80003b04:	02d777bb          	remuw	a5,a4,a3
    80003b08:	02079793          	slli	a5,a5,0x20
    80003b0c:	0207d793          	srli	a5,a5,0x20
    80003b10:	00fd87b3          	add	a5,s11,a5
    80003b14:	0007c503          	lbu	a0,0(a5)
    80003b18:	02d757bb          	divuw	a5,a4,a3
    80003b1c:	f8a40123          	sb	a0,-126(s0)
    80003b20:	48e5f263          	bgeu	a1,a4,80003fa4 <__printf+0x5fc>
    80003b24:	06300513          	li	a0,99
    80003b28:	02d7f5bb          	remuw	a1,a5,a3
    80003b2c:	02059593          	slli	a1,a1,0x20
    80003b30:	0205d593          	srli	a1,a1,0x20
    80003b34:	00bd85b3          	add	a1,s11,a1
    80003b38:	0005c583          	lbu	a1,0(a1)
    80003b3c:	02d7d7bb          	divuw	a5,a5,a3
    80003b40:	f8b401a3          	sb	a1,-125(s0)
    80003b44:	48e57263          	bgeu	a0,a4,80003fc8 <__printf+0x620>
    80003b48:	3e700513          	li	a0,999
    80003b4c:	02d7f5bb          	remuw	a1,a5,a3
    80003b50:	02059593          	slli	a1,a1,0x20
    80003b54:	0205d593          	srli	a1,a1,0x20
    80003b58:	00bd85b3          	add	a1,s11,a1
    80003b5c:	0005c583          	lbu	a1,0(a1)
    80003b60:	02d7d7bb          	divuw	a5,a5,a3
    80003b64:	f8b40223          	sb	a1,-124(s0)
    80003b68:	46e57663          	bgeu	a0,a4,80003fd4 <__printf+0x62c>
    80003b6c:	02d7f5bb          	remuw	a1,a5,a3
    80003b70:	02059593          	slli	a1,a1,0x20
    80003b74:	0205d593          	srli	a1,a1,0x20
    80003b78:	00bd85b3          	add	a1,s11,a1
    80003b7c:	0005c583          	lbu	a1,0(a1)
    80003b80:	02d7d7bb          	divuw	a5,a5,a3
    80003b84:	f8b402a3          	sb	a1,-123(s0)
    80003b88:	46ea7863          	bgeu	s4,a4,80003ff8 <__printf+0x650>
    80003b8c:	02d7f5bb          	remuw	a1,a5,a3
    80003b90:	02059593          	slli	a1,a1,0x20
    80003b94:	0205d593          	srli	a1,a1,0x20
    80003b98:	00bd85b3          	add	a1,s11,a1
    80003b9c:	0005c583          	lbu	a1,0(a1)
    80003ba0:	02d7d7bb          	divuw	a5,a5,a3
    80003ba4:	f8b40323          	sb	a1,-122(s0)
    80003ba8:	3eeaf863          	bgeu	s5,a4,80003f98 <__printf+0x5f0>
    80003bac:	02d7f5bb          	remuw	a1,a5,a3
    80003bb0:	02059593          	slli	a1,a1,0x20
    80003bb4:	0205d593          	srli	a1,a1,0x20
    80003bb8:	00bd85b3          	add	a1,s11,a1
    80003bbc:	0005c583          	lbu	a1,0(a1)
    80003bc0:	02d7d7bb          	divuw	a5,a5,a3
    80003bc4:	f8b403a3          	sb	a1,-121(s0)
    80003bc8:	42eb7e63          	bgeu	s6,a4,80004004 <__printf+0x65c>
    80003bcc:	02d7f5bb          	remuw	a1,a5,a3
    80003bd0:	02059593          	slli	a1,a1,0x20
    80003bd4:	0205d593          	srli	a1,a1,0x20
    80003bd8:	00bd85b3          	add	a1,s11,a1
    80003bdc:	0005c583          	lbu	a1,0(a1)
    80003be0:	02d7d7bb          	divuw	a5,a5,a3
    80003be4:	f8b40423          	sb	a1,-120(s0)
    80003be8:	42ebfc63          	bgeu	s7,a4,80004020 <__printf+0x678>
    80003bec:	02079793          	slli	a5,a5,0x20
    80003bf0:	0207d793          	srli	a5,a5,0x20
    80003bf4:	00fd8db3          	add	s11,s11,a5
    80003bf8:	000dc703          	lbu	a4,0(s11)
    80003bfc:	00a00793          	li	a5,10
    80003c00:	00900c93          	li	s9,9
    80003c04:	f8e404a3          	sb	a4,-119(s0)
    80003c08:	00065c63          	bgez	a2,80003c20 <__printf+0x278>
    80003c0c:	f9040713          	addi	a4,s0,-112
    80003c10:	00f70733          	add	a4,a4,a5
    80003c14:	02d00693          	li	a3,45
    80003c18:	fed70823          	sb	a3,-16(a4)
    80003c1c:	00078c93          	mv	s9,a5
    80003c20:	f8040793          	addi	a5,s0,-128
    80003c24:	01978cb3          	add	s9,a5,s9
    80003c28:	f7f40d13          	addi	s10,s0,-129
    80003c2c:	000cc503          	lbu	a0,0(s9)
    80003c30:	fffc8c93          	addi	s9,s9,-1
    80003c34:	00000097          	auipc	ra,0x0
    80003c38:	b90080e7          	jalr	-1136(ra) # 800037c4 <consputc>
    80003c3c:	ffac98e3          	bne	s9,s10,80003c2c <__printf+0x284>
    80003c40:	00094503          	lbu	a0,0(s2)
    80003c44:	e00514e3          	bnez	a0,80003a4c <__printf+0xa4>
    80003c48:	1a0c1663          	bnez	s8,80003df4 <__printf+0x44c>
    80003c4c:	08813083          	ld	ra,136(sp)
    80003c50:	08013403          	ld	s0,128(sp)
    80003c54:	07813483          	ld	s1,120(sp)
    80003c58:	07013903          	ld	s2,112(sp)
    80003c5c:	06813983          	ld	s3,104(sp)
    80003c60:	06013a03          	ld	s4,96(sp)
    80003c64:	05813a83          	ld	s5,88(sp)
    80003c68:	05013b03          	ld	s6,80(sp)
    80003c6c:	04813b83          	ld	s7,72(sp)
    80003c70:	04013c03          	ld	s8,64(sp)
    80003c74:	03813c83          	ld	s9,56(sp)
    80003c78:	03013d03          	ld	s10,48(sp)
    80003c7c:	02813d83          	ld	s11,40(sp)
    80003c80:	0d010113          	addi	sp,sp,208
    80003c84:	00008067          	ret
    80003c88:	07300713          	li	a4,115
    80003c8c:	1ce78a63          	beq	a5,a4,80003e60 <__printf+0x4b8>
    80003c90:	07800713          	li	a4,120
    80003c94:	1ee79e63          	bne	a5,a4,80003e90 <__printf+0x4e8>
    80003c98:	f7843783          	ld	a5,-136(s0)
    80003c9c:	0007a703          	lw	a4,0(a5)
    80003ca0:	00878793          	addi	a5,a5,8
    80003ca4:	f6f43c23          	sd	a5,-136(s0)
    80003ca8:	28074263          	bltz	a4,80003f2c <__printf+0x584>
    80003cac:	00002d97          	auipc	s11,0x2
    80003cb0:	a64d8d93          	addi	s11,s11,-1436 # 80005710 <digits>
    80003cb4:	00f77793          	andi	a5,a4,15
    80003cb8:	00fd87b3          	add	a5,s11,a5
    80003cbc:	0007c683          	lbu	a3,0(a5)
    80003cc0:	00f00613          	li	a2,15
    80003cc4:	0007079b          	sext.w	a5,a4
    80003cc8:	f8d40023          	sb	a3,-128(s0)
    80003ccc:	0047559b          	srliw	a1,a4,0x4
    80003cd0:	0047569b          	srliw	a3,a4,0x4
    80003cd4:	00000c93          	li	s9,0
    80003cd8:	0ee65063          	bge	a2,a4,80003db8 <__printf+0x410>
    80003cdc:	00f6f693          	andi	a3,a3,15
    80003ce0:	00dd86b3          	add	a3,s11,a3
    80003ce4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003ce8:	0087d79b          	srliw	a5,a5,0x8
    80003cec:	00100c93          	li	s9,1
    80003cf0:	f8d400a3          	sb	a3,-127(s0)
    80003cf4:	0cb67263          	bgeu	a2,a1,80003db8 <__printf+0x410>
    80003cf8:	00f7f693          	andi	a3,a5,15
    80003cfc:	00dd86b3          	add	a3,s11,a3
    80003d00:	0006c583          	lbu	a1,0(a3)
    80003d04:	00f00613          	li	a2,15
    80003d08:	0047d69b          	srliw	a3,a5,0x4
    80003d0c:	f8b40123          	sb	a1,-126(s0)
    80003d10:	0047d593          	srli	a1,a5,0x4
    80003d14:	28f67e63          	bgeu	a2,a5,80003fb0 <__printf+0x608>
    80003d18:	00f6f693          	andi	a3,a3,15
    80003d1c:	00dd86b3          	add	a3,s11,a3
    80003d20:	0006c503          	lbu	a0,0(a3)
    80003d24:	0087d813          	srli	a6,a5,0x8
    80003d28:	0087d69b          	srliw	a3,a5,0x8
    80003d2c:	f8a401a3          	sb	a0,-125(s0)
    80003d30:	28b67663          	bgeu	a2,a1,80003fbc <__printf+0x614>
    80003d34:	00f6f693          	andi	a3,a3,15
    80003d38:	00dd86b3          	add	a3,s11,a3
    80003d3c:	0006c583          	lbu	a1,0(a3)
    80003d40:	00c7d513          	srli	a0,a5,0xc
    80003d44:	00c7d69b          	srliw	a3,a5,0xc
    80003d48:	f8b40223          	sb	a1,-124(s0)
    80003d4c:	29067a63          	bgeu	a2,a6,80003fe0 <__printf+0x638>
    80003d50:	00f6f693          	andi	a3,a3,15
    80003d54:	00dd86b3          	add	a3,s11,a3
    80003d58:	0006c583          	lbu	a1,0(a3)
    80003d5c:	0107d813          	srli	a6,a5,0x10
    80003d60:	0107d69b          	srliw	a3,a5,0x10
    80003d64:	f8b402a3          	sb	a1,-123(s0)
    80003d68:	28a67263          	bgeu	a2,a0,80003fec <__printf+0x644>
    80003d6c:	00f6f693          	andi	a3,a3,15
    80003d70:	00dd86b3          	add	a3,s11,a3
    80003d74:	0006c683          	lbu	a3,0(a3)
    80003d78:	0147d79b          	srliw	a5,a5,0x14
    80003d7c:	f8d40323          	sb	a3,-122(s0)
    80003d80:	21067663          	bgeu	a2,a6,80003f8c <__printf+0x5e4>
    80003d84:	02079793          	slli	a5,a5,0x20
    80003d88:	0207d793          	srli	a5,a5,0x20
    80003d8c:	00fd8db3          	add	s11,s11,a5
    80003d90:	000dc683          	lbu	a3,0(s11)
    80003d94:	00800793          	li	a5,8
    80003d98:	00700c93          	li	s9,7
    80003d9c:	f8d403a3          	sb	a3,-121(s0)
    80003da0:	00075c63          	bgez	a4,80003db8 <__printf+0x410>
    80003da4:	f9040713          	addi	a4,s0,-112
    80003da8:	00f70733          	add	a4,a4,a5
    80003dac:	02d00693          	li	a3,45
    80003db0:	fed70823          	sb	a3,-16(a4)
    80003db4:	00078c93          	mv	s9,a5
    80003db8:	f8040793          	addi	a5,s0,-128
    80003dbc:	01978cb3          	add	s9,a5,s9
    80003dc0:	f7f40d13          	addi	s10,s0,-129
    80003dc4:	000cc503          	lbu	a0,0(s9)
    80003dc8:	fffc8c93          	addi	s9,s9,-1
    80003dcc:	00000097          	auipc	ra,0x0
    80003dd0:	9f8080e7          	jalr	-1544(ra) # 800037c4 <consputc>
    80003dd4:	ff9d18e3          	bne	s10,s9,80003dc4 <__printf+0x41c>
    80003dd8:	0100006f          	j	80003de8 <__printf+0x440>
    80003ddc:	00000097          	auipc	ra,0x0
    80003de0:	9e8080e7          	jalr	-1560(ra) # 800037c4 <consputc>
    80003de4:	000c8493          	mv	s1,s9
    80003de8:	00094503          	lbu	a0,0(s2)
    80003dec:	c60510e3          	bnez	a0,80003a4c <__printf+0xa4>
    80003df0:	e40c0ee3          	beqz	s8,80003c4c <__printf+0x2a4>
    80003df4:	00003517          	auipc	a0,0x3
    80003df8:	68c50513          	addi	a0,a0,1676 # 80007480 <pr>
    80003dfc:	00001097          	auipc	ra,0x1
    80003e00:	94c080e7          	jalr	-1716(ra) # 80004748 <release>
    80003e04:	e49ff06f          	j	80003c4c <__printf+0x2a4>
    80003e08:	f7843783          	ld	a5,-136(s0)
    80003e0c:	03000513          	li	a0,48
    80003e10:	01000d13          	li	s10,16
    80003e14:	00878713          	addi	a4,a5,8
    80003e18:	0007bc83          	ld	s9,0(a5)
    80003e1c:	f6e43c23          	sd	a4,-136(s0)
    80003e20:	00000097          	auipc	ra,0x0
    80003e24:	9a4080e7          	jalr	-1628(ra) # 800037c4 <consputc>
    80003e28:	07800513          	li	a0,120
    80003e2c:	00000097          	auipc	ra,0x0
    80003e30:	998080e7          	jalr	-1640(ra) # 800037c4 <consputc>
    80003e34:	00002d97          	auipc	s11,0x2
    80003e38:	8dcd8d93          	addi	s11,s11,-1828 # 80005710 <digits>
    80003e3c:	03ccd793          	srli	a5,s9,0x3c
    80003e40:	00fd87b3          	add	a5,s11,a5
    80003e44:	0007c503          	lbu	a0,0(a5)
    80003e48:	fffd0d1b          	addiw	s10,s10,-1
    80003e4c:	004c9c93          	slli	s9,s9,0x4
    80003e50:	00000097          	auipc	ra,0x0
    80003e54:	974080e7          	jalr	-1676(ra) # 800037c4 <consputc>
    80003e58:	fe0d12e3          	bnez	s10,80003e3c <__printf+0x494>
    80003e5c:	f8dff06f          	j	80003de8 <__printf+0x440>
    80003e60:	f7843783          	ld	a5,-136(s0)
    80003e64:	0007bc83          	ld	s9,0(a5)
    80003e68:	00878793          	addi	a5,a5,8
    80003e6c:	f6f43c23          	sd	a5,-136(s0)
    80003e70:	000c9a63          	bnez	s9,80003e84 <__printf+0x4dc>
    80003e74:	1080006f          	j	80003f7c <__printf+0x5d4>
    80003e78:	001c8c93          	addi	s9,s9,1
    80003e7c:	00000097          	auipc	ra,0x0
    80003e80:	948080e7          	jalr	-1720(ra) # 800037c4 <consputc>
    80003e84:	000cc503          	lbu	a0,0(s9)
    80003e88:	fe0518e3          	bnez	a0,80003e78 <__printf+0x4d0>
    80003e8c:	f5dff06f          	j	80003de8 <__printf+0x440>
    80003e90:	02500513          	li	a0,37
    80003e94:	00000097          	auipc	ra,0x0
    80003e98:	930080e7          	jalr	-1744(ra) # 800037c4 <consputc>
    80003e9c:	000c8513          	mv	a0,s9
    80003ea0:	00000097          	auipc	ra,0x0
    80003ea4:	924080e7          	jalr	-1756(ra) # 800037c4 <consputc>
    80003ea8:	f41ff06f          	j	80003de8 <__printf+0x440>
    80003eac:	02500513          	li	a0,37
    80003eb0:	00000097          	auipc	ra,0x0
    80003eb4:	914080e7          	jalr	-1772(ra) # 800037c4 <consputc>
    80003eb8:	f31ff06f          	j	80003de8 <__printf+0x440>
    80003ebc:	00030513          	mv	a0,t1
    80003ec0:	00000097          	auipc	ra,0x0
    80003ec4:	7bc080e7          	jalr	1980(ra) # 8000467c <acquire>
    80003ec8:	b4dff06f          	j	80003a14 <__printf+0x6c>
    80003ecc:	40c0053b          	negw	a0,a2
    80003ed0:	00a00713          	li	a4,10
    80003ed4:	02e576bb          	remuw	a3,a0,a4
    80003ed8:	00002d97          	auipc	s11,0x2
    80003edc:	838d8d93          	addi	s11,s11,-1992 # 80005710 <digits>
    80003ee0:	ff700593          	li	a1,-9
    80003ee4:	02069693          	slli	a3,a3,0x20
    80003ee8:	0206d693          	srli	a3,a3,0x20
    80003eec:	00dd86b3          	add	a3,s11,a3
    80003ef0:	0006c683          	lbu	a3,0(a3)
    80003ef4:	02e557bb          	divuw	a5,a0,a4
    80003ef8:	f8d40023          	sb	a3,-128(s0)
    80003efc:	10b65e63          	bge	a2,a1,80004018 <__printf+0x670>
    80003f00:	06300593          	li	a1,99
    80003f04:	02e7f6bb          	remuw	a3,a5,a4
    80003f08:	02069693          	slli	a3,a3,0x20
    80003f0c:	0206d693          	srli	a3,a3,0x20
    80003f10:	00dd86b3          	add	a3,s11,a3
    80003f14:	0006c683          	lbu	a3,0(a3)
    80003f18:	02e7d73b          	divuw	a4,a5,a4
    80003f1c:	00200793          	li	a5,2
    80003f20:	f8d400a3          	sb	a3,-127(s0)
    80003f24:	bca5ece3          	bltu	a1,a0,80003afc <__printf+0x154>
    80003f28:	ce5ff06f          	j	80003c0c <__printf+0x264>
    80003f2c:	40e007bb          	negw	a5,a4
    80003f30:	00001d97          	auipc	s11,0x1
    80003f34:	7e0d8d93          	addi	s11,s11,2016 # 80005710 <digits>
    80003f38:	00f7f693          	andi	a3,a5,15
    80003f3c:	00dd86b3          	add	a3,s11,a3
    80003f40:	0006c583          	lbu	a1,0(a3)
    80003f44:	ff100613          	li	a2,-15
    80003f48:	0047d69b          	srliw	a3,a5,0x4
    80003f4c:	f8b40023          	sb	a1,-128(s0)
    80003f50:	0047d59b          	srliw	a1,a5,0x4
    80003f54:	0ac75e63          	bge	a4,a2,80004010 <__printf+0x668>
    80003f58:	00f6f693          	andi	a3,a3,15
    80003f5c:	00dd86b3          	add	a3,s11,a3
    80003f60:	0006c603          	lbu	a2,0(a3)
    80003f64:	00f00693          	li	a3,15
    80003f68:	0087d79b          	srliw	a5,a5,0x8
    80003f6c:	f8c400a3          	sb	a2,-127(s0)
    80003f70:	d8b6e4e3          	bltu	a3,a1,80003cf8 <__printf+0x350>
    80003f74:	00200793          	li	a5,2
    80003f78:	e2dff06f          	j	80003da4 <__printf+0x3fc>
    80003f7c:	00001c97          	auipc	s9,0x1
    80003f80:	774c8c93          	addi	s9,s9,1908 # 800056f0 <_ZZ12printIntegermE6digits+0x148>
    80003f84:	02800513          	li	a0,40
    80003f88:	ef1ff06f          	j	80003e78 <__printf+0x4d0>
    80003f8c:	00700793          	li	a5,7
    80003f90:	00600c93          	li	s9,6
    80003f94:	e0dff06f          	j	80003da0 <__printf+0x3f8>
    80003f98:	00700793          	li	a5,7
    80003f9c:	00600c93          	li	s9,6
    80003fa0:	c69ff06f          	j	80003c08 <__printf+0x260>
    80003fa4:	00300793          	li	a5,3
    80003fa8:	00200c93          	li	s9,2
    80003fac:	c5dff06f          	j	80003c08 <__printf+0x260>
    80003fb0:	00300793          	li	a5,3
    80003fb4:	00200c93          	li	s9,2
    80003fb8:	de9ff06f          	j	80003da0 <__printf+0x3f8>
    80003fbc:	00400793          	li	a5,4
    80003fc0:	00300c93          	li	s9,3
    80003fc4:	dddff06f          	j	80003da0 <__printf+0x3f8>
    80003fc8:	00400793          	li	a5,4
    80003fcc:	00300c93          	li	s9,3
    80003fd0:	c39ff06f          	j	80003c08 <__printf+0x260>
    80003fd4:	00500793          	li	a5,5
    80003fd8:	00400c93          	li	s9,4
    80003fdc:	c2dff06f          	j	80003c08 <__printf+0x260>
    80003fe0:	00500793          	li	a5,5
    80003fe4:	00400c93          	li	s9,4
    80003fe8:	db9ff06f          	j	80003da0 <__printf+0x3f8>
    80003fec:	00600793          	li	a5,6
    80003ff0:	00500c93          	li	s9,5
    80003ff4:	dadff06f          	j	80003da0 <__printf+0x3f8>
    80003ff8:	00600793          	li	a5,6
    80003ffc:	00500c93          	li	s9,5
    80004000:	c09ff06f          	j	80003c08 <__printf+0x260>
    80004004:	00800793          	li	a5,8
    80004008:	00700c93          	li	s9,7
    8000400c:	bfdff06f          	j	80003c08 <__printf+0x260>
    80004010:	00100793          	li	a5,1
    80004014:	d91ff06f          	j	80003da4 <__printf+0x3fc>
    80004018:	00100793          	li	a5,1
    8000401c:	bf1ff06f          	j	80003c0c <__printf+0x264>
    80004020:	00900793          	li	a5,9
    80004024:	00800c93          	li	s9,8
    80004028:	be1ff06f          	j	80003c08 <__printf+0x260>
    8000402c:	00001517          	auipc	a0,0x1
    80004030:	6cc50513          	addi	a0,a0,1740 # 800056f8 <_ZZ12printIntegermE6digits+0x150>
    80004034:	00000097          	auipc	ra,0x0
    80004038:	918080e7          	jalr	-1768(ra) # 8000394c <panic>

000000008000403c <printfinit>:
    8000403c:	fe010113          	addi	sp,sp,-32
    80004040:	00813823          	sd	s0,16(sp)
    80004044:	00913423          	sd	s1,8(sp)
    80004048:	00113c23          	sd	ra,24(sp)
    8000404c:	02010413          	addi	s0,sp,32
    80004050:	00003497          	auipc	s1,0x3
    80004054:	43048493          	addi	s1,s1,1072 # 80007480 <pr>
    80004058:	00048513          	mv	a0,s1
    8000405c:	00001597          	auipc	a1,0x1
    80004060:	6ac58593          	addi	a1,a1,1708 # 80005708 <_ZZ12printIntegermE6digits+0x160>
    80004064:	00000097          	auipc	ra,0x0
    80004068:	5f4080e7          	jalr	1524(ra) # 80004658 <initlock>
    8000406c:	01813083          	ld	ra,24(sp)
    80004070:	01013403          	ld	s0,16(sp)
    80004074:	0004ac23          	sw	zero,24(s1)
    80004078:	00813483          	ld	s1,8(sp)
    8000407c:	02010113          	addi	sp,sp,32
    80004080:	00008067          	ret

0000000080004084 <uartinit>:
    80004084:	ff010113          	addi	sp,sp,-16
    80004088:	00813423          	sd	s0,8(sp)
    8000408c:	01010413          	addi	s0,sp,16
    80004090:	100007b7          	lui	a5,0x10000
    80004094:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004098:	f8000713          	li	a4,-128
    8000409c:	00e781a3          	sb	a4,3(a5)
    800040a0:	00300713          	li	a4,3
    800040a4:	00e78023          	sb	a4,0(a5)
    800040a8:	000780a3          	sb	zero,1(a5)
    800040ac:	00e781a3          	sb	a4,3(a5)
    800040b0:	00700693          	li	a3,7
    800040b4:	00d78123          	sb	a3,2(a5)
    800040b8:	00e780a3          	sb	a4,1(a5)
    800040bc:	00813403          	ld	s0,8(sp)
    800040c0:	01010113          	addi	sp,sp,16
    800040c4:	00008067          	ret

00000000800040c8 <uartputc>:
    800040c8:	00002797          	auipc	a5,0x2
    800040cc:	1607a783          	lw	a5,352(a5) # 80006228 <panicked>
    800040d0:	00078463          	beqz	a5,800040d8 <uartputc+0x10>
    800040d4:	0000006f          	j	800040d4 <uartputc+0xc>
    800040d8:	fd010113          	addi	sp,sp,-48
    800040dc:	02813023          	sd	s0,32(sp)
    800040e0:	00913c23          	sd	s1,24(sp)
    800040e4:	01213823          	sd	s2,16(sp)
    800040e8:	01313423          	sd	s3,8(sp)
    800040ec:	02113423          	sd	ra,40(sp)
    800040f0:	03010413          	addi	s0,sp,48
    800040f4:	00002917          	auipc	s2,0x2
    800040f8:	13c90913          	addi	s2,s2,316 # 80006230 <uart_tx_r>
    800040fc:	00093783          	ld	a5,0(s2)
    80004100:	00002497          	auipc	s1,0x2
    80004104:	13848493          	addi	s1,s1,312 # 80006238 <uart_tx_w>
    80004108:	0004b703          	ld	a4,0(s1)
    8000410c:	02078693          	addi	a3,a5,32
    80004110:	00050993          	mv	s3,a0
    80004114:	02e69c63          	bne	a3,a4,8000414c <uartputc+0x84>
    80004118:	00001097          	auipc	ra,0x1
    8000411c:	834080e7          	jalr	-1996(ra) # 8000494c <push_on>
    80004120:	00093783          	ld	a5,0(s2)
    80004124:	0004b703          	ld	a4,0(s1)
    80004128:	02078793          	addi	a5,a5,32
    8000412c:	00e79463          	bne	a5,a4,80004134 <uartputc+0x6c>
    80004130:	0000006f          	j	80004130 <uartputc+0x68>
    80004134:	00001097          	auipc	ra,0x1
    80004138:	88c080e7          	jalr	-1908(ra) # 800049c0 <pop_on>
    8000413c:	00093783          	ld	a5,0(s2)
    80004140:	0004b703          	ld	a4,0(s1)
    80004144:	02078693          	addi	a3,a5,32
    80004148:	fce688e3          	beq	a3,a4,80004118 <uartputc+0x50>
    8000414c:	01f77693          	andi	a3,a4,31
    80004150:	00003597          	auipc	a1,0x3
    80004154:	35058593          	addi	a1,a1,848 # 800074a0 <uart_tx_buf>
    80004158:	00d586b3          	add	a3,a1,a3
    8000415c:	00170713          	addi	a4,a4,1
    80004160:	01368023          	sb	s3,0(a3)
    80004164:	00e4b023          	sd	a4,0(s1)
    80004168:	10000637          	lui	a2,0x10000
    8000416c:	02f71063          	bne	a4,a5,8000418c <uartputc+0xc4>
    80004170:	0340006f          	j	800041a4 <uartputc+0xdc>
    80004174:	00074703          	lbu	a4,0(a4)
    80004178:	00f93023          	sd	a5,0(s2)
    8000417c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004180:	00093783          	ld	a5,0(s2)
    80004184:	0004b703          	ld	a4,0(s1)
    80004188:	00f70e63          	beq	a4,a5,800041a4 <uartputc+0xdc>
    8000418c:	00564683          	lbu	a3,5(a2)
    80004190:	01f7f713          	andi	a4,a5,31
    80004194:	00e58733          	add	a4,a1,a4
    80004198:	0206f693          	andi	a3,a3,32
    8000419c:	00178793          	addi	a5,a5,1
    800041a0:	fc069ae3          	bnez	a3,80004174 <uartputc+0xac>
    800041a4:	02813083          	ld	ra,40(sp)
    800041a8:	02013403          	ld	s0,32(sp)
    800041ac:	01813483          	ld	s1,24(sp)
    800041b0:	01013903          	ld	s2,16(sp)
    800041b4:	00813983          	ld	s3,8(sp)
    800041b8:	03010113          	addi	sp,sp,48
    800041bc:	00008067          	ret

00000000800041c0 <uartputc_sync>:
    800041c0:	ff010113          	addi	sp,sp,-16
    800041c4:	00813423          	sd	s0,8(sp)
    800041c8:	01010413          	addi	s0,sp,16
    800041cc:	00002717          	auipc	a4,0x2
    800041d0:	05c72703          	lw	a4,92(a4) # 80006228 <panicked>
    800041d4:	02071663          	bnez	a4,80004200 <uartputc_sync+0x40>
    800041d8:	00050793          	mv	a5,a0
    800041dc:	100006b7          	lui	a3,0x10000
    800041e0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800041e4:	02077713          	andi	a4,a4,32
    800041e8:	fe070ce3          	beqz	a4,800041e0 <uartputc_sync+0x20>
    800041ec:	0ff7f793          	andi	a5,a5,255
    800041f0:	00f68023          	sb	a5,0(a3)
    800041f4:	00813403          	ld	s0,8(sp)
    800041f8:	01010113          	addi	sp,sp,16
    800041fc:	00008067          	ret
    80004200:	0000006f          	j	80004200 <uartputc_sync+0x40>

0000000080004204 <uartstart>:
    80004204:	ff010113          	addi	sp,sp,-16
    80004208:	00813423          	sd	s0,8(sp)
    8000420c:	01010413          	addi	s0,sp,16
    80004210:	00002617          	auipc	a2,0x2
    80004214:	02060613          	addi	a2,a2,32 # 80006230 <uart_tx_r>
    80004218:	00002517          	auipc	a0,0x2
    8000421c:	02050513          	addi	a0,a0,32 # 80006238 <uart_tx_w>
    80004220:	00063783          	ld	a5,0(a2)
    80004224:	00053703          	ld	a4,0(a0)
    80004228:	04f70263          	beq	a4,a5,8000426c <uartstart+0x68>
    8000422c:	100005b7          	lui	a1,0x10000
    80004230:	00003817          	auipc	a6,0x3
    80004234:	27080813          	addi	a6,a6,624 # 800074a0 <uart_tx_buf>
    80004238:	01c0006f          	j	80004254 <uartstart+0x50>
    8000423c:	0006c703          	lbu	a4,0(a3)
    80004240:	00f63023          	sd	a5,0(a2)
    80004244:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004248:	00063783          	ld	a5,0(a2)
    8000424c:	00053703          	ld	a4,0(a0)
    80004250:	00f70e63          	beq	a4,a5,8000426c <uartstart+0x68>
    80004254:	01f7f713          	andi	a4,a5,31
    80004258:	00e806b3          	add	a3,a6,a4
    8000425c:	0055c703          	lbu	a4,5(a1)
    80004260:	00178793          	addi	a5,a5,1
    80004264:	02077713          	andi	a4,a4,32
    80004268:	fc071ae3          	bnez	a4,8000423c <uartstart+0x38>
    8000426c:	00813403          	ld	s0,8(sp)
    80004270:	01010113          	addi	sp,sp,16
    80004274:	00008067          	ret

0000000080004278 <uartgetc>:
    80004278:	ff010113          	addi	sp,sp,-16
    8000427c:	00813423          	sd	s0,8(sp)
    80004280:	01010413          	addi	s0,sp,16
    80004284:	10000737          	lui	a4,0x10000
    80004288:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000428c:	0017f793          	andi	a5,a5,1
    80004290:	00078c63          	beqz	a5,800042a8 <uartgetc+0x30>
    80004294:	00074503          	lbu	a0,0(a4)
    80004298:	0ff57513          	andi	a0,a0,255
    8000429c:	00813403          	ld	s0,8(sp)
    800042a0:	01010113          	addi	sp,sp,16
    800042a4:	00008067          	ret
    800042a8:	fff00513          	li	a0,-1
    800042ac:	ff1ff06f          	j	8000429c <uartgetc+0x24>

00000000800042b0 <uartintr>:
    800042b0:	100007b7          	lui	a5,0x10000
    800042b4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800042b8:	0017f793          	andi	a5,a5,1
    800042bc:	0a078463          	beqz	a5,80004364 <uartintr+0xb4>
    800042c0:	fe010113          	addi	sp,sp,-32
    800042c4:	00813823          	sd	s0,16(sp)
    800042c8:	00913423          	sd	s1,8(sp)
    800042cc:	00113c23          	sd	ra,24(sp)
    800042d0:	02010413          	addi	s0,sp,32
    800042d4:	100004b7          	lui	s1,0x10000
    800042d8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800042dc:	0ff57513          	andi	a0,a0,255
    800042e0:	fffff097          	auipc	ra,0xfffff
    800042e4:	534080e7          	jalr	1332(ra) # 80003814 <consoleintr>
    800042e8:	0054c783          	lbu	a5,5(s1)
    800042ec:	0017f793          	andi	a5,a5,1
    800042f0:	fe0794e3          	bnez	a5,800042d8 <uartintr+0x28>
    800042f4:	00002617          	auipc	a2,0x2
    800042f8:	f3c60613          	addi	a2,a2,-196 # 80006230 <uart_tx_r>
    800042fc:	00002517          	auipc	a0,0x2
    80004300:	f3c50513          	addi	a0,a0,-196 # 80006238 <uart_tx_w>
    80004304:	00063783          	ld	a5,0(a2)
    80004308:	00053703          	ld	a4,0(a0)
    8000430c:	04f70263          	beq	a4,a5,80004350 <uartintr+0xa0>
    80004310:	100005b7          	lui	a1,0x10000
    80004314:	00003817          	auipc	a6,0x3
    80004318:	18c80813          	addi	a6,a6,396 # 800074a0 <uart_tx_buf>
    8000431c:	01c0006f          	j	80004338 <uartintr+0x88>
    80004320:	0006c703          	lbu	a4,0(a3)
    80004324:	00f63023          	sd	a5,0(a2)
    80004328:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000432c:	00063783          	ld	a5,0(a2)
    80004330:	00053703          	ld	a4,0(a0)
    80004334:	00f70e63          	beq	a4,a5,80004350 <uartintr+0xa0>
    80004338:	01f7f713          	andi	a4,a5,31
    8000433c:	00e806b3          	add	a3,a6,a4
    80004340:	0055c703          	lbu	a4,5(a1)
    80004344:	00178793          	addi	a5,a5,1
    80004348:	02077713          	andi	a4,a4,32
    8000434c:	fc071ae3          	bnez	a4,80004320 <uartintr+0x70>
    80004350:	01813083          	ld	ra,24(sp)
    80004354:	01013403          	ld	s0,16(sp)
    80004358:	00813483          	ld	s1,8(sp)
    8000435c:	02010113          	addi	sp,sp,32
    80004360:	00008067          	ret
    80004364:	00002617          	auipc	a2,0x2
    80004368:	ecc60613          	addi	a2,a2,-308 # 80006230 <uart_tx_r>
    8000436c:	00002517          	auipc	a0,0x2
    80004370:	ecc50513          	addi	a0,a0,-308 # 80006238 <uart_tx_w>
    80004374:	00063783          	ld	a5,0(a2)
    80004378:	00053703          	ld	a4,0(a0)
    8000437c:	04f70263          	beq	a4,a5,800043c0 <uartintr+0x110>
    80004380:	100005b7          	lui	a1,0x10000
    80004384:	00003817          	auipc	a6,0x3
    80004388:	11c80813          	addi	a6,a6,284 # 800074a0 <uart_tx_buf>
    8000438c:	01c0006f          	j	800043a8 <uartintr+0xf8>
    80004390:	0006c703          	lbu	a4,0(a3)
    80004394:	00f63023          	sd	a5,0(a2)
    80004398:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000439c:	00063783          	ld	a5,0(a2)
    800043a0:	00053703          	ld	a4,0(a0)
    800043a4:	02f70063          	beq	a4,a5,800043c4 <uartintr+0x114>
    800043a8:	01f7f713          	andi	a4,a5,31
    800043ac:	00e806b3          	add	a3,a6,a4
    800043b0:	0055c703          	lbu	a4,5(a1)
    800043b4:	00178793          	addi	a5,a5,1
    800043b8:	02077713          	andi	a4,a4,32
    800043bc:	fc071ae3          	bnez	a4,80004390 <uartintr+0xe0>
    800043c0:	00008067          	ret
    800043c4:	00008067          	ret

00000000800043c8 <kinit>:
    800043c8:	fc010113          	addi	sp,sp,-64
    800043cc:	02913423          	sd	s1,40(sp)
    800043d0:	fffff7b7          	lui	a5,0xfffff
    800043d4:	00004497          	auipc	s1,0x4
    800043d8:	0eb48493          	addi	s1,s1,235 # 800084bf <end+0xfff>
    800043dc:	02813823          	sd	s0,48(sp)
    800043e0:	01313c23          	sd	s3,24(sp)
    800043e4:	00f4f4b3          	and	s1,s1,a5
    800043e8:	02113c23          	sd	ra,56(sp)
    800043ec:	03213023          	sd	s2,32(sp)
    800043f0:	01413823          	sd	s4,16(sp)
    800043f4:	01513423          	sd	s5,8(sp)
    800043f8:	04010413          	addi	s0,sp,64
    800043fc:	000017b7          	lui	a5,0x1
    80004400:	01100993          	li	s3,17
    80004404:	00f487b3          	add	a5,s1,a5
    80004408:	01b99993          	slli	s3,s3,0x1b
    8000440c:	06f9e063          	bltu	s3,a5,8000446c <kinit+0xa4>
    80004410:	00003a97          	auipc	s5,0x3
    80004414:	0b0a8a93          	addi	s5,s5,176 # 800074c0 <end>
    80004418:	0754ec63          	bltu	s1,s5,80004490 <kinit+0xc8>
    8000441c:	0734fa63          	bgeu	s1,s3,80004490 <kinit+0xc8>
    80004420:	00088a37          	lui	s4,0x88
    80004424:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004428:	00002917          	auipc	s2,0x2
    8000442c:	e1890913          	addi	s2,s2,-488 # 80006240 <kmem>
    80004430:	00ca1a13          	slli	s4,s4,0xc
    80004434:	0140006f          	j	80004448 <kinit+0x80>
    80004438:	000017b7          	lui	a5,0x1
    8000443c:	00f484b3          	add	s1,s1,a5
    80004440:	0554e863          	bltu	s1,s5,80004490 <kinit+0xc8>
    80004444:	0534f663          	bgeu	s1,s3,80004490 <kinit+0xc8>
    80004448:	00001637          	lui	a2,0x1
    8000444c:	00100593          	li	a1,1
    80004450:	00048513          	mv	a0,s1
    80004454:	00000097          	auipc	ra,0x0
    80004458:	5e4080e7          	jalr	1508(ra) # 80004a38 <__memset>
    8000445c:	00093783          	ld	a5,0(s2)
    80004460:	00f4b023          	sd	a5,0(s1)
    80004464:	00993023          	sd	s1,0(s2)
    80004468:	fd4498e3          	bne	s1,s4,80004438 <kinit+0x70>
    8000446c:	03813083          	ld	ra,56(sp)
    80004470:	03013403          	ld	s0,48(sp)
    80004474:	02813483          	ld	s1,40(sp)
    80004478:	02013903          	ld	s2,32(sp)
    8000447c:	01813983          	ld	s3,24(sp)
    80004480:	01013a03          	ld	s4,16(sp)
    80004484:	00813a83          	ld	s5,8(sp)
    80004488:	04010113          	addi	sp,sp,64
    8000448c:	00008067          	ret
    80004490:	00001517          	auipc	a0,0x1
    80004494:	29850513          	addi	a0,a0,664 # 80005728 <digits+0x18>
    80004498:	fffff097          	auipc	ra,0xfffff
    8000449c:	4b4080e7          	jalr	1204(ra) # 8000394c <panic>

00000000800044a0 <freerange>:
    800044a0:	fc010113          	addi	sp,sp,-64
    800044a4:	000017b7          	lui	a5,0x1
    800044a8:	02913423          	sd	s1,40(sp)
    800044ac:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800044b0:	009504b3          	add	s1,a0,s1
    800044b4:	fffff537          	lui	a0,0xfffff
    800044b8:	02813823          	sd	s0,48(sp)
    800044bc:	02113c23          	sd	ra,56(sp)
    800044c0:	03213023          	sd	s2,32(sp)
    800044c4:	01313c23          	sd	s3,24(sp)
    800044c8:	01413823          	sd	s4,16(sp)
    800044cc:	01513423          	sd	s5,8(sp)
    800044d0:	01613023          	sd	s6,0(sp)
    800044d4:	04010413          	addi	s0,sp,64
    800044d8:	00a4f4b3          	and	s1,s1,a0
    800044dc:	00f487b3          	add	a5,s1,a5
    800044e0:	06f5e463          	bltu	a1,a5,80004548 <freerange+0xa8>
    800044e4:	00003a97          	auipc	s5,0x3
    800044e8:	fdca8a93          	addi	s5,s5,-36 # 800074c0 <end>
    800044ec:	0954e263          	bltu	s1,s5,80004570 <freerange+0xd0>
    800044f0:	01100993          	li	s3,17
    800044f4:	01b99993          	slli	s3,s3,0x1b
    800044f8:	0734fc63          	bgeu	s1,s3,80004570 <freerange+0xd0>
    800044fc:	00058a13          	mv	s4,a1
    80004500:	00002917          	auipc	s2,0x2
    80004504:	d4090913          	addi	s2,s2,-704 # 80006240 <kmem>
    80004508:	00002b37          	lui	s6,0x2
    8000450c:	0140006f          	j	80004520 <freerange+0x80>
    80004510:	000017b7          	lui	a5,0x1
    80004514:	00f484b3          	add	s1,s1,a5
    80004518:	0554ec63          	bltu	s1,s5,80004570 <freerange+0xd0>
    8000451c:	0534fa63          	bgeu	s1,s3,80004570 <freerange+0xd0>
    80004520:	00001637          	lui	a2,0x1
    80004524:	00100593          	li	a1,1
    80004528:	00048513          	mv	a0,s1
    8000452c:	00000097          	auipc	ra,0x0
    80004530:	50c080e7          	jalr	1292(ra) # 80004a38 <__memset>
    80004534:	00093703          	ld	a4,0(s2)
    80004538:	016487b3          	add	a5,s1,s6
    8000453c:	00e4b023          	sd	a4,0(s1)
    80004540:	00993023          	sd	s1,0(s2)
    80004544:	fcfa76e3          	bgeu	s4,a5,80004510 <freerange+0x70>
    80004548:	03813083          	ld	ra,56(sp)
    8000454c:	03013403          	ld	s0,48(sp)
    80004550:	02813483          	ld	s1,40(sp)
    80004554:	02013903          	ld	s2,32(sp)
    80004558:	01813983          	ld	s3,24(sp)
    8000455c:	01013a03          	ld	s4,16(sp)
    80004560:	00813a83          	ld	s5,8(sp)
    80004564:	00013b03          	ld	s6,0(sp)
    80004568:	04010113          	addi	sp,sp,64
    8000456c:	00008067          	ret
    80004570:	00001517          	auipc	a0,0x1
    80004574:	1b850513          	addi	a0,a0,440 # 80005728 <digits+0x18>
    80004578:	fffff097          	auipc	ra,0xfffff
    8000457c:	3d4080e7          	jalr	980(ra) # 8000394c <panic>

0000000080004580 <kfree>:
    80004580:	fe010113          	addi	sp,sp,-32
    80004584:	00813823          	sd	s0,16(sp)
    80004588:	00113c23          	sd	ra,24(sp)
    8000458c:	00913423          	sd	s1,8(sp)
    80004590:	02010413          	addi	s0,sp,32
    80004594:	03451793          	slli	a5,a0,0x34
    80004598:	04079c63          	bnez	a5,800045f0 <kfree+0x70>
    8000459c:	00003797          	auipc	a5,0x3
    800045a0:	f2478793          	addi	a5,a5,-220 # 800074c0 <end>
    800045a4:	00050493          	mv	s1,a0
    800045a8:	04f56463          	bltu	a0,a5,800045f0 <kfree+0x70>
    800045ac:	01100793          	li	a5,17
    800045b0:	01b79793          	slli	a5,a5,0x1b
    800045b4:	02f57e63          	bgeu	a0,a5,800045f0 <kfree+0x70>
    800045b8:	00001637          	lui	a2,0x1
    800045bc:	00100593          	li	a1,1
    800045c0:	00000097          	auipc	ra,0x0
    800045c4:	478080e7          	jalr	1144(ra) # 80004a38 <__memset>
    800045c8:	00002797          	auipc	a5,0x2
    800045cc:	c7878793          	addi	a5,a5,-904 # 80006240 <kmem>
    800045d0:	0007b703          	ld	a4,0(a5)
    800045d4:	01813083          	ld	ra,24(sp)
    800045d8:	01013403          	ld	s0,16(sp)
    800045dc:	00e4b023          	sd	a4,0(s1)
    800045e0:	0097b023          	sd	s1,0(a5)
    800045e4:	00813483          	ld	s1,8(sp)
    800045e8:	02010113          	addi	sp,sp,32
    800045ec:	00008067          	ret
    800045f0:	00001517          	auipc	a0,0x1
    800045f4:	13850513          	addi	a0,a0,312 # 80005728 <digits+0x18>
    800045f8:	fffff097          	auipc	ra,0xfffff
    800045fc:	354080e7          	jalr	852(ra) # 8000394c <panic>

0000000080004600 <kalloc>:
    80004600:	fe010113          	addi	sp,sp,-32
    80004604:	00813823          	sd	s0,16(sp)
    80004608:	00913423          	sd	s1,8(sp)
    8000460c:	00113c23          	sd	ra,24(sp)
    80004610:	02010413          	addi	s0,sp,32
    80004614:	00002797          	auipc	a5,0x2
    80004618:	c2c78793          	addi	a5,a5,-980 # 80006240 <kmem>
    8000461c:	0007b483          	ld	s1,0(a5)
    80004620:	02048063          	beqz	s1,80004640 <kalloc+0x40>
    80004624:	0004b703          	ld	a4,0(s1)
    80004628:	00001637          	lui	a2,0x1
    8000462c:	00500593          	li	a1,5
    80004630:	00048513          	mv	a0,s1
    80004634:	00e7b023          	sd	a4,0(a5)
    80004638:	00000097          	auipc	ra,0x0
    8000463c:	400080e7          	jalr	1024(ra) # 80004a38 <__memset>
    80004640:	01813083          	ld	ra,24(sp)
    80004644:	01013403          	ld	s0,16(sp)
    80004648:	00048513          	mv	a0,s1
    8000464c:	00813483          	ld	s1,8(sp)
    80004650:	02010113          	addi	sp,sp,32
    80004654:	00008067          	ret

0000000080004658 <initlock>:
    80004658:	ff010113          	addi	sp,sp,-16
    8000465c:	00813423          	sd	s0,8(sp)
    80004660:	01010413          	addi	s0,sp,16
    80004664:	00813403          	ld	s0,8(sp)
    80004668:	00b53423          	sd	a1,8(a0)
    8000466c:	00052023          	sw	zero,0(a0)
    80004670:	00053823          	sd	zero,16(a0)
    80004674:	01010113          	addi	sp,sp,16
    80004678:	00008067          	ret

000000008000467c <acquire>:
    8000467c:	fe010113          	addi	sp,sp,-32
    80004680:	00813823          	sd	s0,16(sp)
    80004684:	00913423          	sd	s1,8(sp)
    80004688:	00113c23          	sd	ra,24(sp)
    8000468c:	01213023          	sd	s2,0(sp)
    80004690:	02010413          	addi	s0,sp,32
    80004694:	00050493          	mv	s1,a0
    80004698:	10002973          	csrr	s2,sstatus
    8000469c:	100027f3          	csrr	a5,sstatus
    800046a0:	ffd7f793          	andi	a5,a5,-3
    800046a4:	10079073          	csrw	sstatus,a5
    800046a8:	fffff097          	auipc	ra,0xfffff
    800046ac:	8e8080e7          	jalr	-1816(ra) # 80002f90 <mycpu>
    800046b0:	07852783          	lw	a5,120(a0)
    800046b4:	06078e63          	beqz	a5,80004730 <acquire+0xb4>
    800046b8:	fffff097          	auipc	ra,0xfffff
    800046bc:	8d8080e7          	jalr	-1832(ra) # 80002f90 <mycpu>
    800046c0:	07852783          	lw	a5,120(a0)
    800046c4:	0004a703          	lw	a4,0(s1)
    800046c8:	0017879b          	addiw	a5,a5,1
    800046cc:	06f52c23          	sw	a5,120(a0)
    800046d0:	04071063          	bnez	a4,80004710 <acquire+0x94>
    800046d4:	00100713          	li	a4,1
    800046d8:	00070793          	mv	a5,a4
    800046dc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800046e0:	0007879b          	sext.w	a5,a5
    800046e4:	fe079ae3          	bnez	a5,800046d8 <acquire+0x5c>
    800046e8:	0ff0000f          	fence
    800046ec:	fffff097          	auipc	ra,0xfffff
    800046f0:	8a4080e7          	jalr	-1884(ra) # 80002f90 <mycpu>
    800046f4:	01813083          	ld	ra,24(sp)
    800046f8:	01013403          	ld	s0,16(sp)
    800046fc:	00a4b823          	sd	a0,16(s1)
    80004700:	00013903          	ld	s2,0(sp)
    80004704:	00813483          	ld	s1,8(sp)
    80004708:	02010113          	addi	sp,sp,32
    8000470c:	00008067          	ret
    80004710:	0104b903          	ld	s2,16(s1)
    80004714:	fffff097          	auipc	ra,0xfffff
    80004718:	87c080e7          	jalr	-1924(ra) # 80002f90 <mycpu>
    8000471c:	faa91ce3          	bne	s2,a0,800046d4 <acquire+0x58>
    80004720:	00001517          	auipc	a0,0x1
    80004724:	01050513          	addi	a0,a0,16 # 80005730 <digits+0x20>
    80004728:	fffff097          	auipc	ra,0xfffff
    8000472c:	224080e7          	jalr	548(ra) # 8000394c <panic>
    80004730:	00195913          	srli	s2,s2,0x1
    80004734:	fffff097          	auipc	ra,0xfffff
    80004738:	85c080e7          	jalr	-1956(ra) # 80002f90 <mycpu>
    8000473c:	00197913          	andi	s2,s2,1
    80004740:	07252e23          	sw	s2,124(a0)
    80004744:	f75ff06f          	j	800046b8 <acquire+0x3c>

0000000080004748 <release>:
    80004748:	fe010113          	addi	sp,sp,-32
    8000474c:	00813823          	sd	s0,16(sp)
    80004750:	00113c23          	sd	ra,24(sp)
    80004754:	00913423          	sd	s1,8(sp)
    80004758:	01213023          	sd	s2,0(sp)
    8000475c:	02010413          	addi	s0,sp,32
    80004760:	00052783          	lw	a5,0(a0)
    80004764:	00079a63          	bnez	a5,80004778 <release+0x30>
    80004768:	00001517          	auipc	a0,0x1
    8000476c:	fd050513          	addi	a0,a0,-48 # 80005738 <digits+0x28>
    80004770:	fffff097          	auipc	ra,0xfffff
    80004774:	1dc080e7          	jalr	476(ra) # 8000394c <panic>
    80004778:	01053903          	ld	s2,16(a0)
    8000477c:	00050493          	mv	s1,a0
    80004780:	fffff097          	auipc	ra,0xfffff
    80004784:	810080e7          	jalr	-2032(ra) # 80002f90 <mycpu>
    80004788:	fea910e3          	bne	s2,a0,80004768 <release+0x20>
    8000478c:	0004b823          	sd	zero,16(s1)
    80004790:	0ff0000f          	fence
    80004794:	0f50000f          	fence	iorw,ow
    80004798:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000479c:	ffffe097          	auipc	ra,0xffffe
    800047a0:	7f4080e7          	jalr	2036(ra) # 80002f90 <mycpu>
    800047a4:	100027f3          	csrr	a5,sstatus
    800047a8:	0027f793          	andi	a5,a5,2
    800047ac:	04079a63          	bnez	a5,80004800 <release+0xb8>
    800047b0:	07852783          	lw	a5,120(a0)
    800047b4:	02f05e63          	blez	a5,800047f0 <release+0xa8>
    800047b8:	fff7871b          	addiw	a4,a5,-1
    800047bc:	06e52c23          	sw	a4,120(a0)
    800047c0:	00071c63          	bnez	a4,800047d8 <release+0x90>
    800047c4:	07c52783          	lw	a5,124(a0)
    800047c8:	00078863          	beqz	a5,800047d8 <release+0x90>
    800047cc:	100027f3          	csrr	a5,sstatus
    800047d0:	0027e793          	ori	a5,a5,2
    800047d4:	10079073          	csrw	sstatus,a5
    800047d8:	01813083          	ld	ra,24(sp)
    800047dc:	01013403          	ld	s0,16(sp)
    800047e0:	00813483          	ld	s1,8(sp)
    800047e4:	00013903          	ld	s2,0(sp)
    800047e8:	02010113          	addi	sp,sp,32
    800047ec:	00008067          	ret
    800047f0:	00001517          	auipc	a0,0x1
    800047f4:	f6850513          	addi	a0,a0,-152 # 80005758 <digits+0x48>
    800047f8:	fffff097          	auipc	ra,0xfffff
    800047fc:	154080e7          	jalr	340(ra) # 8000394c <panic>
    80004800:	00001517          	auipc	a0,0x1
    80004804:	f4050513          	addi	a0,a0,-192 # 80005740 <digits+0x30>
    80004808:	fffff097          	auipc	ra,0xfffff
    8000480c:	144080e7          	jalr	324(ra) # 8000394c <panic>

0000000080004810 <holding>:
    80004810:	00052783          	lw	a5,0(a0)
    80004814:	00079663          	bnez	a5,80004820 <holding+0x10>
    80004818:	00000513          	li	a0,0
    8000481c:	00008067          	ret
    80004820:	fe010113          	addi	sp,sp,-32
    80004824:	00813823          	sd	s0,16(sp)
    80004828:	00913423          	sd	s1,8(sp)
    8000482c:	00113c23          	sd	ra,24(sp)
    80004830:	02010413          	addi	s0,sp,32
    80004834:	01053483          	ld	s1,16(a0)
    80004838:	ffffe097          	auipc	ra,0xffffe
    8000483c:	758080e7          	jalr	1880(ra) # 80002f90 <mycpu>
    80004840:	01813083          	ld	ra,24(sp)
    80004844:	01013403          	ld	s0,16(sp)
    80004848:	40a48533          	sub	a0,s1,a0
    8000484c:	00153513          	seqz	a0,a0
    80004850:	00813483          	ld	s1,8(sp)
    80004854:	02010113          	addi	sp,sp,32
    80004858:	00008067          	ret

000000008000485c <push_off>:
    8000485c:	fe010113          	addi	sp,sp,-32
    80004860:	00813823          	sd	s0,16(sp)
    80004864:	00113c23          	sd	ra,24(sp)
    80004868:	00913423          	sd	s1,8(sp)
    8000486c:	02010413          	addi	s0,sp,32
    80004870:	100024f3          	csrr	s1,sstatus
    80004874:	100027f3          	csrr	a5,sstatus
    80004878:	ffd7f793          	andi	a5,a5,-3
    8000487c:	10079073          	csrw	sstatus,a5
    80004880:	ffffe097          	auipc	ra,0xffffe
    80004884:	710080e7          	jalr	1808(ra) # 80002f90 <mycpu>
    80004888:	07852783          	lw	a5,120(a0)
    8000488c:	02078663          	beqz	a5,800048b8 <push_off+0x5c>
    80004890:	ffffe097          	auipc	ra,0xffffe
    80004894:	700080e7          	jalr	1792(ra) # 80002f90 <mycpu>
    80004898:	07852783          	lw	a5,120(a0)
    8000489c:	01813083          	ld	ra,24(sp)
    800048a0:	01013403          	ld	s0,16(sp)
    800048a4:	0017879b          	addiw	a5,a5,1
    800048a8:	06f52c23          	sw	a5,120(a0)
    800048ac:	00813483          	ld	s1,8(sp)
    800048b0:	02010113          	addi	sp,sp,32
    800048b4:	00008067          	ret
    800048b8:	0014d493          	srli	s1,s1,0x1
    800048bc:	ffffe097          	auipc	ra,0xffffe
    800048c0:	6d4080e7          	jalr	1748(ra) # 80002f90 <mycpu>
    800048c4:	0014f493          	andi	s1,s1,1
    800048c8:	06952e23          	sw	s1,124(a0)
    800048cc:	fc5ff06f          	j	80004890 <push_off+0x34>

00000000800048d0 <pop_off>:
    800048d0:	ff010113          	addi	sp,sp,-16
    800048d4:	00813023          	sd	s0,0(sp)
    800048d8:	00113423          	sd	ra,8(sp)
    800048dc:	01010413          	addi	s0,sp,16
    800048e0:	ffffe097          	auipc	ra,0xffffe
    800048e4:	6b0080e7          	jalr	1712(ra) # 80002f90 <mycpu>
    800048e8:	100027f3          	csrr	a5,sstatus
    800048ec:	0027f793          	andi	a5,a5,2
    800048f0:	04079663          	bnez	a5,8000493c <pop_off+0x6c>
    800048f4:	07852783          	lw	a5,120(a0)
    800048f8:	02f05a63          	blez	a5,8000492c <pop_off+0x5c>
    800048fc:	fff7871b          	addiw	a4,a5,-1
    80004900:	06e52c23          	sw	a4,120(a0)
    80004904:	00071c63          	bnez	a4,8000491c <pop_off+0x4c>
    80004908:	07c52783          	lw	a5,124(a0)
    8000490c:	00078863          	beqz	a5,8000491c <pop_off+0x4c>
    80004910:	100027f3          	csrr	a5,sstatus
    80004914:	0027e793          	ori	a5,a5,2
    80004918:	10079073          	csrw	sstatus,a5
    8000491c:	00813083          	ld	ra,8(sp)
    80004920:	00013403          	ld	s0,0(sp)
    80004924:	01010113          	addi	sp,sp,16
    80004928:	00008067          	ret
    8000492c:	00001517          	auipc	a0,0x1
    80004930:	e2c50513          	addi	a0,a0,-468 # 80005758 <digits+0x48>
    80004934:	fffff097          	auipc	ra,0xfffff
    80004938:	018080e7          	jalr	24(ra) # 8000394c <panic>
    8000493c:	00001517          	auipc	a0,0x1
    80004940:	e0450513          	addi	a0,a0,-508 # 80005740 <digits+0x30>
    80004944:	fffff097          	auipc	ra,0xfffff
    80004948:	008080e7          	jalr	8(ra) # 8000394c <panic>

000000008000494c <push_on>:
    8000494c:	fe010113          	addi	sp,sp,-32
    80004950:	00813823          	sd	s0,16(sp)
    80004954:	00113c23          	sd	ra,24(sp)
    80004958:	00913423          	sd	s1,8(sp)
    8000495c:	02010413          	addi	s0,sp,32
    80004960:	100024f3          	csrr	s1,sstatus
    80004964:	100027f3          	csrr	a5,sstatus
    80004968:	0027e793          	ori	a5,a5,2
    8000496c:	10079073          	csrw	sstatus,a5
    80004970:	ffffe097          	auipc	ra,0xffffe
    80004974:	620080e7          	jalr	1568(ra) # 80002f90 <mycpu>
    80004978:	07852783          	lw	a5,120(a0)
    8000497c:	02078663          	beqz	a5,800049a8 <push_on+0x5c>
    80004980:	ffffe097          	auipc	ra,0xffffe
    80004984:	610080e7          	jalr	1552(ra) # 80002f90 <mycpu>
    80004988:	07852783          	lw	a5,120(a0)
    8000498c:	01813083          	ld	ra,24(sp)
    80004990:	01013403          	ld	s0,16(sp)
    80004994:	0017879b          	addiw	a5,a5,1
    80004998:	06f52c23          	sw	a5,120(a0)
    8000499c:	00813483          	ld	s1,8(sp)
    800049a0:	02010113          	addi	sp,sp,32
    800049a4:	00008067          	ret
    800049a8:	0014d493          	srli	s1,s1,0x1
    800049ac:	ffffe097          	auipc	ra,0xffffe
    800049b0:	5e4080e7          	jalr	1508(ra) # 80002f90 <mycpu>
    800049b4:	0014f493          	andi	s1,s1,1
    800049b8:	06952e23          	sw	s1,124(a0)
    800049bc:	fc5ff06f          	j	80004980 <push_on+0x34>

00000000800049c0 <pop_on>:
    800049c0:	ff010113          	addi	sp,sp,-16
    800049c4:	00813023          	sd	s0,0(sp)
    800049c8:	00113423          	sd	ra,8(sp)
    800049cc:	01010413          	addi	s0,sp,16
    800049d0:	ffffe097          	auipc	ra,0xffffe
    800049d4:	5c0080e7          	jalr	1472(ra) # 80002f90 <mycpu>
    800049d8:	100027f3          	csrr	a5,sstatus
    800049dc:	0027f793          	andi	a5,a5,2
    800049e0:	04078463          	beqz	a5,80004a28 <pop_on+0x68>
    800049e4:	07852783          	lw	a5,120(a0)
    800049e8:	02f05863          	blez	a5,80004a18 <pop_on+0x58>
    800049ec:	fff7879b          	addiw	a5,a5,-1
    800049f0:	06f52c23          	sw	a5,120(a0)
    800049f4:	07853783          	ld	a5,120(a0)
    800049f8:	00079863          	bnez	a5,80004a08 <pop_on+0x48>
    800049fc:	100027f3          	csrr	a5,sstatus
    80004a00:	ffd7f793          	andi	a5,a5,-3
    80004a04:	10079073          	csrw	sstatus,a5
    80004a08:	00813083          	ld	ra,8(sp)
    80004a0c:	00013403          	ld	s0,0(sp)
    80004a10:	01010113          	addi	sp,sp,16
    80004a14:	00008067          	ret
    80004a18:	00001517          	auipc	a0,0x1
    80004a1c:	d6850513          	addi	a0,a0,-664 # 80005780 <digits+0x70>
    80004a20:	fffff097          	auipc	ra,0xfffff
    80004a24:	f2c080e7          	jalr	-212(ra) # 8000394c <panic>
    80004a28:	00001517          	auipc	a0,0x1
    80004a2c:	d3850513          	addi	a0,a0,-712 # 80005760 <digits+0x50>
    80004a30:	fffff097          	auipc	ra,0xfffff
    80004a34:	f1c080e7          	jalr	-228(ra) # 8000394c <panic>

0000000080004a38 <__memset>:
    80004a38:	ff010113          	addi	sp,sp,-16
    80004a3c:	00813423          	sd	s0,8(sp)
    80004a40:	01010413          	addi	s0,sp,16
    80004a44:	1a060e63          	beqz	a2,80004c00 <__memset+0x1c8>
    80004a48:	40a007b3          	neg	a5,a0
    80004a4c:	0077f793          	andi	a5,a5,7
    80004a50:	00778693          	addi	a3,a5,7
    80004a54:	00b00813          	li	a6,11
    80004a58:	0ff5f593          	andi	a1,a1,255
    80004a5c:	fff6071b          	addiw	a4,a2,-1
    80004a60:	1b06e663          	bltu	a3,a6,80004c0c <__memset+0x1d4>
    80004a64:	1cd76463          	bltu	a4,a3,80004c2c <__memset+0x1f4>
    80004a68:	1a078e63          	beqz	a5,80004c24 <__memset+0x1ec>
    80004a6c:	00b50023          	sb	a1,0(a0)
    80004a70:	00100713          	li	a4,1
    80004a74:	1ae78463          	beq	a5,a4,80004c1c <__memset+0x1e4>
    80004a78:	00b500a3          	sb	a1,1(a0)
    80004a7c:	00200713          	li	a4,2
    80004a80:	1ae78a63          	beq	a5,a4,80004c34 <__memset+0x1fc>
    80004a84:	00b50123          	sb	a1,2(a0)
    80004a88:	00300713          	li	a4,3
    80004a8c:	18e78463          	beq	a5,a4,80004c14 <__memset+0x1dc>
    80004a90:	00b501a3          	sb	a1,3(a0)
    80004a94:	00400713          	li	a4,4
    80004a98:	1ae78263          	beq	a5,a4,80004c3c <__memset+0x204>
    80004a9c:	00b50223          	sb	a1,4(a0)
    80004aa0:	00500713          	li	a4,5
    80004aa4:	1ae78063          	beq	a5,a4,80004c44 <__memset+0x20c>
    80004aa8:	00b502a3          	sb	a1,5(a0)
    80004aac:	00700713          	li	a4,7
    80004ab0:	18e79e63          	bne	a5,a4,80004c4c <__memset+0x214>
    80004ab4:	00b50323          	sb	a1,6(a0)
    80004ab8:	00700e93          	li	t4,7
    80004abc:	00859713          	slli	a4,a1,0x8
    80004ac0:	00e5e733          	or	a4,a1,a4
    80004ac4:	01059e13          	slli	t3,a1,0x10
    80004ac8:	01c76e33          	or	t3,a4,t3
    80004acc:	01859313          	slli	t1,a1,0x18
    80004ad0:	006e6333          	or	t1,t3,t1
    80004ad4:	02059893          	slli	a7,a1,0x20
    80004ad8:	40f60e3b          	subw	t3,a2,a5
    80004adc:	011368b3          	or	a7,t1,a7
    80004ae0:	02859813          	slli	a6,a1,0x28
    80004ae4:	0108e833          	or	a6,a7,a6
    80004ae8:	03059693          	slli	a3,a1,0x30
    80004aec:	003e589b          	srliw	a7,t3,0x3
    80004af0:	00d866b3          	or	a3,a6,a3
    80004af4:	03859713          	slli	a4,a1,0x38
    80004af8:	00389813          	slli	a6,a7,0x3
    80004afc:	00f507b3          	add	a5,a0,a5
    80004b00:	00e6e733          	or	a4,a3,a4
    80004b04:	000e089b          	sext.w	a7,t3
    80004b08:	00f806b3          	add	a3,a6,a5
    80004b0c:	00e7b023          	sd	a4,0(a5)
    80004b10:	00878793          	addi	a5,a5,8
    80004b14:	fed79ce3          	bne	a5,a3,80004b0c <__memset+0xd4>
    80004b18:	ff8e7793          	andi	a5,t3,-8
    80004b1c:	0007871b          	sext.w	a4,a5
    80004b20:	01d787bb          	addw	a5,a5,t4
    80004b24:	0ce88e63          	beq	a7,a4,80004c00 <__memset+0x1c8>
    80004b28:	00f50733          	add	a4,a0,a5
    80004b2c:	00b70023          	sb	a1,0(a4)
    80004b30:	0017871b          	addiw	a4,a5,1
    80004b34:	0cc77663          	bgeu	a4,a2,80004c00 <__memset+0x1c8>
    80004b38:	00e50733          	add	a4,a0,a4
    80004b3c:	00b70023          	sb	a1,0(a4)
    80004b40:	0027871b          	addiw	a4,a5,2
    80004b44:	0ac77e63          	bgeu	a4,a2,80004c00 <__memset+0x1c8>
    80004b48:	00e50733          	add	a4,a0,a4
    80004b4c:	00b70023          	sb	a1,0(a4)
    80004b50:	0037871b          	addiw	a4,a5,3
    80004b54:	0ac77663          	bgeu	a4,a2,80004c00 <__memset+0x1c8>
    80004b58:	00e50733          	add	a4,a0,a4
    80004b5c:	00b70023          	sb	a1,0(a4)
    80004b60:	0047871b          	addiw	a4,a5,4
    80004b64:	08c77e63          	bgeu	a4,a2,80004c00 <__memset+0x1c8>
    80004b68:	00e50733          	add	a4,a0,a4
    80004b6c:	00b70023          	sb	a1,0(a4)
    80004b70:	0057871b          	addiw	a4,a5,5
    80004b74:	08c77663          	bgeu	a4,a2,80004c00 <__memset+0x1c8>
    80004b78:	00e50733          	add	a4,a0,a4
    80004b7c:	00b70023          	sb	a1,0(a4)
    80004b80:	0067871b          	addiw	a4,a5,6
    80004b84:	06c77e63          	bgeu	a4,a2,80004c00 <__memset+0x1c8>
    80004b88:	00e50733          	add	a4,a0,a4
    80004b8c:	00b70023          	sb	a1,0(a4)
    80004b90:	0077871b          	addiw	a4,a5,7
    80004b94:	06c77663          	bgeu	a4,a2,80004c00 <__memset+0x1c8>
    80004b98:	00e50733          	add	a4,a0,a4
    80004b9c:	00b70023          	sb	a1,0(a4)
    80004ba0:	0087871b          	addiw	a4,a5,8
    80004ba4:	04c77e63          	bgeu	a4,a2,80004c00 <__memset+0x1c8>
    80004ba8:	00e50733          	add	a4,a0,a4
    80004bac:	00b70023          	sb	a1,0(a4)
    80004bb0:	0097871b          	addiw	a4,a5,9
    80004bb4:	04c77663          	bgeu	a4,a2,80004c00 <__memset+0x1c8>
    80004bb8:	00e50733          	add	a4,a0,a4
    80004bbc:	00b70023          	sb	a1,0(a4)
    80004bc0:	00a7871b          	addiw	a4,a5,10
    80004bc4:	02c77e63          	bgeu	a4,a2,80004c00 <__memset+0x1c8>
    80004bc8:	00e50733          	add	a4,a0,a4
    80004bcc:	00b70023          	sb	a1,0(a4)
    80004bd0:	00b7871b          	addiw	a4,a5,11
    80004bd4:	02c77663          	bgeu	a4,a2,80004c00 <__memset+0x1c8>
    80004bd8:	00e50733          	add	a4,a0,a4
    80004bdc:	00b70023          	sb	a1,0(a4)
    80004be0:	00c7871b          	addiw	a4,a5,12
    80004be4:	00c77e63          	bgeu	a4,a2,80004c00 <__memset+0x1c8>
    80004be8:	00e50733          	add	a4,a0,a4
    80004bec:	00b70023          	sb	a1,0(a4)
    80004bf0:	00d7879b          	addiw	a5,a5,13
    80004bf4:	00c7f663          	bgeu	a5,a2,80004c00 <__memset+0x1c8>
    80004bf8:	00f507b3          	add	a5,a0,a5
    80004bfc:	00b78023          	sb	a1,0(a5)
    80004c00:	00813403          	ld	s0,8(sp)
    80004c04:	01010113          	addi	sp,sp,16
    80004c08:	00008067          	ret
    80004c0c:	00b00693          	li	a3,11
    80004c10:	e55ff06f          	j	80004a64 <__memset+0x2c>
    80004c14:	00300e93          	li	t4,3
    80004c18:	ea5ff06f          	j	80004abc <__memset+0x84>
    80004c1c:	00100e93          	li	t4,1
    80004c20:	e9dff06f          	j	80004abc <__memset+0x84>
    80004c24:	00000e93          	li	t4,0
    80004c28:	e95ff06f          	j	80004abc <__memset+0x84>
    80004c2c:	00000793          	li	a5,0
    80004c30:	ef9ff06f          	j	80004b28 <__memset+0xf0>
    80004c34:	00200e93          	li	t4,2
    80004c38:	e85ff06f          	j	80004abc <__memset+0x84>
    80004c3c:	00400e93          	li	t4,4
    80004c40:	e7dff06f          	j	80004abc <__memset+0x84>
    80004c44:	00500e93          	li	t4,5
    80004c48:	e75ff06f          	j	80004abc <__memset+0x84>
    80004c4c:	00600e93          	li	t4,6
    80004c50:	e6dff06f          	j	80004abc <__memset+0x84>

0000000080004c54 <__memmove>:
    80004c54:	ff010113          	addi	sp,sp,-16
    80004c58:	00813423          	sd	s0,8(sp)
    80004c5c:	01010413          	addi	s0,sp,16
    80004c60:	0e060863          	beqz	a2,80004d50 <__memmove+0xfc>
    80004c64:	fff6069b          	addiw	a3,a2,-1
    80004c68:	0006881b          	sext.w	a6,a3
    80004c6c:	0ea5e863          	bltu	a1,a0,80004d5c <__memmove+0x108>
    80004c70:	00758713          	addi	a4,a1,7
    80004c74:	00a5e7b3          	or	a5,a1,a0
    80004c78:	40a70733          	sub	a4,a4,a0
    80004c7c:	0077f793          	andi	a5,a5,7
    80004c80:	00f73713          	sltiu	a4,a4,15
    80004c84:	00174713          	xori	a4,a4,1
    80004c88:	0017b793          	seqz	a5,a5
    80004c8c:	00e7f7b3          	and	a5,a5,a4
    80004c90:	10078863          	beqz	a5,80004da0 <__memmove+0x14c>
    80004c94:	00900793          	li	a5,9
    80004c98:	1107f463          	bgeu	a5,a6,80004da0 <__memmove+0x14c>
    80004c9c:	0036581b          	srliw	a6,a2,0x3
    80004ca0:	fff8081b          	addiw	a6,a6,-1
    80004ca4:	02081813          	slli	a6,a6,0x20
    80004ca8:	01d85893          	srli	a7,a6,0x1d
    80004cac:	00858813          	addi	a6,a1,8
    80004cb0:	00058793          	mv	a5,a1
    80004cb4:	00050713          	mv	a4,a0
    80004cb8:	01088833          	add	a6,a7,a6
    80004cbc:	0007b883          	ld	a7,0(a5)
    80004cc0:	00878793          	addi	a5,a5,8
    80004cc4:	00870713          	addi	a4,a4,8
    80004cc8:	ff173c23          	sd	a7,-8(a4)
    80004ccc:	ff0798e3          	bne	a5,a6,80004cbc <__memmove+0x68>
    80004cd0:	ff867713          	andi	a4,a2,-8
    80004cd4:	02071793          	slli	a5,a4,0x20
    80004cd8:	0207d793          	srli	a5,a5,0x20
    80004cdc:	00f585b3          	add	a1,a1,a5
    80004ce0:	40e686bb          	subw	a3,a3,a4
    80004ce4:	00f507b3          	add	a5,a0,a5
    80004ce8:	06e60463          	beq	a2,a4,80004d50 <__memmove+0xfc>
    80004cec:	0005c703          	lbu	a4,0(a1)
    80004cf0:	00e78023          	sb	a4,0(a5)
    80004cf4:	04068e63          	beqz	a3,80004d50 <__memmove+0xfc>
    80004cf8:	0015c603          	lbu	a2,1(a1)
    80004cfc:	00100713          	li	a4,1
    80004d00:	00c780a3          	sb	a2,1(a5)
    80004d04:	04e68663          	beq	a3,a4,80004d50 <__memmove+0xfc>
    80004d08:	0025c603          	lbu	a2,2(a1)
    80004d0c:	00200713          	li	a4,2
    80004d10:	00c78123          	sb	a2,2(a5)
    80004d14:	02e68e63          	beq	a3,a4,80004d50 <__memmove+0xfc>
    80004d18:	0035c603          	lbu	a2,3(a1)
    80004d1c:	00300713          	li	a4,3
    80004d20:	00c781a3          	sb	a2,3(a5)
    80004d24:	02e68663          	beq	a3,a4,80004d50 <__memmove+0xfc>
    80004d28:	0045c603          	lbu	a2,4(a1)
    80004d2c:	00400713          	li	a4,4
    80004d30:	00c78223          	sb	a2,4(a5)
    80004d34:	00e68e63          	beq	a3,a4,80004d50 <__memmove+0xfc>
    80004d38:	0055c603          	lbu	a2,5(a1)
    80004d3c:	00500713          	li	a4,5
    80004d40:	00c782a3          	sb	a2,5(a5)
    80004d44:	00e68663          	beq	a3,a4,80004d50 <__memmove+0xfc>
    80004d48:	0065c703          	lbu	a4,6(a1)
    80004d4c:	00e78323          	sb	a4,6(a5)
    80004d50:	00813403          	ld	s0,8(sp)
    80004d54:	01010113          	addi	sp,sp,16
    80004d58:	00008067          	ret
    80004d5c:	02061713          	slli	a4,a2,0x20
    80004d60:	02075713          	srli	a4,a4,0x20
    80004d64:	00e587b3          	add	a5,a1,a4
    80004d68:	f0f574e3          	bgeu	a0,a5,80004c70 <__memmove+0x1c>
    80004d6c:	02069613          	slli	a2,a3,0x20
    80004d70:	02065613          	srli	a2,a2,0x20
    80004d74:	fff64613          	not	a2,a2
    80004d78:	00e50733          	add	a4,a0,a4
    80004d7c:	00c78633          	add	a2,a5,a2
    80004d80:	fff7c683          	lbu	a3,-1(a5)
    80004d84:	fff78793          	addi	a5,a5,-1
    80004d88:	fff70713          	addi	a4,a4,-1
    80004d8c:	00d70023          	sb	a3,0(a4)
    80004d90:	fec798e3          	bne	a5,a2,80004d80 <__memmove+0x12c>
    80004d94:	00813403          	ld	s0,8(sp)
    80004d98:	01010113          	addi	sp,sp,16
    80004d9c:	00008067          	ret
    80004da0:	02069713          	slli	a4,a3,0x20
    80004da4:	02075713          	srli	a4,a4,0x20
    80004da8:	00170713          	addi	a4,a4,1
    80004dac:	00e50733          	add	a4,a0,a4
    80004db0:	00050793          	mv	a5,a0
    80004db4:	0005c683          	lbu	a3,0(a1)
    80004db8:	00178793          	addi	a5,a5,1
    80004dbc:	00158593          	addi	a1,a1,1
    80004dc0:	fed78fa3          	sb	a3,-1(a5)
    80004dc4:	fee798e3          	bne	a5,a4,80004db4 <__memmove+0x160>
    80004dc8:	f89ff06f          	j	80004d50 <__memmove+0xfc>

0000000080004dcc <__putc>:
    80004dcc:	fe010113          	addi	sp,sp,-32
    80004dd0:	00813823          	sd	s0,16(sp)
    80004dd4:	00113c23          	sd	ra,24(sp)
    80004dd8:	02010413          	addi	s0,sp,32
    80004ddc:	00050793          	mv	a5,a0
    80004de0:	fef40593          	addi	a1,s0,-17
    80004de4:	00100613          	li	a2,1
    80004de8:	00000513          	li	a0,0
    80004dec:	fef407a3          	sb	a5,-17(s0)
    80004df0:	fffff097          	auipc	ra,0xfffff
    80004df4:	b3c080e7          	jalr	-1220(ra) # 8000392c <console_write>
    80004df8:	01813083          	ld	ra,24(sp)
    80004dfc:	01013403          	ld	s0,16(sp)
    80004e00:	02010113          	addi	sp,sp,32
    80004e04:	00008067          	ret

0000000080004e08 <__getc>:
    80004e08:	fe010113          	addi	sp,sp,-32
    80004e0c:	00813823          	sd	s0,16(sp)
    80004e10:	00113c23          	sd	ra,24(sp)
    80004e14:	02010413          	addi	s0,sp,32
    80004e18:	fe840593          	addi	a1,s0,-24
    80004e1c:	00100613          	li	a2,1
    80004e20:	00000513          	li	a0,0
    80004e24:	fffff097          	auipc	ra,0xfffff
    80004e28:	ae8080e7          	jalr	-1304(ra) # 8000390c <console_read>
    80004e2c:	fe844503          	lbu	a0,-24(s0)
    80004e30:	01813083          	ld	ra,24(sp)
    80004e34:	01013403          	ld	s0,16(sp)
    80004e38:	02010113          	addi	sp,sp,32
    80004e3c:	00008067          	ret

0000000080004e40 <console_handler>:
    80004e40:	fe010113          	addi	sp,sp,-32
    80004e44:	00813823          	sd	s0,16(sp)
    80004e48:	00113c23          	sd	ra,24(sp)
    80004e4c:	00913423          	sd	s1,8(sp)
    80004e50:	02010413          	addi	s0,sp,32
    80004e54:	14202773          	csrr	a4,scause
    80004e58:	100027f3          	csrr	a5,sstatus
    80004e5c:	0027f793          	andi	a5,a5,2
    80004e60:	06079e63          	bnez	a5,80004edc <console_handler+0x9c>
    80004e64:	00074c63          	bltz	a4,80004e7c <console_handler+0x3c>
    80004e68:	01813083          	ld	ra,24(sp)
    80004e6c:	01013403          	ld	s0,16(sp)
    80004e70:	00813483          	ld	s1,8(sp)
    80004e74:	02010113          	addi	sp,sp,32
    80004e78:	00008067          	ret
    80004e7c:	0ff77713          	andi	a4,a4,255
    80004e80:	00900793          	li	a5,9
    80004e84:	fef712e3          	bne	a4,a5,80004e68 <console_handler+0x28>
    80004e88:	ffffe097          	auipc	ra,0xffffe
    80004e8c:	6dc080e7          	jalr	1756(ra) # 80003564 <plic_claim>
    80004e90:	00a00793          	li	a5,10
    80004e94:	00050493          	mv	s1,a0
    80004e98:	02f50c63          	beq	a0,a5,80004ed0 <console_handler+0x90>
    80004e9c:	fc0506e3          	beqz	a0,80004e68 <console_handler+0x28>
    80004ea0:	00050593          	mv	a1,a0
    80004ea4:	00000517          	auipc	a0,0x0
    80004ea8:	7e450513          	addi	a0,a0,2020 # 80005688 <_ZZ12printIntegermE6digits+0xe0>
    80004eac:	fffff097          	auipc	ra,0xfffff
    80004eb0:	afc080e7          	jalr	-1284(ra) # 800039a8 <__printf>
    80004eb4:	01013403          	ld	s0,16(sp)
    80004eb8:	01813083          	ld	ra,24(sp)
    80004ebc:	00048513          	mv	a0,s1
    80004ec0:	00813483          	ld	s1,8(sp)
    80004ec4:	02010113          	addi	sp,sp,32
    80004ec8:	ffffe317          	auipc	t1,0xffffe
    80004ecc:	6d430067          	jr	1748(t1) # 8000359c <plic_complete>
    80004ed0:	fffff097          	auipc	ra,0xfffff
    80004ed4:	3e0080e7          	jalr	992(ra) # 800042b0 <uartintr>
    80004ed8:	fddff06f          	j	80004eb4 <console_handler+0x74>
    80004edc:	00001517          	auipc	a0,0x1
    80004ee0:	8ac50513          	addi	a0,a0,-1876 # 80005788 <digits+0x78>
    80004ee4:	fffff097          	auipc	ra,0xfffff
    80004ee8:	a68080e7          	jalr	-1432(ra) # 8000394c <panic>
	...
