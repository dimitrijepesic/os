
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	87813103          	ld	sp,-1928(sp) # 80005878 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	73d010ef          	jal	ra,80001f58 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5Riscv14supervisorTrapEv>:
.align 4
.global _ZN5Riscv14supervisorTrapEv
.type _ZN5Riscv14supervisorTrapEv, @function
_ZN5Riscv14supervisorTrapEv:
    # push all registers to stack
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001004:	00013023          	sd	zero,0(sp)
    80001008:	00113423          	sd	ra,8(sp)
    8000100c:	00213823          	sd	sp,16(sp)
    80001010:	00313c23          	sd	gp,24(sp)
    80001014:	02413023          	sd	tp,32(sp)
    80001018:	02513423          	sd	t0,40(sp)
    8000101c:	02613823          	sd	t1,48(sp)
    80001020:	02713c23          	sd	t2,56(sp)
    80001024:	04813023          	sd	s0,64(sp)
    80001028:	04913423          	sd	s1,72(sp)
    8000102c:	04a13823          	sd	a0,80(sp)
    80001030:	04b13c23          	sd	a1,88(sp)
    80001034:	06c13023          	sd	a2,96(sp)
    80001038:	06d13423          	sd	a3,104(sp)
    8000103c:	06e13823          	sd	a4,112(sp)
    80001040:	06f13c23          	sd	a5,120(sp)
    80001044:	09013023          	sd	a6,128(sp)
    80001048:	09113423          	sd	a7,136(sp)
    8000104c:	09213823          	sd	s2,144(sp)
    80001050:	09313c23          	sd	s3,152(sp)
    80001054:	0b413023          	sd	s4,160(sp)
    80001058:	0b513423          	sd	s5,168(sp)
    8000105c:	0b613823          	sd	s6,176(sp)
    80001060:	0b713c23          	sd	s7,184(sp)
    80001064:	0d813023          	sd	s8,192(sp)
    80001068:	0d913423          	sd	s9,200(sp)
    8000106c:	0da13823          	sd	s10,208(sp)
    80001070:	0db13c23          	sd	s11,216(sp)
    80001074:	0fc13023          	sd	t3,224(sp)
    80001078:	0fd13423          	sd	t4,232(sp)
    8000107c:	0fe13823          	sd	t5,240(sp)
    80001080:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv20handleSupervisorTrapEv
    80001084:	0e5000ef          	jal	ra,80001968 <_ZN5Riscv20handleSupervisorTrapEv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    80001088:	00013003          	ld	zero,0(sp)
    8000108c:	00813083          	ld	ra,8(sp)
    80001090:	01013103          	ld	sp,16(sp)
    80001094:	01813183          	ld	gp,24(sp)
    80001098:	02013203          	ld	tp,32(sp)
    8000109c:	02813283          	ld	t0,40(sp)
    800010a0:	03013303          	ld	t1,48(sp)
    800010a4:	03813383          	ld	t2,56(sp)
    800010a8:	04013403          	ld	s0,64(sp)
    800010ac:	04813483          	ld	s1,72(sp)
    800010b0:	05013503          	ld	a0,80(sp)
    800010b4:	05813583          	ld	a1,88(sp)
    800010b8:	06013603          	ld	a2,96(sp)
    800010bc:	06813683          	ld	a3,104(sp)
    800010c0:	07013703          	ld	a4,112(sp)
    800010c4:	07813783          	ld	a5,120(sp)
    800010c8:	08013803          	ld	a6,128(sp)
    800010cc:	08813883          	ld	a7,136(sp)
    800010d0:	09013903          	ld	s2,144(sp)
    800010d4:	09813983          	ld	s3,152(sp)
    800010d8:	0a013a03          	ld	s4,160(sp)
    800010dc:	0a813a83          	ld	s5,168(sp)
    800010e0:	0b013b03          	ld	s6,176(sp)
    800010e4:	0b813b83          	ld	s7,184(sp)
    800010e8:	0c013c03          	ld	s8,192(sp)
    800010ec:	0c813c83          	ld	s9,200(sp)
    800010f0:	0d013d03          	ld	s10,208(sp)
    800010f4:	0d813d83          	ld	s11,216(sp)
    800010f8:	0e013e03          	ld	t3,224(sp)
    800010fc:	0e813e83          	ld	t4,232(sp)
    80001100:	0f013f03          	ld	t5,240(sp)
    80001104:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001108:	10010113          	addi	sp,sp,256

    sret
    8000110c:	10200073          	sret

0000000080001110 <_ZN3CCB13contextSwitchEPNS_7ContextES1_>:
// Obavezno koristi "mangled" C++ ime
.global _ZN3CCB13contextSwitchEPNS_7ContextES1_

_ZN3CCB13contextSwitchEPNS_7ContextES1_:
    # 1. ČUVANJE KONTEKSTA STARE NITI (PUSH)
    addi sp, sp, -256
    80001110:	f0010113          	addi	sp,sp,-256
    sd x1, 0*8(sp)   # ra
    80001114:	00113023          	sd	ra,0(sp)
    sd x2, 1*8(sp)   # sp
    80001118:	00213423          	sd	sp,8(sp)
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
        sd x\index, \index * 8(sp)
    .endr
    8000111c:	00313c23          	sd	gp,24(sp)
    80001120:	02413023          	sd	tp,32(sp)
    80001124:	02513423          	sd	t0,40(sp)
    80001128:	02613823          	sd	t1,48(sp)
    8000112c:	02713c23          	sd	t2,56(sp)
    80001130:	04813023          	sd	s0,64(sp)
    80001134:	04913423          	sd	s1,72(sp)
    80001138:	04a13823          	sd	a0,80(sp)
    8000113c:	04b13c23          	sd	a1,88(sp)
    80001140:	06c13023          	sd	a2,96(sp)
    80001144:	06d13423          	sd	a3,104(sp)
    80001148:	06e13823          	sd	a4,112(sp)
    8000114c:	06f13c23          	sd	a5,120(sp)
    80001150:	09013023          	sd	a6,128(sp)
    80001154:	09113423          	sd	a7,136(sp)
    80001158:	09213823          	sd	s2,144(sp)
    8000115c:	09313c23          	sd	s3,152(sp)
    80001160:	0b413023          	sd	s4,160(sp)
    80001164:	0b513423          	sd	s5,168(sp)
    80001168:	0b613823          	sd	s6,176(sp)
    8000116c:	0b713c23          	sd	s7,184(sp)
    80001170:	0d813023          	sd	s8,192(sp)
    80001174:	0d913423          	sd	s9,200(sp)
    80001178:	0da13823          	sd	s10,208(sp)
    8000117c:	0db13c23          	sd	s11,216(sp)
    80001180:	0fc13023          	sd	t3,224(sp)
    80001184:	0fd13423          	sd	t4,232(sp)
    80001188:	0fe13823          	sd	t5,240(sp)
    8000118c:	0ff13c23          	sd	t6,248(sp)

    # 2. ZAMENA POKAZIVAČA STEKA
    sd sp, 8(a0)  # oldContext->sp = sp
    80001190:	00253423          	sd	sp,8(a0) # 1008 <_entry-0x7fffeff8>
    ld sp, 8(a1)  # sp = runningContext->sp
    80001194:	0085b103          	ld	sp,8(a1)

    # 3. RESTAURACIJA KONTEKSTA NOVE NITI (POP)
    ld x1, 0*8(sp)
    80001198:	00013083          	ld	ra,0(sp)
    ld x2, 1*8(sp)
    8000119c:	00813103          	ld	sp,8(sp)
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
        ld x\index, \index * 8(sp)
    .endr
    800011a0:	01813183          	ld	gp,24(sp)
    800011a4:	02013203          	ld	tp,32(sp)
    800011a8:	02813283          	ld	t0,40(sp)
    800011ac:	03013303          	ld	t1,48(sp)
    800011b0:	03813383          	ld	t2,56(sp)
    800011b4:	04013403          	ld	s0,64(sp)
    800011b8:	04813483          	ld	s1,72(sp)
    800011bc:	05013503          	ld	a0,80(sp)
    800011c0:	05813583          	ld	a1,88(sp)
    800011c4:	06013603          	ld	a2,96(sp)
    800011c8:	06813683          	ld	a3,104(sp)
    800011cc:	07013703          	ld	a4,112(sp)
    800011d0:	07813783          	ld	a5,120(sp)
    800011d4:	08013803          	ld	a6,128(sp)
    800011d8:	08813883          	ld	a7,136(sp)
    800011dc:	09013903          	ld	s2,144(sp)
    800011e0:	09813983          	ld	s3,152(sp)
    800011e4:	0a013a03          	ld	s4,160(sp)
    800011e8:	0a813a83          	ld	s5,168(sp)
    800011ec:	0b013b03          	ld	s6,176(sp)
    800011f0:	0b813b83          	ld	s7,184(sp)
    800011f4:	0c013c03          	ld	s8,192(sp)
    800011f8:	0c813c83          	ld	s9,200(sp)
    800011fc:	0d013d03          	ld	s10,208(sp)
    80001200:	0d813d83          	ld	s11,216(sp)
    80001204:	0e013e03          	ld	t3,224(sp)
    80001208:	0e813e83          	ld	t4,232(sp)
    8000120c:	0f013f03          	ld	t5,240(sp)
    80001210:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001214:	10010113          	addi	sp,sp,256

    # Povratak na NOVU nit
    80001218:	00008067          	ret

000000008000121c <_ZL9fibonaccim>:
#include "../h/workers.hpp"
#include "../lib/hw.h"
#include "../h/ccb.hpp"
#include "../h/print.hpp"

static uint64 fibonacci(uint64 n){
    8000121c:	fe010113          	addi	sp,sp,-32
    80001220:	00113c23          	sd	ra,24(sp)
    80001224:	00813823          	sd	s0,16(sp)
    80001228:	00913423          	sd	s1,8(sp)
    8000122c:	01213023          	sd	s2,0(sp)
    80001230:	02010413          	addi	s0,sp,32
    80001234:	00050493          	mv	s1,a0
    if(n==0 || n==1) return n;
    80001238:	00100793          	li	a5,1
    8000123c:	02a7f663          	bgeu	a5,a0,80001268 <_ZL9fibonaccim+0x4c>
    if (n%4==0) CCB::yield();
    80001240:	00357793          	andi	a5,a0,3
    80001244:	02078e63          	beqz	a5,80001280 <_ZL9fibonaccim+0x64>
    return fibonacci(n-1)+fibonacci(n-2);
    80001248:	fff48513          	addi	a0,s1,-1
    8000124c:	00000097          	auipc	ra,0x0
    80001250:	fd0080e7          	jalr	-48(ra) # 8000121c <_ZL9fibonaccim>
    80001254:	00050913          	mv	s2,a0
    80001258:	ffe48513          	addi	a0,s1,-2
    8000125c:	00000097          	auipc	ra,0x0
    80001260:	fc0080e7          	jalr	-64(ra) # 8000121c <_ZL9fibonaccim>
    80001264:	00a90533          	add	a0,s2,a0
}
    80001268:	01813083          	ld	ra,24(sp)
    8000126c:	01013403          	ld	s0,16(sp)
    80001270:	00813483          	ld	s1,8(sp)
    80001274:	00013903          	ld	s2,0(sp)
    80001278:	02010113          	addi	sp,sp,32
    8000127c:	00008067          	ret
    if (n%4==0) CCB::yield();
    80001280:	00000097          	auipc	ra,0x0
    80001284:	6a0080e7          	jalr	1696(ra) # 80001920 <_ZN3CCB5yieldEv>
    80001288:	fc1ff06f          	j	80001248 <_ZL9fibonaccim+0x2c>

000000008000128c <_Z11workerBodyAv>:

void workerBodyA(){
    8000128c:	fe010113          	addi	sp,sp,-32
    80001290:	00113c23          	sd	ra,24(sp)
    80001294:	00813823          	sd	s0,16(sp)
    80001298:	00913423          	sd	s1,8(sp)
    8000129c:	01213023          	sd	s2,0(sp)
    800012a0:	02010413          	addi	s0,sp,32

    uint8 i = 0;
    800012a4:	00000493          	li	s1,0
    800012a8:	0380006f          	j	800012e0 <_Z11workerBodyAv+0x54>
    for (; i < 3; i++)
    {
        printString("A: i=");
    800012ac:	00004517          	auipc	a0,0x4
    800012b0:	d7450513          	addi	a0,a0,-652 # 80005020 <CONSOLE_STATUS+0x10>
    800012b4:	00001097          	auipc	ra,0x1
    800012b8:	bcc080e7          	jalr	-1076(ra) # 80001e80 <_Z11printStringPKc>
        printInteger(i);
    800012bc:	00048513          	mv	a0,s1
    800012c0:	00001097          	auipc	ra,0x1
    800012c4:	c08080e7          	jalr	-1016(ra) # 80001ec8 <_Z12printIntegerm>
        printString("\n");
    800012c8:	00004517          	auipc	a0,0x4
    800012cc:	de850513          	addi	a0,a0,-536 # 800050b0 <CONSOLE_STATUS+0xa0>
    800012d0:	00001097          	auipc	ra,0x1
    800012d4:	bb0080e7          	jalr	-1104(ra) # 80001e80 <_Z11printStringPKc>
    for (; i < 3; i++)
    800012d8:	0014849b          	addiw	s1,s1,1
    800012dc:	0ff4f493          	andi	s1,s1,255
    800012e0:	00200793          	li	a5,2
    800012e4:	fc97f4e3          	bgeu	a5,s1,800012ac <_Z11workerBodyAv+0x20>
    }

    printString("A: yield\n");
    800012e8:	00004517          	auipc	a0,0x4
    800012ec:	d4050513          	addi	a0,a0,-704 # 80005028 <CONSOLE_STATUS+0x18>
    800012f0:	00001097          	auipc	ra,0x1
    800012f4:	b90080e7          	jalr	-1136(ra) # 80001e80 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800012f8:	00700313          	li	t1,7
    CCB::yield();
    800012fc:	00000097          	auipc	ra,0x0
    80001300:	624080e7          	jalr	1572(ra) # 80001920 <_ZN3CCB5yieldEv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80001304:	00030913          	mv	s2,t1

    printString("A: t1=");
    80001308:	00004517          	auipc	a0,0x4
    8000130c:	d3050513          	addi	a0,a0,-720 # 80005038 <CONSOLE_STATUS+0x28>
    80001310:	00001097          	auipc	ra,0x1
    80001314:	b70080e7          	jalr	-1168(ra) # 80001e80 <_Z11printStringPKc>
    printInteger(t1);
    80001318:	00090513          	mv	a0,s2
    8000131c:	00001097          	auipc	ra,0x1
    80001320:	bac080e7          	jalr	-1108(ra) # 80001ec8 <_Z12printIntegerm>
    printString("\n");
    80001324:	00004517          	auipc	a0,0x4
    80001328:	d8c50513          	addi	a0,a0,-628 # 800050b0 <CONSOLE_STATUS+0xa0>
    8000132c:	00001097          	auipc	ra,0x1
    80001330:	b54080e7          	jalr	-1196(ra) # 80001e80 <_Z11printStringPKc>

    uint64 result = fibonacci(20);
    80001334:	01400513          	li	a0,20
    80001338:	00000097          	auipc	ra,0x0
    8000133c:	ee4080e7          	jalr	-284(ra) # 8000121c <_ZL9fibonaccim>
    80001340:	00050913          	mv	s2,a0
    printString("A: fibonaci=");
    80001344:	00004517          	auipc	a0,0x4
    80001348:	cfc50513          	addi	a0,a0,-772 # 80005040 <CONSOLE_STATUS+0x30>
    8000134c:	00001097          	auipc	ra,0x1
    80001350:	b34080e7          	jalr	-1228(ra) # 80001e80 <_Z11printStringPKc>
    printInteger(result);
    80001354:	00090513          	mv	a0,s2
    80001358:	00001097          	auipc	ra,0x1
    8000135c:	b70080e7          	jalr	-1168(ra) # 80001ec8 <_Z12printIntegerm>
    printString("\n");
    80001360:	00004517          	auipc	a0,0x4
    80001364:	d5050513          	addi	a0,a0,-688 # 800050b0 <CONSOLE_STATUS+0xa0>
    80001368:	00001097          	auipc	ra,0x1
    8000136c:	b18080e7          	jalr	-1256(ra) # 80001e80 <_Z11printStringPKc>
    80001370:	0380006f          	j	800013a8 <_Z11workerBodyAv+0x11c>

    for (; i < 6; i++)
    {
        printString("A: i=");
    80001374:	00004517          	auipc	a0,0x4
    80001378:	cac50513          	addi	a0,a0,-852 # 80005020 <CONSOLE_STATUS+0x10>
    8000137c:	00001097          	auipc	ra,0x1
    80001380:	b04080e7          	jalr	-1276(ra) # 80001e80 <_Z11printStringPKc>
        printInteger(i);
    80001384:	00048513          	mv	a0,s1
    80001388:	00001097          	auipc	ra,0x1
    8000138c:	b40080e7          	jalr	-1216(ra) # 80001ec8 <_Z12printIntegerm>
        printString("\n");
    80001390:	00004517          	auipc	a0,0x4
    80001394:	d2050513          	addi	a0,a0,-736 # 800050b0 <CONSOLE_STATUS+0xa0>
    80001398:	00001097          	auipc	ra,0x1
    8000139c:	ae8080e7          	jalr	-1304(ra) # 80001e80 <_Z11printStringPKc>
    for (; i < 6; i++)
    800013a0:	0014849b          	addiw	s1,s1,1
    800013a4:	0ff4f493          	andi	s1,s1,255
    800013a8:	00500793          	li	a5,5
    800013ac:	fc97f4e3          	bgeu	a5,s1,80001374 <_Z11workerBodyAv+0xe8>
    ~CCB() {delete[] stack;}

    bool isFinished() const { return finished; }

    void setFinished(bool finished) {
        CCB::finished = finished;
    800013b0:	00004797          	auipc	a5,0x4
    800013b4:	5307b783          	ld	a5,1328(a5) # 800058e0 <_ZN3CCB7runningE>
    800013b8:	00100713          	li	a4,1
    800013bc:	02e78023          	sb	a4,32(a5)
    }

    CCB::running->setFinished(true);
    CCB::yield();
    800013c0:	00000097          	auipc	ra,0x0
    800013c4:	560080e7          	jalr	1376(ra) # 80001920 <_ZN3CCB5yieldEv>

}
    800013c8:	01813083          	ld	ra,24(sp)
    800013cc:	01013403          	ld	s0,16(sp)
    800013d0:	00813483          	ld	s1,8(sp)
    800013d4:	00013903          	ld	s2,0(sp)
    800013d8:	02010113          	addi	sp,sp,32
    800013dc:	00008067          	ret

00000000800013e0 <_Z11workerBodyBv>:

void workerBodyB()
{
    800013e0:	fe010113          	addi	sp,sp,-32
    800013e4:	00113c23          	sd	ra,24(sp)
    800013e8:	00813823          	sd	s0,16(sp)
    800013ec:	00913423          	sd	s1,8(sp)
    800013f0:	01213023          	sd	s2,0(sp)
    800013f4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800013f8:	00a00493          	li	s1,10
    800013fc:	0380006f          	j	80001434 <_Z11workerBodyBv+0x54>
    for (; i < 13; i++)
    {
        printString("B: i=");
    80001400:	00004517          	auipc	a0,0x4
    80001404:	c5050513          	addi	a0,a0,-944 # 80005050 <CONSOLE_STATUS+0x40>
    80001408:	00001097          	auipc	ra,0x1
    8000140c:	a78080e7          	jalr	-1416(ra) # 80001e80 <_Z11printStringPKc>
        printInteger(i);
    80001410:	00048513          	mv	a0,s1
    80001414:	00001097          	auipc	ra,0x1
    80001418:	ab4080e7          	jalr	-1356(ra) # 80001ec8 <_Z12printIntegerm>
        printString("\n");
    8000141c:	00004517          	auipc	a0,0x4
    80001420:	c9450513          	addi	a0,a0,-876 # 800050b0 <CONSOLE_STATUS+0xa0>
    80001424:	00001097          	auipc	ra,0x1
    80001428:	a5c080e7          	jalr	-1444(ra) # 80001e80 <_Z11printStringPKc>
    for (; i < 13; i++)
    8000142c:	0014849b          	addiw	s1,s1,1
    80001430:	0ff4f493          	andi	s1,s1,255
    80001434:	00c00793          	li	a5,12
    80001438:	fc97f4e3          	bgeu	a5,s1,80001400 <_Z11workerBodyBv+0x20>
    }

    printString("B: yield\n");
    8000143c:	00004517          	auipc	a0,0x4
    80001440:	c1c50513          	addi	a0,a0,-996 # 80005058 <CONSOLE_STATUS+0x48>
    80001444:	00001097          	auipc	ra,0x1
    80001448:	a3c080e7          	jalr	-1476(ra) # 80001e80 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000144c:	00500313          	li	t1,5
    CCB::yield();
    80001450:	00000097          	auipc	ra,0x0
    80001454:	4d0080e7          	jalr	1232(ra) # 80001920 <_ZN3CCB5yieldEv>

    uint64 result = fibonacci(16);
    80001458:	01000513          	li	a0,16
    8000145c:	00000097          	auipc	ra,0x0
    80001460:	dc0080e7          	jalr	-576(ra) # 8000121c <_ZL9fibonaccim>
    80001464:	00050913          	mv	s2,a0
    printString("B: fibonaci=");
    80001468:	00004517          	auipc	a0,0x4
    8000146c:	c0050513          	addi	a0,a0,-1024 # 80005068 <CONSOLE_STATUS+0x58>
    80001470:	00001097          	auipc	ra,0x1
    80001474:	a10080e7          	jalr	-1520(ra) # 80001e80 <_Z11printStringPKc>
    printInteger(result);
    80001478:	00090513          	mv	a0,s2
    8000147c:	00001097          	auipc	ra,0x1
    80001480:	a4c080e7          	jalr	-1460(ra) # 80001ec8 <_Z12printIntegerm>
    printString("\n");
    80001484:	00004517          	auipc	a0,0x4
    80001488:	c2c50513          	addi	a0,a0,-980 # 800050b0 <CONSOLE_STATUS+0xa0>
    8000148c:	00001097          	auipc	ra,0x1
    80001490:	9f4080e7          	jalr	-1548(ra) # 80001e80 <_Z11printStringPKc>
    80001494:	0380006f          	j	800014cc <_Z11workerBodyBv+0xec>

    for (; i < 16; i++)
    {
        printString("B: i=");
    80001498:	00004517          	auipc	a0,0x4
    8000149c:	bb850513          	addi	a0,a0,-1096 # 80005050 <CONSOLE_STATUS+0x40>
    800014a0:	00001097          	auipc	ra,0x1
    800014a4:	9e0080e7          	jalr	-1568(ra) # 80001e80 <_Z11printStringPKc>
        printInteger(i);
    800014a8:	00048513          	mv	a0,s1
    800014ac:	00001097          	auipc	ra,0x1
    800014b0:	a1c080e7          	jalr	-1508(ra) # 80001ec8 <_Z12printIntegerm>
        printString("\n");
    800014b4:	00004517          	auipc	a0,0x4
    800014b8:	bfc50513          	addi	a0,a0,-1028 # 800050b0 <CONSOLE_STATUS+0xa0>
    800014bc:	00001097          	auipc	ra,0x1
    800014c0:	9c4080e7          	jalr	-1596(ra) # 80001e80 <_Z11printStringPKc>
    for (; i < 16; i++)
    800014c4:	0014849b          	addiw	s1,s1,1
    800014c8:	0ff4f493          	andi	s1,s1,255
    800014cc:	00f00793          	li	a5,15
    800014d0:	fc97f4e3          	bgeu	a5,s1,80001498 <_Z11workerBodyBv+0xb8>
    800014d4:	00004797          	auipc	a5,0x4
    800014d8:	40c7b783          	ld	a5,1036(a5) # 800058e0 <_ZN3CCB7runningE>
    800014dc:	00100713          	li	a4,1
    800014e0:	02e78023          	sb	a4,32(a5)
    }

    CCB::running->setFinished(true);
    CCB::yield();
    800014e4:	00000097          	auipc	ra,0x0
    800014e8:	43c080e7          	jalr	1084(ra) # 80001920 <_ZN3CCB5yieldEv>
    800014ec:	01813083          	ld	ra,24(sp)
    800014f0:	01013403          	ld	s0,16(sp)
    800014f4:	00813483          	ld	s1,8(sp)
    800014f8:	00013903          	ld	s2,0(sp)
    800014fc:	02010113          	addi	sp,sp,32
    80001500:	00008067          	ret

0000000080001504 <_Z41__static_initialization_and_destruction_0ii>:
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(CCB *tren) {
    readyCoroutineQueue.addLast(tren);
}
    80001504:	ff010113          	addi	sp,sp,-16
    80001508:	00813423          	sd	s0,8(sp)
    8000150c:	01010413          	addi	s0,sp,16
    80001510:	00100793          	li	a5,1
    80001514:	00f50863          	beq	a0,a5,80001524 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001518:	00813403          	ld	s0,8(sp)
    8000151c:	01010113          	addi	sp,sp,16
    80001520:	00008067          	ret
    80001524:	000107b7          	lui	a5,0x10
    80001528:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000152c:	fef596e3          	bne	a1,a5,80001518 <_Z41__static_initialization_and_destruction_0ii+0x14>
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80001530:	00004797          	auipc	a5,0x4
    80001534:	40078793          	addi	a5,a5,1024 # 80005930 <_ZN9Scheduler19readyCoroutineQueueE>
    80001538:	0007b023          	sd	zero,0(a5)
    8000153c:	0007b423          	sd	zero,8(a5)
    80001540:	fd9ff06f          	j	80001518 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001544 <_ZN9Scheduler3getEv>:
CCB *Scheduler::get() {
    80001544:	fe010113          	addi	sp,sp,-32
    80001548:	00113c23          	sd	ra,24(sp)
    8000154c:	00813823          	sd	s0,16(sp)
    80001550:	00913423          	sd	s1,8(sp)
    80001554:	02010413          	addi	s0,sp,32
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }
    80001558:	00004517          	auipc	a0,0x4
    8000155c:	3d853503          	ld	a0,984(a0) # 80005930 <_ZN9Scheduler19readyCoroutineQueueE>
    80001560:	04050263          	beqz	a0,800015a4 <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    80001564:	00853783          	ld	a5,8(a0)
    80001568:	00004717          	auipc	a4,0x4
    8000156c:	3cf73423          	sd	a5,968(a4) # 80005930 <_ZN9Scheduler19readyCoroutineQueueE>
        if (!head) { tail = 0; }
    80001570:	02078463          	beqz	a5,80001598 <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    80001574:	00053483          	ld	s1,0(a0)
        delete elem;
    80001578:	00000097          	auipc	ra,0x0
    8000157c:	228080e7          	jalr	552(ra) # 800017a0 <_ZdlPv>
}
    80001580:	00048513          	mv	a0,s1
    80001584:	01813083          	ld	ra,24(sp)
    80001588:	01013403          	ld	s0,16(sp)
    8000158c:	00813483          	ld	s1,8(sp)
    80001590:	02010113          	addi	sp,sp,32
    80001594:	00008067          	ret
        if (!head) { tail = 0; }
    80001598:	00004797          	auipc	a5,0x4
    8000159c:	3a07b023          	sd	zero,928(a5) # 80005938 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    800015a0:	fd5ff06f          	j	80001574 <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    800015a4:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    800015a8:	fd9ff06f          	j	80001580 <_ZN9Scheduler3getEv+0x3c>

00000000800015ac <_ZN9Scheduler3putEP3CCB>:
void Scheduler::put(CCB *tren) {
    800015ac:	fe010113          	addi	sp,sp,-32
    800015b0:	00113c23          	sd	ra,24(sp)
    800015b4:	00813823          	sd	s0,16(sp)
    800015b8:	00913423          	sd	s1,8(sp)
    800015bc:	02010413          	addi	s0,sp,32
    800015c0:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    800015c4:	01000513          	li	a0,16
    800015c8:	00000097          	auipc	ra,0x0
    800015cc:	188080e7          	jalr	392(ra) # 80001750 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800015d0:	00953023          	sd	s1,0(a0)
    800015d4:	00053423          	sd	zero,8(a0)
        if (tail)
    800015d8:	00004797          	auipc	a5,0x4
    800015dc:	3607b783          	ld	a5,864(a5) # 80005938 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    800015e0:	02078263          	beqz	a5,80001604 <_ZN9Scheduler3putEP3CCB+0x58>
            tail->next = elem;
    800015e4:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800015e8:	00004797          	auipc	a5,0x4
    800015ec:	34a7b823          	sd	a0,848(a5) # 80005938 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
}
    800015f0:	01813083          	ld	ra,24(sp)
    800015f4:	01013403          	ld	s0,16(sp)
    800015f8:	00813483          	ld	s1,8(sp)
    800015fc:	02010113          	addi	sp,sp,32
    80001600:	00008067          	ret
            head = tail = elem;
    80001604:	00004797          	auipc	a5,0x4
    80001608:	32c78793          	addi	a5,a5,812 # 80005930 <_ZN9Scheduler19readyCoroutineQueueE>
    8000160c:	00a7b423          	sd	a0,8(a5)
    80001610:	00a7b023          	sd	a0,0(a5)
    80001614:	fddff06f          	j	800015f0 <_ZN9Scheduler3putEP3CCB+0x44>

0000000080001618 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80001618:	ff010113          	addi	sp,sp,-16
    8000161c:	00113423          	sd	ra,8(sp)
    80001620:	00813023          	sd	s0,0(sp)
    80001624:	01010413          	addi	s0,sp,16
    80001628:	000105b7          	lui	a1,0x10
    8000162c:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001630:	00100513          	li	a0,1
    80001634:	00000097          	auipc	ra,0x0
    80001638:	ed0080e7          	jalr	-304(ra) # 80001504 <_Z41__static_initialization_and_destruction_0ii>
    8000163c:	00813083          	ld	ra,8(sp)
    80001640:	00013403          	ld	s0,0(sp)
    80001644:	01010113          	addi	sp,sp,16
    80001648:	00008067          	ret

000000008000164c <main>:

#include "../h/ccb.hpp"
#include "../h/workers.hpp"
#include "../h/print.hpp"

int main(){
    8000164c:	fc010113          	addi	sp,sp,-64
    80001650:	02113c23          	sd	ra,56(sp)
    80001654:	02813823          	sd	s0,48(sp)
    80001658:	02913423          	sd	s1,40(sp)
    8000165c:	03213023          	sd	s2,32(sp)
    80001660:	04010413          	addi	s0,sp,64

    CCB *coroutines[3];

    coroutines[0] = CCB::createCoroutine(nullptr);
    80001664:	00000513          	li	a0,0
    80001668:	00000097          	auipc	ra,0x0
    8000166c:	188080e7          	jalr	392(ra) # 800017f0 <_ZN3CCB15createCoroutineEPFvvE>
    80001670:	fca43423          	sd	a0,-56(s0)
    CCB::running = coroutines[0];
    80001674:	00004797          	auipc	a5,0x4
    80001678:	26a7b623          	sd	a0,620(a5) # 800058e0 <_ZN3CCB7runningE>

    coroutines[1] = CCB::createCoroutine(workerBodyA);
    8000167c:	00000517          	auipc	a0,0x0
    80001680:	c1050513          	addi	a0,a0,-1008 # 8000128c <_Z11workerBodyAv>
    80001684:	00000097          	auipc	ra,0x0
    80001688:	16c080e7          	jalr	364(ra) # 800017f0 <_ZN3CCB15createCoroutineEPFvvE>
    8000168c:	fca43823          	sd	a0,-48(s0)
    printString("CoroutineA created\n");
    80001690:	00004517          	auipc	a0,0x4
    80001694:	9e850513          	addi	a0,a0,-1560 # 80005078 <CONSOLE_STATUS+0x68>
    80001698:	00000097          	auipc	ra,0x0
    8000169c:	7e8080e7          	jalr	2024(ra) # 80001e80 <_Z11printStringPKc>
    coroutines[2] = CCB::createCoroutine(workerBodyB);
    800016a0:	00000517          	auipc	a0,0x0
    800016a4:	d4050513          	addi	a0,a0,-704 # 800013e0 <_Z11workerBodyBv>
    800016a8:	00000097          	auipc	ra,0x0
    800016ac:	148080e7          	jalr	328(ra) # 800017f0 <_ZN3CCB15createCoroutineEPFvvE>
    800016b0:	fca43c23          	sd	a0,-40(s0)
    printString("CoroutineB created\n");
    800016b4:	00004517          	auipc	a0,0x4
    800016b8:	9dc50513          	addi	a0,a0,-1572 # 80005090 <CONSOLE_STATUS+0x80>
    800016bc:	00000097          	auipc	ra,0x0
    800016c0:	7c4080e7          	jalr	1988(ra) # 80001e80 <_Z11printStringPKc>
    800016c4:	00c0006f          	j	800016d0 <main+0x84>

    while (!(coroutines[1]->isFinished() &&
             coroutines[2]->isFinished()))
    {
        CCB::yield();
    800016c8:	00000097          	auipc	ra,0x0
    800016cc:	258080e7          	jalr	600(ra) # 80001920 <_ZN3CCB5yieldEv>
    while (!(coroutines[1]->isFinished() &&
    800016d0:	fd043783          	ld	a5,-48(s0)
    bool isFinished() const { return finished; }
    800016d4:	0207c783          	lbu	a5,32(a5)
    800016d8:	fe0788e3          	beqz	a5,800016c8 <main+0x7c>
             coroutines[2]->isFinished()))
    800016dc:	fd843783          	ld	a5,-40(s0)
    800016e0:	0207c783          	lbu	a5,32(a5)
    while (!(coroutines[1]->isFinished() &&
    800016e4:	fe0782e3          	beqz	a5,800016c8 <main+0x7c>
    800016e8:	fc840493          	addi	s1,s0,-56
    800016ec:	0140006f          	j	80001700 <main+0xb4>
    }

    for (auto &coroutine: coroutines)
    {
        delete coroutine;
    800016f0:	00090513          	mv	a0,s2
    800016f4:	00000097          	auipc	ra,0x0
    800016f8:	0ac080e7          	jalr	172(ra) # 800017a0 <_ZdlPv>
    for (auto &coroutine: coroutines)
    800016fc:	00848493          	addi	s1,s1,8
    80001700:	fe040793          	addi	a5,s0,-32
    80001704:	02f48063          	beq	s1,a5,80001724 <main+0xd8>
        delete coroutine;
    80001708:	0004b903          	ld	s2,0(s1)
    8000170c:	fe0908e3          	beqz	s2,800016fc <main+0xb0>
    ~CCB() {delete[] stack;}
    80001710:	00893503          	ld	a0,8(s2)
    80001714:	fc050ee3          	beqz	a0,800016f0 <main+0xa4>
    80001718:	00000097          	auipc	ra,0x0
    8000171c:	0b0080e7          	jalr	176(ra) # 800017c8 <_ZdaPv>
    80001720:	fd1ff06f          	j	800016f0 <main+0xa4>
    }
    printString("Finished\n");
    80001724:	00004517          	auipc	a0,0x4
    80001728:	98450513          	addi	a0,a0,-1660 # 800050a8 <CONSOLE_STATUS+0x98>
    8000172c:	00000097          	auipc	ra,0x0
    80001730:	754080e7          	jalr	1876(ra) # 80001e80 <_Z11printStringPKc>

    return 0;
    80001734:	00000513          	li	a0,0
    80001738:	03813083          	ld	ra,56(sp)
    8000173c:	03013403          	ld	s0,48(sp)
    80001740:	02813483          	ld	s1,40(sp)
    80001744:	02013903          	ld	s2,32(sp)
    80001748:	04010113          	addi	sp,sp,64
    8000174c:	00008067          	ret

0000000080001750 <_Znwm>:
#include "../h/MemoryAllocator.hpp"

void *operator new(uint64 n)
{
    80001750:	ff010113          	addi	sp,sp,-16
    80001754:	00113423          	sd	ra,8(sp)
    80001758:	00813023          	sd	s0,0(sp)
    8000175c:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(n);
    80001760:	00000097          	auipc	ra,0x0
    80001764:	5ac080e7          	jalr	1452(ra) # 80001d0c <_ZN15MemoryAllocator9mem_allocEm>
}
    80001768:	00813083          	ld	ra,8(sp)
    8000176c:	00013403          	ld	s0,0(sp)
    80001770:	01010113          	addi	sp,sp,16
    80001774:	00008067          	ret

0000000080001778 <_Znam>:

void *operator new[](uint64 n)
{
    80001778:	ff010113          	addi	sp,sp,-16
    8000177c:	00113423          	sd	ra,8(sp)
    80001780:	00813023          	sd	s0,0(sp)
    80001784:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(n);
    80001788:	00000097          	auipc	ra,0x0
    8000178c:	584080e7          	jalr	1412(ra) # 80001d0c <_ZN15MemoryAllocator9mem_allocEm>
}
    80001790:	00813083          	ld	ra,8(sp)
    80001794:	00013403          	ld	s0,0(sp)
    80001798:	01010113          	addi	sp,sp,16
    8000179c:	00008067          	ret

00000000800017a0 <_ZdlPv>:

void operator delete(void *p) noexcept
{
    800017a0:	ff010113          	addi	sp,sp,-16
    800017a4:	00113423          	sd	ra,8(sp)
    800017a8:	00813023          	sd	s0,0(sp)
    800017ac:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(p);
    800017b0:	00000097          	auipc	ra,0x0
    800017b4:	608080e7          	jalr	1544(ra) # 80001db8 <_ZN15MemoryAllocator8mem_freeEPv>
}
    800017b8:	00813083          	ld	ra,8(sp)
    800017bc:	00013403          	ld	s0,0(sp)
    800017c0:	01010113          	addi	sp,sp,16
    800017c4:	00008067          	ret

00000000800017c8 <_ZdaPv>:

void operator delete[](void *p) noexcept
{
    800017c8:	ff010113          	addi	sp,sp,-16
    800017cc:	00113423          	sd	ra,8(sp)
    800017d0:	00813023          	sd	s0,0(sp)
    800017d4:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(p);
    800017d8:	00000097          	auipc	ra,0x0
    800017dc:	5e0080e7          	jalr	1504(ra) # 80001db8 <_ZN15MemoryAllocator8mem_freeEPv>
    800017e0:	00813083          	ld	ra,8(sp)
    800017e4:	00013403          	ld	s0,0(sp)
    800017e8:	01010113          	addi	sp,sp,16
    800017ec:	00008067          	ret

00000000800017f0 <_ZN3CCB15createCoroutineEPFvvE>:
#include "../h/riscv.hpp"
#include "../h/Scheduler.hpp"

CCB *CCB::running = nullptr;

CCB *CCB::createCoroutine(Body body){
    800017f0:	fe010113          	addi	sp,sp,-32
    800017f4:	00113c23          	sd	ra,24(sp)
    800017f8:	00813823          	sd	s0,16(sp)
    800017fc:	00913423          	sd	s1,8(sp)
    80001800:	01213023          	sd	s2,0(sp)
    80001804:	02010413          	addi	s0,sp,32
    80001808:	00050913          	mv	s2,a0
    return new CCB(body);
    8000180c:	02800513          	li	a0,40
    80001810:	00000097          	auipc	ra,0x0
    80001814:	f40080e7          	jalr	-192(ra) # 80001750 <_Znwm>
    80001818:	00050493          	mv	s1,a0
           stack( body!=nullptr ? new uint64[STACK_SIZE] : nullptr),
           context({
               body!=nullptr ? (uint64) body : 0,
               stack!=nullptr ? (uint64) &stack[STACK_SIZE] : 0
           }),
           finished(false)
    8000181c:	01253023          	sd	s2,0(a0)
           stack( body!=nullptr ? new uint64[STACK_SIZE] : nullptr),
    80001820:	00090a63          	beqz	s2,80001834 <_ZN3CCB15createCoroutineEPFvvE+0x44>
    80001824:	00002537          	lui	a0,0x2
    80001828:	00000097          	auipc	ra,0x0
    8000182c:	f50080e7          	jalr	-176(ra) # 80001778 <_Znam>
    80001830:	0080006f          	j	80001838 <_ZN3CCB15createCoroutineEPFvvE+0x48>
    80001834:	00000513          	li	a0,0
           finished(false)
    80001838:	00a4b423          	sd	a0,8(s1)
               body!=nullptr ? (uint64) body : 0,
    8000183c:	02090a63          	beqz	s2,80001870 <_ZN3CCB15createCoroutineEPFvvE+0x80>
    80001840:	00090793          	mv	a5,s2
           finished(false)
    80001844:	00f4b823          	sd	a5,16(s1)
               stack!=nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001848:	02050863          	beqz	a0,80001878 <_ZN3CCB15createCoroutineEPFvvE+0x88>
    8000184c:	000027b7          	lui	a5,0x2
    80001850:	00f50533          	add	a0,a0,a5
           finished(false)
    80001854:	00a4bc23          	sd	a0,24(s1)
    80001858:	02048023          	sb	zero,32(s1)
    {
        if (body!=nullptr) Scheduler::put(this);
    8000185c:	04090063          	beqz	s2,8000189c <_ZN3CCB15createCoroutineEPFvvE+0xac>
    80001860:	00048513          	mv	a0,s1
    80001864:	00000097          	auipc	ra,0x0
    80001868:	d48080e7          	jalr	-696(ra) # 800015ac <_ZN9Scheduler3putEP3CCB>
    8000186c:	0300006f          	j	8000189c <_ZN3CCB15createCoroutineEPFvvE+0xac>
               body!=nullptr ? (uint64) body : 0,
    80001870:	00000793          	li	a5,0
    80001874:	fd1ff06f          	j	80001844 <_ZN3CCB15createCoroutineEPFvvE+0x54>
               stack!=nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001878:	00000513          	li	a0,0
    8000187c:	fd9ff06f          	j	80001854 <_ZN3CCB15createCoroutineEPFvvE+0x64>
    80001880:	00050913          	mv	s2,a0
    80001884:	00048513          	mv	a0,s1
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	f18080e7          	jalr	-232(ra) # 800017a0 <_ZdlPv>
    80001890:	00090513          	mv	a0,s2
    80001894:	00005097          	auipc	ra,0x5
    80001898:	174080e7          	jalr	372(ra) # 80006a08 <_Unwind_Resume>
}
    8000189c:	00048513          	mv	a0,s1
    800018a0:	01813083          	ld	ra,24(sp)
    800018a4:	01013403          	ld	s0,16(sp)
    800018a8:	00813483          	ld	s1,8(sp)
    800018ac:	00013903          	ld	s2,0(sp)
    800018b0:	02010113          	addi	sp,sp,32
    800018b4:	00008067          	ret

00000000800018b8 <_ZN3CCB8dispatchEv>:
void CCB::yield() {
    CCB::dispatch();
}

void CCB::dispatch()
{
    800018b8:	fe010113          	addi	sp,sp,-32
    800018bc:	00113c23          	sd	ra,24(sp)
    800018c0:	00813823          	sd	s0,16(sp)
    800018c4:	00913423          	sd	s1,8(sp)
    800018c8:	02010413          	addi	s0,sp,32
    CCB *old = running;
    800018cc:	00004497          	auipc	s1,0x4
    800018d0:	0144b483          	ld	s1,20(s1) # 800058e0 <_ZN3CCB7runningE>
    bool isFinished() const { return finished; }
    800018d4:	0204c783          	lbu	a5,32(s1)
    if(!old->isFinished())
    800018d8:	02078c63          	beqz	a5,80001910 <_ZN3CCB8dispatchEv+0x58>
    {
        Scheduler::put(old);
    }
    running = Scheduler::get();
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	c68080e7          	jalr	-920(ra) # 80001544 <_ZN9Scheduler3getEv>
    800018e4:	00004797          	auipc	a5,0x4
    800018e8:	fea7be23          	sd	a0,-4(a5) # 800058e0 <_ZN3CCB7runningE>

    CCB::contextSwitch(&old->context, &running->context);
    800018ec:	01050593          	addi	a1,a0,16 # 2010 <_entry-0x7fffdff0>
    800018f0:	01048513          	addi	a0,s1,16
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	81c080e7          	jalr	-2020(ra) # 80001110 <_ZN3CCB13contextSwitchEPNS_7ContextES1_>
    800018fc:	01813083          	ld	ra,24(sp)
    80001900:	01013403          	ld	s0,16(sp)
    80001904:	00813483          	ld	s1,8(sp)
    80001908:	02010113          	addi	sp,sp,32
    8000190c:	00008067          	ret
        Scheduler::put(old);
    80001910:	00048513          	mv	a0,s1
    80001914:	00000097          	auipc	ra,0x0
    80001918:	c98080e7          	jalr	-872(ra) # 800015ac <_ZN9Scheduler3putEP3CCB>
    8000191c:	fc1ff06f          	j	800018dc <_ZN3CCB8dispatchEv+0x24>

0000000080001920 <_ZN3CCB5yieldEv>:
void CCB::yield() {
    80001920:	ff010113          	addi	sp,sp,-16
    80001924:	00113423          	sd	ra,8(sp)
    80001928:	00813023          	sd	s0,0(sp)
    8000192c:	01010413          	addi	s0,sp,16
    CCB::dispatch();
    80001930:	00000097          	auipc	ra,0x0
    80001934:	f88080e7          	jalr	-120(ra) # 800018b8 <_ZN3CCB8dispatchEv>
}
    80001938:	00813083          	ld	ra,8(sp)
    8000193c:	00013403          	ld	s0,0(sp)
    80001940:	01010113          	addi	sp,sp,16
    80001944:	00008067          	ret

0000000080001948 <_ZN5Riscv10popSppSpieEv>:

#include "../h/riscv.hpp"
#include "../h/print.hpp"

void Riscv::popSppSpie()
{
    80001948:	ff010113          	addi	sp,sp,-16
    8000194c:	00813423          	sd	s0,8(sp)
    80001950:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001954:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001958:	10200073          	sret
}
    8000195c:	00813403          	ld	s0,8(sp)
    80001960:	01010113          	addi	sp,sp,16
    80001964:	00008067          	ret

0000000080001968 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80001968:	fe010113          	addi	sp,sp,-32
    8000196c:	00813c23          	sd	s0,24(sp)
    80001970:	02010413          	addi	s0,sp,32
};

inline uint64 Riscv::r_scause()
{
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001974:	142027f3          	csrr	a5,scause
    80001978:	fef43423          	sd	a5,-24(s0)
    return scause;
    8000197c:	fe843703          	ld	a4,-24(s0)
}

inline uint64 Riscv::r_sepc()
{
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001980:	141027f3          	csrr	a5,sepc
    80001984:	fef43023          	sd	a5,-32(s0)
    return sepc;
    80001988:	fe043783          	ld	a5,-32(s0)
    // 1. Pročitaj uzrok prekida
    uint64 scause = r_scause();
    uint64 sepc = r_sepc();

    // 2. Obradi prekid u zavisnosti od uzroka
    if (scause == 0x08 || scause == 0x09) {
    8000198c:	ff870613          	addi	a2,a4,-8
    80001990:	00100693          	li	a3,1
    80001994:	02c6f063          	bgeu	a3,a2,800019b4 <_ZN5Riscv20handleSupervisorTrapEv+0x4c>

        // TODO: Ovde dodaj logiku za rukovanje sistemskim pozivom.
        // Pročitaj kod sistemskog poziva iz a0 i argumente iz a1, a2...
        // Pozovi odgovarajuću funkciju (npr. mem_alloc, thread_create...).

    } else if (scause == 0x8000000000000001UL) {
    80001998:	fff00793          	li	a5,-1
    8000199c:	03f79793          	slli	a5,a5,0x3f
    800019a0:	00178793          	addi	a5,a5,1
    800019a4:	00f71c63          	bne	a4,a5,800019bc <_ZN5Riscv20handleSupervisorTrapEv+0x54>
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"(mask));
}

inline void Riscv::mc_sip(uint64 mask)
{
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800019a8:	00200793          	li	a5,2
    800019ac:	1447b073          	csrc	sip,a5
        // Neki drugi, neočekivani prekid (npr. ilegalna instrukcija, loš pristup memoriji)
        // printString("Neocekivani prekid! scause: ");
        // printInt(scause);
        // printString("\n");
    }
}
    800019b0:	00c0006f          	j	800019bc <_ZN5Riscv20handleSupervisorTrapEv+0x54>
        w_sepc(sepc + 4);
    800019b4:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800019b8:	14179073          	csrw	sepc,a5
}
    800019bc:	01813403          	ld	s0,24(sp)
    800019c0:	02010113          	addi	sp,sp,32
    800019c4:	00008067          	ret

00000000800019c8 <_ZN15MemoryAllocator4initEv>:
uint64 MemoryAllocator::heapStart = 0;
uint64 MemoryAllocator::heapEnd = 0;
const size_t HEADER_BLOCKS = MemoryAllocator::sizeToBlocks(sizeof(MemoryAllocator::memBlock));

// Initializes the memory allocator, creating one large free block for the entire heap.
void MemoryAllocator::init() {
    800019c8:	ff010113          	addi	sp,sp,-16
    800019cc:	00813423          	sd	s0,8(sp)
    800019d0:	01010413          	addi	s0,sp,16
    uint64 start = (uint64)HEAP_START_ADDR;
    uint64 end   = (uint64)HEAP_END_ADDR;

    // Align heap boundaries to MEM_BLOCK_SIZE
    heapStart = ((start + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    800019d4:	00004797          	auipc	a5,0x4
    800019d8:	e8c7b783          	ld	a5,-372(a5) # 80005860 <HEAP_START_ADDR>
    800019dc:	03f78793          	addi	a5,a5,63
    800019e0:	fc07f793          	andi	a5,a5,-64
    800019e4:	00004717          	auipc	a4,0x4
    800019e8:	f0f73a23          	sd	a5,-236(a4) # 800058f8 <_ZN15MemoryAllocator9heapStartE>
    heapEnd   = (end / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    800019ec:	00004717          	auipc	a4,0x4
    800019f0:	e6c73703          	ld	a4,-404(a4) # 80005858 <HEAP_END_ADDR>
    800019f4:	fc077713          	andi	a4,a4,-64
    800019f8:	00004697          	auipc	a3,0x4
    800019fc:	eee6bc23          	sd	a4,-264(a3) # 800058f0 <_ZN15MemoryAllocator7heapEndE>

    if (heapEnd <= heapStart) {
    80001a00:	04e7f063          	bgeu	a5,a4,80001a40 <_ZN15MemoryAllocator4initEv+0x78>
        freeHead = nullptr;
        return;
    }

    // Set up the initial free block
    freeHead = (memBlock*) heapStart;
    80001a04:	00004697          	auipc	a3,0x4
    80001a08:	eef6be23          	sd	a5,-260(a3) # 80005900 <_ZN15MemoryAllocator8freeHeadE>
    freeHead->isFree = true;
    80001a0c:	00100693          	li	a3,1
    80001a10:	00d78423          	sb	a3,8(a5)
    freeHead->prev = nullptr;
    80001a14:	0007bc23          	sd	zero,24(a5)
    freeHead->next = nullptr;
    80001a18:	0007b823          	sd	zero,16(a5)

    size_t usableBytes = (heapEnd - heapStart) - sizeof(memBlock);
    80001a1c:	40f70733          	sub	a4,a4,a5
    80001a20:	fe070713          	addi	a4,a4,-32
    if (usableBytes < MEM_BLOCK_SIZE) {
    80001a24:	03f00693          	li	a3,63
    80001a28:	02e6f263          	bgeu	a3,a4,80001a4c <_ZN15MemoryAllocator4initEv+0x84>
        freeHead = nullptr;
        return;
    }

    freeHead->sizeBlocks = usableBytes / MEM_BLOCK_SIZE;
    80001a2c:	00675713          	srli	a4,a4,0x6
    80001a30:	00e7b023          	sd	a4,0(a5)
}
    80001a34:	00813403          	ld	s0,8(sp)
    80001a38:	01010113          	addi	sp,sp,16
    80001a3c:	00008067          	ret
        freeHead = nullptr;
    80001a40:	00004797          	auipc	a5,0x4
    80001a44:	ec07b023          	sd	zero,-320(a5) # 80005900 <_ZN15MemoryAllocator8freeHeadE>
        return;
    80001a48:	fedff06f          	j	80001a34 <_ZN15MemoryAllocator4initEv+0x6c>
        freeHead = nullptr;
    80001a4c:	00004797          	auipc	a5,0x4
    80001a50:	ea07ba23          	sd	zero,-332(a5) # 80005900 <_ZN15MemoryAllocator8freeHeadE>
        return;
    80001a54:	fe1ff06f          	j	80001a34 <_ZN15MemoryAllocator4initEv+0x6c>

0000000080001a58 <_ZN15MemoryAllocator12sizeToBlocksEm>:

// Converts a size in bytes to the corresponding number of memory blocks, rounding up.
size_t MemoryAllocator::sizeToBlocks(size_t bytes) {
    80001a58:	ff010113          	addi	sp,sp,-16
    80001a5c:	00813423          	sd	s0,8(sp)
    80001a60:	01010413          	addi	s0,sp,16
    if (bytes == 0) return 0;
    80001a64:	00050a63          	beqz	a0,80001a78 <_ZN15MemoryAllocator12sizeToBlocksEm+0x20>
    const size_t k = MEM_BLOCK_SIZE;

    // Check for potential overflow before addition
    if (bytes > (size_t)-1 - (k - 1)) {
    80001a68:	fc000793          	li	a5,-64
    80001a6c:	00a7ec63          	bltu	a5,a0,80001a84 <_ZN15MemoryAllocator12sizeToBlocksEm+0x2c>
        return (size_t)-1;
    }

    return (bytes + k - 1) / k;
    80001a70:	03f50513          	addi	a0,a0,63
    80001a74:	00655513          	srli	a0,a0,0x6
}
    80001a78:	00813403          	ld	s0,8(sp)
    80001a7c:	01010113          	addi	sp,sp,16
    80001a80:	00008067          	ret
        return (size_t)-1;
    80001a84:	fff00513          	li	a0,-1
    80001a88:	ff1ff06f          	j	80001a78 <_ZN15MemoryAllocator12sizeToBlocksEm+0x20>

0000000080001a8c <_Z41__static_initialization_and_destruction_0ii>:
    // Return the block to the free list and try to merge with neighbors
    insertSorted(h);
    tryCoalesce(h);

    return 0; // Success
    80001a8c:	00100793          	li	a5,1
    80001a90:	00f50463          	beq	a0,a5,80001a98 <_Z41__static_initialization_and_destruction_0ii+0xc>
    80001a94:	00008067          	ret
    80001a98:	000107b7          	lui	a5,0x10
    80001a9c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001aa0:	fef59ae3          	bne	a1,a5,80001a94 <_Z41__static_initialization_and_destruction_0ii+0x8>
    80001aa4:	ff010113          	addi	sp,sp,-16
    80001aa8:	00113423          	sd	ra,8(sp)
    80001aac:	00813023          	sd	s0,0(sp)
    80001ab0:	01010413          	addi	s0,sp,16
const size_t HEADER_BLOCKS = MemoryAllocator::sizeToBlocks(sizeof(MemoryAllocator::memBlock));
    80001ab4:	02000513          	li	a0,32
    80001ab8:	00000097          	auipc	ra,0x0
    80001abc:	fa0080e7          	jalr	-96(ra) # 80001a58 <_ZN15MemoryAllocator12sizeToBlocksEm>
    80001ac0:	00004797          	auipc	a5,0x4
    80001ac4:	e2a7b423          	sd	a0,-472(a5) # 800058e8 <_ZL13HEADER_BLOCKS>
    80001ac8:	00813083          	ld	ra,8(sp)
    80001acc:	00013403          	ld	s0,0(sp)
    80001ad0:	01010113          	addi	sp,sp,16
    80001ad4:	00008067          	ret

0000000080001ad8 <_ZN15MemoryAllocator10headerUserEPNS_8memBlockE>:
void* MemoryAllocator::headerUser(memBlock* h) {
    80001ad8:	ff010113          	addi	sp,sp,-16
    80001adc:	00813423          	sd	s0,8(sp)
    80001ae0:	01010413          	addi	s0,sp,16
    if (!h) return nullptr;
    80001ae4:	00050463          	beqz	a0,80001aec <_ZN15MemoryAllocator10headerUserEPNS_8memBlockE+0x14>
    return (void*)((uint8*)h + sizeof(memBlock));
    80001ae8:	02050513          	addi	a0,a0,32
}
    80001aec:	00813403          	ld	s0,8(sp)
    80001af0:	01010113          	addi	sp,sp,16
    80001af4:	00008067          	ret

0000000080001af8 <_ZN15MemoryAllocator10userHeaderEPv>:
MemoryAllocator::memBlock* MemoryAllocator::userHeader(void* userPtr) {
    80001af8:	ff010113          	addi	sp,sp,-16
    80001afc:	00813423          	sd	s0,8(sp)
    80001b00:	01010413          	addi	s0,sp,16
    if (!userPtr) return nullptr;
    80001b04:	00050463          	beqz	a0,80001b0c <_ZN15MemoryAllocator10userHeaderEPv+0x14>
    return (memBlock*)((uint8*)userPtr - sizeof(memBlock));
    80001b08:	fe050513          	addi	a0,a0,-32
}
    80001b0c:	00813403          	ld	s0,8(sp)
    80001b10:	01010113          	addi	sp,sp,16
    80001b14:	00008067          	ret

0000000080001b18 <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE>:
void MemoryAllocator::removeFree(memBlock* blk) {
    80001b18:	ff010113          	addi	sp,sp,-16
    80001b1c:	00813423          	sd	s0,8(sp)
    80001b20:	01010413          	addi	s0,sp,16
    if (!blk) return;
    80001b24:	02050663          	beqz	a0,80001b50 <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE+0x38>
    if (blk->prev) blk->prev->next = blk->next;
    80001b28:	01853783          	ld	a5,24(a0)
    80001b2c:	02078863          	beqz	a5,80001b5c <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE+0x44>
    80001b30:	01053703          	ld	a4,16(a0)
    80001b34:	00e7b823          	sd	a4,16(a5)
    if (blk->next) blk->next->prev = blk->prev;
    80001b38:	01053783          	ld	a5,16(a0)
    80001b3c:	00078663          	beqz	a5,80001b48 <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE+0x30>
    80001b40:	01853703          	ld	a4,24(a0)
    80001b44:	00e7bc23          	sd	a4,24(a5)
    blk->prev = blk->next = nullptr;
    80001b48:	00053823          	sd	zero,16(a0)
    80001b4c:	00053c23          	sd	zero,24(a0)
}
    80001b50:	00813403          	ld	s0,8(sp)
    80001b54:	01010113          	addi	sp,sp,16
    80001b58:	00008067          	ret
    else           freeHead       = blk->next;
    80001b5c:	01053783          	ld	a5,16(a0)
    80001b60:	00004717          	auipc	a4,0x4
    80001b64:	daf73023          	sd	a5,-608(a4) # 80005900 <_ZN15MemoryAllocator8freeHeadE>
    80001b68:	fd1ff06f          	j	80001b38 <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE+0x20>

0000000080001b6c <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE>:
void MemoryAllocator::insertSorted(memBlock* blk) {
    80001b6c:	ff010113          	addi	sp,sp,-16
    80001b70:	00813423          	sd	s0,8(sp)
    80001b74:	01010413          	addi	s0,sp,16
    blk->isFree = true;
    80001b78:	00100793          	li	a5,1
    80001b7c:	00f50423          	sb	a5,8(a0)
    blk->prev = blk->next = nullptr;
    80001b80:	00053823          	sd	zero,16(a0)
    80001b84:	00053c23          	sd	zero,24(a0)
    if (!freeHead) { freeHead = blk; return; }
    80001b88:	00004797          	auipc	a5,0x4
    80001b8c:	d787b783          	ld	a5,-648(a5) # 80005900 <_ZN15MemoryAllocator8freeHeadE>
    80001b90:	02078063          	beqz	a5,80001bb0 <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x44>
    uint64 addr = (uint64)blk;
    80001b94:	00050693          	mv	a3,a0
    memBlock* pv = nullptr;
    80001b98:	00000713          	li	a4,0
    while (it && (uint64)it < addr) { pv = it; it = it->next; }
    80001b9c:	02078063          	beqz	a5,80001bbc <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x50>
    80001ba0:	00d7fe63          	bgeu	a5,a3,80001bbc <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x50>
    80001ba4:	00078713          	mv	a4,a5
    80001ba8:	0107b783          	ld	a5,16(a5)
    80001bac:	ff1ff06f          	j	80001b9c <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x30>
    if (!freeHead) { freeHead = blk; return; }
    80001bb0:	00004797          	auipc	a5,0x4
    80001bb4:	d4a7b823          	sd	a0,-688(a5) # 80005900 <_ZN15MemoryAllocator8freeHeadE>
    80001bb8:	01c0006f          	j	80001bd4 <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x68>
    blk->next = it;
    80001bbc:	00f53823          	sd	a5,16(a0)
    blk->prev = pv;
    80001bc0:	00e53c23          	sd	a4,24(a0)
    if (it) it->prev = blk;
    80001bc4:	00078463          	beqz	a5,80001bcc <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x60>
    80001bc8:	00a7bc23          	sd	a0,24(a5)
    if (pv) pv->next = blk;
    80001bcc:	00070a63          	beqz	a4,80001be0 <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x74>
    80001bd0:	00a73823          	sd	a0,16(a4)
}
    80001bd4:	00813403          	ld	s0,8(sp)
    80001bd8:	01010113          	addi	sp,sp,16
    80001bdc:	00008067          	ret
    else    freeHead = blk;
    80001be0:	00004797          	auipc	a5,0x4
    80001be4:	d2a7b023          	sd	a0,-736(a5) # 80005900 <_ZN15MemoryAllocator8freeHeadE>
    80001be8:	fedff06f          	j	80001bd4 <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE+0x68>

0000000080001bec <_ZN15MemoryAllocator5splitEPNS_8memBlockEm>:
void MemoryAllocator::split(memBlock* blk, uint64 needBlocks) {
    80001bec:	00050713          	mv	a4,a0
    size_t haveBlocks  = blk->sizeBlocks;
    80001bf0:	00053783          	ld	a5,0(a0)
    size_t needBytes   = (size_t)needBlocks * MEM_BLOCK_SIZE;
    80001bf4:	00659513          	slli	a0,a1,0x6
    size_t haveBytes   = haveBlocks * MEM_BLOCK_SIZE;
    80001bf8:	00679793          	slli	a5,a5,0x6
    size_t remainBytes = haveBytes - needBytes;
    80001bfc:	40a787b3          	sub	a5,a5,a0
    if (remainBytes >= sizeof(memBlock) + MEM_BLOCK_SIZE) {
    80001c00:	05f00693          	li	a3,95
    80001c04:	00f6e463          	bltu	a3,a5,80001c0c <_ZN15MemoryAllocator5splitEPNS_8memBlockEm+0x20>
    80001c08:	00008067          	ret
void MemoryAllocator::split(memBlock* blk, uint64 needBlocks) {
    80001c0c:	ff010113          	addi	sp,sp,-16
    80001c10:	00113423          	sd	ra,8(sp)
    80001c14:	00813023          	sd	s0,0(sp)
    80001c18:	01010413          	addi	s0,sp,16
        memBlock* right = (memBlock*)((uint8*)blk + sizeof(memBlock) + needBytes);
    80001c1c:	02050513          	addi	a0,a0,32
    80001c20:	00a70533          	add	a0,a4,a0
        right->sizeBlocks = (remainBytes - sizeof(memBlock)) / MEM_BLOCK_SIZE;
    80001c24:	fe078793          	addi	a5,a5,-32
    80001c28:	0067d793          	srli	a5,a5,0x6
    80001c2c:	00f53023          	sd	a5,0(a0)
        right->isFree = true;
    80001c30:	00100793          	li	a5,1
    80001c34:	00f50423          	sb	a5,8(a0)
        blk->sizeBlocks = (size_t)needBlocks;
    80001c38:	00b73023          	sd	a1,0(a4)
        insertSorted(right);
    80001c3c:	00000097          	auipc	ra,0x0
    80001c40:	f30080e7          	jalr	-208(ra) # 80001b6c <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE>
}
    80001c44:	00813083          	ld	ra,8(sp)
    80001c48:	00013403          	ld	s0,0(sp)
    80001c4c:	01010113          	addi	sp,sp,16
    80001c50:	00008067          	ret

0000000080001c54 <_ZN15MemoryAllocator11tryCoalesceEPNS_8memBlockE>:
    if (!b) return;
    80001c54:	0a050a63          	beqz	a0,80001d08 <_ZN15MemoryAllocator11tryCoalesceEPNS_8memBlockE+0xb4>
void MemoryAllocator::tryCoalesce(memBlock* b) {
    80001c58:	fe010113          	addi	sp,sp,-32
    80001c5c:	00113c23          	sd	ra,24(sp)
    80001c60:	00813823          	sd	s0,16(sp)
    80001c64:	00913423          	sd	s1,8(sp)
    80001c68:	02010413          	addi	s0,sp,32
    if (b->prev) {
    80001c6c:	01853483          	ld	s1,24(a0)
    80001c70:	00048c63          	beqz	s1,80001c88 <_ZN15MemoryAllocator11tryCoalesceEPNS_8memBlockE+0x34>
        uint64 endOfPrev = (uint64)b->prev + sizeof(memBlock) + b->prev->sizeBlocks * MEM_BLOCK_SIZE;
    80001c74:	0004b703          	ld	a4,0(s1)
    80001c78:	00671793          	slli	a5,a4,0x6
    80001c7c:	00f487b3          	add	a5,s1,a5
    80001c80:	02078793          	addi	a5,a5,32
        if (endOfPrev == (uint64)b) {
    80001c84:	02f50a63          	beq	a0,a5,80001cb8 <_ZN15MemoryAllocator11tryCoalesceEPNS_8memBlockE+0x64>
    if (b->next) {
    80001c88:	01053703          	ld	a4,16(a0)
    80001c8c:	00070c63          	beqz	a4,80001ca4 <_ZN15MemoryAllocator11tryCoalesceEPNS_8memBlockE+0x50>
        uint64 endOfCurrent = (uint64)b + sizeof(memBlock) + b->sizeBlocks * MEM_BLOCK_SIZE;
    80001c90:	00053683          	ld	a3,0(a0)
    80001c94:	00669793          	slli	a5,a3,0x6
    80001c98:	00f507b3          	add	a5,a0,a5
    80001c9c:	02078793          	addi	a5,a5,32
        if (endOfCurrent == (uint64)b->next) {
    80001ca0:	04f70063          	beq	a4,a5,80001ce0 <_ZN15MemoryAllocator11tryCoalesceEPNS_8memBlockE+0x8c>
}
    80001ca4:	01813083          	ld	ra,24(sp)
    80001ca8:	01013403          	ld	s0,16(sp)
    80001cac:	00813483          	ld	s1,8(sp)
    80001cb0:	02010113          	addi	sp,sp,32
    80001cb4:	00008067          	ret
            left->sizeBlocks += b->sizeBlocks + HEADER_BLOCKS;
    80001cb8:	00053783          	ld	a5,0(a0)
    80001cbc:	00004697          	auipc	a3,0x4
    80001cc0:	c2c6b683          	ld	a3,-980(a3) # 800058e8 <_ZL13HEADER_BLOCKS>
    80001cc4:	00d787b3          	add	a5,a5,a3
    80001cc8:	00f70733          	add	a4,a4,a5
    80001ccc:	00e4b023          	sd	a4,0(s1)
            removeFree(b);
    80001cd0:	00000097          	auipc	ra,0x0
    80001cd4:	e48080e7          	jalr	-440(ra) # 80001b18 <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE>
            b = left; // Continue with the new, larger block
    80001cd8:	00048513          	mv	a0,s1
    80001cdc:	fadff06f          	j	80001c88 <_ZN15MemoryAllocator11tryCoalesceEPNS_8memBlockE+0x34>
            b->sizeBlocks += right->sizeBlocks + HEADER_BLOCKS;
    80001ce0:	00073783          	ld	a5,0(a4)
    80001ce4:	00004617          	auipc	a2,0x4
    80001ce8:	c0463603          	ld	a2,-1020(a2) # 800058e8 <_ZL13HEADER_BLOCKS>
    80001cec:	00c787b3          	add	a5,a5,a2
    80001cf0:	00f686b3          	add	a3,a3,a5
    80001cf4:	00d53023          	sd	a3,0(a0)
            removeFree(right);
    80001cf8:	00070513          	mv	a0,a4
    80001cfc:	00000097          	auipc	ra,0x0
    80001d00:	e1c080e7          	jalr	-484(ra) # 80001b18 <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE>
    80001d04:	fa1ff06f          	j	80001ca4 <_ZN15MemoryAllocator11tryCoalesceEPNS_8memBlockE+0x50>
    80001d08:	00008067          	ret

0000000080001d0c <_ZN15MemoryAllocator9mem_allocEm>:
void* MemoryAllocator::mem_alloc(size_t size) {
    80001d0c:	fe010113          	addi	sp,sp,-32
    80001d10:	00113c23          	sd	ra,24(sp)
    80001d14:	00813823          	sd	s0,16(sp)
    80001d18:	00913423          	sd	s1,8(sp)
    80001d1c:	01213023          	sd	s2,0(sp)
    80001d20:	02010413          	addi	s0,sp,32
    if (!freeHead || size == 0) return nullptr;
    80001d24:	00004497          	auipc	s1,0x4
    80001d28:	bdc4b483          	ld	s1,-1060(s1) # 80005900 <_ZN15MemoryAllocator8freeHeadE>
    80001d2c:	06048063          	beqz	s1,80001d8c <_ZN15MemoryAllocator9mem_allocEm+0x80>
    80001d30:	06050c63          	beqz	a0,80001da8 <_ZN15MemoryAllocator9mem_allocEm+0x9c>
    size_t needBlocks = sizeToBlocks(size);
    80001d34:	00000097          	auipc	ra,0x0
    80001d38:	d24080e7          	jalr	-732(ra) # 80001a58 <_ZN15MemoryAllocator12sizeToBlocksEm>
    80001d3c:	00050913          	mv	s2,a0
    if (needBlocks == (size_t)-1) return nullptr;
    80001d40:	fff00793          	li	a5,-1
    80001d44:	06f50663          	beq	a0,a5,80001db0 <_ZN15MemoryAllocator9mem_allocEm+0xa4>
    for (memBlock* it = freeHead; it; it = it->next) {
    80001d48:	04048263          	beqz	s1,80001d8c <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if (it->sizeBlocks >= needBlocks) {
    80001d4c:	0004b783          	ld	a5,0(s1)
    80001d50:	0127f663          	bgeu	a5,s2,80001d5c <_ZN15MemoryAllocator9mem_allocEm+0x50>
    for (memBlock* it = freeHead; it; it = it->next) {
    80001d54:	0104b483          	ld	s1,16(s1)
    80001d58:	ff1ff06f          	j	80001d48 <_ZN15MemoryAllocator9mem_allocEm+0x3c>
            removeFree(it);
    80001d5c:	00048513          	mv	a0,s1
    80001d60:	00000097          	auipc	ra,0x0
    80001d64:	db8080e7          	jalr	-584(ra) # 80001b18 <_ZN15MemoryAllocator10removeFreeEPNS_8memBlockE>
            split(it, (uint64)needBlocks);
    80001d68:	00090593          	mv	a1,s2
    80001d6c:	00048513          	mv	a0,s1
    80001d70:	00000097          	auipc	ra,0x0
    80001d74:	e7c080e7          	jalr	-388(ra) # 80001bec <_ZN15MemoryAllocator5splitEPNS_8memBlockEm>
            it->isFree = false;
    80001d78:	00048423          	sb	zero,8(s1)
            return headerUser(it);
    80001d7c:	00048513          	mv	a0,s1
    80001d80:	00000097          	auipc	ra,0x0
    80001d84:	d58080e7          	jalr	-680(ra) # 80001ad8 <_ZN15MemoryAllocator10headerUserEPNS_8memBlockE>
    80001d88:	00050493          	mv	s1,a0
}
    80001d8c:	00048513          	mv	a0,s1
    80001d90:	01813083          	ld	ra,24(sp)
    80001d94:	01013403          	ld	s0,16(sp)
    80001d98:	00813483          	ld	s1,8(sp)
    80001d9c:	00013903          	ld	s2,0(sp)
    80001da0:	02010113          	addi	sp,sp,32
    80001da4:	00008067          	ret
    if (!freeHead || size == 0) return nullptr;
    80001da8:	00000493          	li	s1,0
    80001dac:	fe1ff06f          	j	80001d8c <_ZN15MemoryAllocator9mem_allocEm+0x80>
    if (needBlocks == (size_t)-1) return nullptr;
    80001db0:	00000493          	li	s1,0
    80001db4:	fd9ff06f          	j	80001d8c <_ZN15MemoryAllocator9mem_allocEm+0x80>

0000000080001db8 <_ZN15MemoryAllocator8mem_freeEPv>:
    if (!p) return -1; // Cannot free a null pointer
    80001db8:	06050a63          	beqz	a0,80001e2c <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    if (up < heapStart + sizeof(memBlock) || up >= heapEnd) return -2; // Pointer out of heap bounds
    80001dbc:	00004797          	auipc	a5,0x4
    80001dc0:	b3c7b783          	ld	a5,-1220(a5) # 800058f8 <_ZN15MemoryAllocator9heapStartE>
    80001dc4:	02078793          	addi	a5,a5,32
    80001dc8:	06f56663          	bltu	a0,a5,80001e34 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
    80001dcc:	00004797          	auipc	a5,0x4
    80001dd0:	b247b783          	ld	a5,-1244(a5) # 800058f0 <_ZN15MemoryAllocator7heapEndE>
    80001dd4:	06f57463          	bgeu	a0,a5,80001e3c <_ZN15MemoryAllocator8mem_freeEPv+0x84>
int MemoryAllocator::mem_free(void* p) {
    80001dd8:	fe010113          	addi	sp,sp,-32
    80001ddc:	00113c23          	sd	ra,24(sp)
    80001de0:	00813823          	sd	s0,16(sp)
    80001de4:	00913423          	sd	s1,8(sp)
    80001de8:	02010413          	addi	s0,sp,32
    memBlock* h = userHeader(p);
    80001dec:	00000097          	auipc	ra,0x0
    80001df0:	d0c080e7          	jalr	-756(ra) # 80001af8 <_ZN15MemoryAllocator10userHeaderEPv>
    80001df4:	00050493          	mv	s1,a0
    if (h->isFree) return -4; // Double free error
    80001df8:	00854783          	lbu	a5,8(a0)
    80001dfc:	04079463          	bnez	a5,80001e44 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
    insertSorted(h);
    80001e00:	00000097          	auipc	ra,0x0
    80001e04:	d6c080e7          	jalr	-660(ra) # 80001b6c <_ZN15MemoryAllocator12insertSortedEPNS_8memBlockE>
    tryCoalesce(h);
    80001e08:	00048513          	mv	a0,s1
    80001e0c:	00000097          	auipc	ra,0x0
    80001e10:	e48080e7          	jalr	-440(ra) # 80001c54 <_ZN15MemoryAllocator11tryCoalesceEPNS_8memBlockE>
    return 0; // Success
    80001e14:	00000513          	li	a0,0
    80001e18:	01813083          	ld	ra,24(sp)
    80001e1c:	01013403          	ld	s0,16(sp)
    80001e20:	00813483          	ld	s1,8(sp)
    80001e24:	02010113          	addi	sp,sp,32
    80001e28:	00008067          	ret
    if (!p) return -1; // Cannot free a null pointer
    80001e2c:	fff00513          	li	a0,-1
    80001e30:	00008067          	ret
    if (up < heapStart + sizeof(memBlock) || up >= heapEnd) return -2; // Pointer out of heap bounds
    80001e34:	ffe00513          	li	a0,-2
    80001e38:	00008067          	ret
    80001e3c:	ffe00513          	li	a0,-2
    80001e40:	00008067          	ret
    if (h->isFree) return -4; // Double free error
    80001e44:	ffc00513          	li	a0,-4
    80001e48:	fd1ff06f          	j	80001e18 <_ZN15MemoryAllocator8mem_freeEPv+0x60>

0000000080001e4c <_GLOBAL__sub_I__ZN15MemoryAllocator8freeHeadE>:
    80001e4c:	ff010113          	addi	sp,sp,-16
    80001e50:	00113423          	sd	ra,8(sp)
    80001e54:	00813023          	sd	s0,0(sp)
    80001e58:	01010413          	addi	s0,sp,16
    80001e5c:	000105b7          	lui	a1,0x10
    80001e60:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001e64:	00100513          	li	a0,1
    80001e68:	00000097          	auipc	ra,0x0
    80001e6c:	c24080e7          	jalr	-988(ra) # 80001a8c <_Z41__static_initialization_and_destruction_0ii>
    80001e70:	00813083          	ld	ra,8(sp)
    80001e74:	00013403          	ld	s0,0(sp)
    80001e78:	01010113          	addi	sp,sp,16
    80001e7c:	00008067          	ret

0000000080001e80 <_Z11printStringPKc>:
//

#include "../h/print.hpp"
#include "../lib/console.h"

void printString(char const *string){
    80001e80:	fe010113          	addi	sp,sp,-32
    80001e84:	00113c23          	sd	ra,24(sp)
    80001e88:	00813823          	sd	s0,16(sp)
    80001e8c:	00913423          	sd	s1,8(sp)
    80001e90:	02010413          	addi	s0,sp,32
    80001e94:	00050493          	mv	s1,a0
    while (*string != '\n'){
    80001e98:	0004c503          	lbu	a0,0(s1)
    80001e9c:	00a00793          	li	a5,10
    80001ea0:	00f50a63          	beq	a0,a5,80001eb4 <_Z11printStringPKc+0x34>
        __putc(*string);
    80001ea4:	00002097          	auipc	ra,0x2
    80001ea8:	178080e7          	jalr	376(ra) # 8000401c <__putc>
        string++;
    80001eac:	00148493          	addi	s1,s1,1
    while (*string != '\n'){
    80001eb0:	fe9ff06f          	j	80001e98 <_Z11printStringPKc+0x18>
    }
}
    80001eb4:	01813083          	ld	ra,24(sp)
    80001eb8:	01013403          	ld	s0,16(sp)
    80001ebc:	00813483          	ld	s1,8(sp)
    80001ec0:	02010113          	addi	sp,sp,32
    80001ec4:	00008067          	ret

0000000080001ec8 <_Z12printIntegerm>:

void printInteger(uint64 integer){
    80001ec8:	fd010113          	addi	sp,sp,-48
    80001ecc:	02113423          	sd	ra,40(sp)
    80001ed0:	02813023          	sd	s0,32(sp)
    80001ed4:	00913c23          	sd	s1,24(sp)
    80001ed8:	03010413          	addi	s0,sp,48
    neg = 0;
    if (integer<0){
        neg = 1;
        x = -integer;
    } else{
        x = integer;
    80001edc:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80001ee0:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x%10];
    80001ee4:	00a00613          	li	a2,10
    80001ee8:	02c5773b          	remuw	a4,a0,a2
    80001eec:	02071693          	slli	a3,a4,0x20
    80001ef0:	0206d693          	srli	a3,a3,0x20
    80001ef4:	00003717          	auipc	a4,0x3
    80001ef8:	1c470713          	addi	a4,a4,452 # 800050b8 <_ZZ12printIntegermE6digits>
    80001efc:	00d70733          	add	a4,a4,a3
    80001f00:	00074703          	lbu	a4,0(a4)
    80001f04:	fe040693          	addi	a3,s0,-32
    80001f08:	009687b3          	add	a5,a3,s1
    80001f0c:	0014849b          	addiw	s1,s1,1
    80001f10:	fee78823          	sb	a4,-16(a5)
    }while ((x/=10)!=0);
    80001f14:	0005071b          	sext.w	a4,a0
    80001f18:	02c5553b          	divuw	a0,a0,a2
    80001f1c:	00900793          	li	a5,9
    80001f20:	fce7e2e3          	bltu	a5,a4,80001ee4 <_Z12printIntegerm+0x1c>

    if (neg) buf[i++] = '-';

    while(--i>0){
    80001f24:	fff4849b          	addiw	s1,s1,-1
    80001f28:	00905e63          	blez	s1,80001f44 <_Z12printIntegerm+0x7c>
        __putc(buf[i]);
    80001f2c:	fe040793          	addi	a5,s0,-32
    80001f30:	009787b3          	add	a5,a5,s1
    80001f34:	ff07c503          	lbu	a0,-16(a5)
    80001f38:	00002097          	auipc	ra,0x2
    80001f3c:	0e4080e7          	jalr	228(ra) # 8000401c <__putc>
    80001f40:	fe5ff06f          	j	80001f24 <_Z12printIntegerm+0x5c>
    }

}
    80001f44:	02813083          	ld	ra,40(sp)
    80001f48:	02013403          	ld	s0,32(sp)
    80001f4c:	01813483          	ld	s1,24(sp)
    80001f50:	03010113          	addi	sp,sp,48
    80001f54:	00008067          	ret

0000000080001f58 <start>:
    80001f58:	ff010113          	addi	sp,sp,-16
    80001f5c:	00813423          	sd	s0,8(sp)
    80001f60:	01010413          	addi	s0,sp,16
    80001f64:	300027f3          	csrr	a5,mstatus
    80001f68:	ffffe737          	lui	a4,0xffffe
    80001f6c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7c5f>
    80001f70:	00e7f7b3          	and	a5,a5,a4
    80001f74:	00001737          	lui	a4,0x1
    80001f78:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001f7c:	00e7e7b3          	or	a5,a5,a4
    80001f80:	30079073          	csrw	mstatus,a5
    80001f84:	00000797          	auipc	a5,0x0
    80001f88:	16078793          	addi	a5,a5,352 # 800020e4 <system_main>
    80001f8c:	34179073          	csrw	mepc,a5
    80001f90:	00000793          	li	a5,0
    80001f94:	18079073          	csrw	satp,a5
    80001f98:	000107b7          	lui	a5,0x10
    80001f9c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001fa0:	30279073          	csrw	medeleg,a5
    80001fa4:	30379073          	csrw	mideleg,a5
    80001fa8:	104027f3          	csrr	a5,sie
    80001fac:	2227e793          	ori	a5,a5,546
    80001fb0:	10479073          	csrw	sie,a5
    80001fb4:	fff00793          	li	a5,-1
    80001fb8:	00a7d793          	srli	a5,a5,0xa
    80001fbc:	3b079073          	csrw	pmpaddr0,a5
    80001fc0:	00f00793          	li	a5,15
    80001fc4:	3a079073          	csrw	pmpcfg0,a5
    80001fc8:	f14027f3          	csrr	a5,mhartid
    80001fcc:	0200c737          	lui	a4,0x200c
    80001fd0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001fd4:	0007869b          	sext.w	a3,a5
    80001fd8:	00269713          	slli	a4,a3,0x2
    80001fdc:	000f4637          	lui	a2,0xf4
    80001fe0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001fe4:	00d70733          	add	a4,a4,a3
    80001fe8:	0037979b          	slliw	a5,a5,0x3
    80001fec:	020046b7          	lui	a3,0x2004
    80001ff0:	00d787b3          	add	a5,a5,a3
    80001ff4:	00c585b3          	add	a1,a1,a2
    80001ff8:	00371693          	slli	a3,a4,0x3
    80001ffc:	00004717          	auipc	a4,0x4
    80002000:	94470713          	addi	a4,a4,-1724 # 80005940 <timer_scratch>
    80002004:	00b7b023          	sd	a1,0(a5)
    80002008:	00d70733          	add	a4,a4,a3
    8000200c:	00f73c23          	sd	a5,24(a4)
    80002010:	02c73023          	sd	a2,32(a4)
    80002014:	34071073          	csrw	mscratch,a4
    80002018:	00000797          	auipc	a5,0x0
    8000201c:	6e878793          	addi	a5,a5,1768 # 80002700 <timervec>
    80002020:	30579073          	csrw	mtvec,a5
    80002024:	300027f3          	csrr	a5,mstatus
    80002028:	0087e793          	ori	a5,a5,8
    8000202c:	30079073          	csrw	mstatus,a5
    80002030:	304027f3          	csrr	a5,mie
    80002034:	0807e793          	ori	a5,a5,128
    80002038:	30479073          	csrw	mie,a5
    8000203c:	f14027f3          	csrr	a5,mhartid
    80002040:	0007879b          	sext.w	a5,a5
    80002044:	00078213          	mv	tp,a5
    80002048:	30200073          	mret
    8000204c:	00813403          	ld	s0,8(sp)
    80002050:	01010113          	addi	sp,sp,16
    80002054:	00008067          	ret

0000000080002058 <timerinit>:
    80002058:	ff010113          	addi	sp,sp,-16
    8000205c:	00813423          	sd	s0,8(sp)
    80002060:	01010413          	addi	s0,sp,16
    80002064:	f14027f3          	csrr	a5,mhartid
    80002068:	0200c737          	lui	a4,0x200c
    8000206c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002070:	0007869b          	sext.w	a3,a5
    80002074:	00269713          	slli	a4,a3,0x2
    80002078:	000f4637          	lui	a2,0xf4
    8000207c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002080:	00d70733          	add	a4,a4,a3
    80002084:	0037979b          	slliw	a5,a5,0x3
    80002088:	020046b7          	lui	a3,0x2004
    8000208c:	00d787b3          	add	a5,a5,a3
    80002090:	00c585b3          	add	a1,a1,a2
    80002094:	00371693          	slli	a3,a4,0x3
    80002098:	00004717          	auipc	a4,0x4
    8000209c:	8a870713          	addi	a4,a4,-1880 # 80005940 <timer_scratch>
    800020a0:	00b7b023          	sd	a1,0(a5)
    800020a4:	00d70733          	add	a4,a4,a3
    800020a8:	00f73c23          	sd	a5,24(a4)
    800020ac:	02c73023          	sd	a2,32(a4)
    800020b0:	34071073          	csrw	mscratch,a4
    800020b4:	00000797          	auipc	a5,0x0
    800020b8:	64c78793          	addi	a5,a5,1612 # 80002700 <timervec>
    800020bc:	30579073          	csrw	mtvec,a5
    800020c0:	300027f3          	csrr	a5,mstatus
    800020c4:	0087e793          	ori	a5,a5,8
    800020c8:	30079073          	csrw	mstatus,a5
    800020cc:	304027f3          	csrr	a5,mie
    800020d0:	0807e793          	ori	a5,a5,128
    800020d4:	30479073          	csrw	mie,a5
    800020d8:	00813403          	ld	s0,8(sp)
    800020dc:	01010113          	addi	sp,sp,16
    800020e0:	00008067          	ret

00000000800020e4 <system_main>:
    800020e4:	fe010113          	addi	sp,sp,-32
    800020e8:	00813823          	sd	s0,16(sp)
    800020ec:	00913423          	sd	s1,8(sp)
    800020f0:	00113c23          	sd	ra,24(sp)
    800020f4:	02010413          	addi	s0,sp,32
    800020f8:	00000097          	auipc	ra,0x0
    800020fc:	0c4080e7          	jalr	196(ra) # 800021bc <cpuid>
    80002100:	00004497          	auipc	s1,0x4
    80002104:	80848493          	addi	s1,s1,-2040 # 80005908 <started>
    80002108:	02050263          	beqz	a0,8000212c <system_main+0x48>
    8000210c:	0004a783          	lw	a5,0(s1)
    80002110:	0007879b          	sext.w	a5,a5
    80002114:	fe078ce3          	beqz	a5,8000210c <system_main+0x28>
    80002118:	0ff0000f          	fence
    8000211c:	00003517          	auipc	a0,0x3
    80002120:	fdc50513          	addi	a0,a0,-36 # 800050f8 <_ZZ12printIntegermE6digits+0x40>
    80002124:	00001097          	auipc	ra,0x1
    80002128:	a78080e7          	jalr	-1416(ra) # 80002b9c <panic>
    8000212c:	00001097          	auipc	ra,0x1
    80002130:	9cc080e7          	jalr	-1588(ra) # 80002af8 <consoleinit>
    80002134:	00001097          	auipc	ra,0x1
    80002138:	158080e7          	jalr	344(ra) # 8000328c <printfinit>
    8000213c:	00003517          	auipc	a0,0x3
    80002140:	f7450513          	addi	a0,a0,-140 # 800050b0 <CONSOLE_STATUS+0xa0>
    80002144:	00001097          	auipc	ra,0x1
    80002148:	ab4080e7          	jalr	-1356(ra) # 80002bf8 <__printf>
    8000214c:	00003517          	auipc	a0,0x3
    80002150:	f7c50513          	addi	a0,a0,-132 # 800050c8 <_ZZ12printIntegermE6digits+0x10>
    80002154:	00001097          	auipc	ra,0x1
    80002158:	aa4080e7          	jalr	-1372(ra) # 80002bf8 <__printf>
    8000215c:	00003517          	auipc	a0,0x3
    80002160:	f5450513          	addi	a0,a0,-172 # 800050b0 <CONSOLE_STATUS+0xa0>
    80002164:	00001097          	auipc	ra,0x1
    80002168:	a94080e7          	jalr	-1388(ra) # 80002bf8 <__printf>
    8000216c:	00001097          	auipc	ra,0x1
    80002170:	4ac080e7          	jalr	1196(ra) # 80003618 <kinit>
    80002174:	00000097          	auipc	ra,0x0
    80002178:	148080e7          	jalr	328(ra) # 800022bc <trapinit>
    8000217c:	00000097          	auipc	ra,0x0
    80002180:	16c080e7          	jalr	364(ra) # 800022e8 <trapinithart>
    80002184:	00000097          	auipc	ra,0x0
    80002188:	5bc080e7          	jalr	1468(ra) # 80002740 <plicinit>
    8000218c:	00000097          	auipc	ra,0x0
    80002190:	5dc080e7          	jalr	1500(ra) # 80002768 <plicinithart>
    80002194:	00000097          	auipc	ra,0x0
    80002198:	078080e7          	jalr	120(ra) # 8000220c <userinit>
    8000219c:	0ff0000f          	fence
    800021a0:	00100793          	li	a5,1
    800021a4:	00003517          	auipc	a0,0x3
    800021a8:	f3c50513          	addi	a0,a0,-196 # 800050e0 <_ZZ12printIntegermE6digits+0x28>
    800021ac:	00f4a023          	sw	a5,0(s1)
    800021b0:	00001097          	auipc	ra,0x1
    800021b4:	a48080e7          	jalr	-1464(ra) # 80002bf8 <__printf>
    800021b8:	0000006f          	j	800021b8 <system_main+0xd4>

00000000800021bc <cpuid>:
    800021bc:	ff010113          	addi	sp,sp,-16
    800021c0:	00813423          	sd	s0,8(sp)
    800021c4:	01010413          	addi	s0,sp,16
    800021c8:	00020513          	mv	a0,tp
    800021cc:	00813403          	ld	s0,8(sp)
    800021d0:	0005051b          	sext.w	a0,a0
    800021d4:	01010113          	addi	sp,sp,16
    800021d8:	00008067          	ret

00000000800021dc <mycpu>:
    800021dc:	ff010113          	addi	sp,sp,-16
    800021e0:	00813423          	sd	s0,8(sp)
    800021e4:	01010413          	addi	s0,sp,16
    800021e8:	00020793          	mv	a5,tp
    800021ec:	00813403          	ld	s0,8(sp)
    800021f0:	0007879b          	sext.w	a5,a5
    800021f4:	00779793          	slli	a5,a5,0x7
    800021f8:	00004517          	auipc	a0,0x4
    800021fc:	77850513          	addi	a0,a0,1912 # 80006970 <cpus>
    80002200:	00f50533          	add	a0,a0,a5
    80002204:	01010113          	addi	sp,sp,16
    80002208:	00008067          	ret

000000008000220c <userinit>:
    8000220c:	ff010113          	addi	sp,sp,-16
    80002210:	00813423          	sd	s0,8(sp)
    80002214:	01010413          	addi	s0,sp,16
    80002218:	00813403          	ld	s0,8(sp)
    8000221c:	01010113          	addi	sp,sp,16
    80002220:	fffff317          	auipc	t1,0xfffff
    80002224:	42c30067          	jr	1068(t1) # 8000164c <main>

0000000080002228 <either_copyout>:
    80002228:	ff010113          	addi	sp,sp,-16
    8000222c:	00813023          	sd	s0,0(sp)
    80002230:	00113423          	sd	ra,8(sp)
    80002234:	01010413          	addi	s0,sp,16
    80002238:	02051663          	bnez	a0,80002264 <either_copyout+0x3c>
    8000223c:	00058513          	mv	a0,a1
    80002240:	00060593          	mv	a1,a2
    80002244:	0006861b          	sext.w	a2,a3
    80002248:	00002097          	auipc	ra,0x2
    8000224c:	c5c080e7          	jalr	-932(ra) # 80003ea4 <__memmove>
    80002250:	00813083          	ld	ra,8(sp)
    80002254:	00013403          	ld	s0,0(sp)
    80002258:	00000513          	li	a0,0
    8000225c:	01010113          	addi	sp,sp,16
    80002260:	00008067          	ret
    80002264:	00003517          	auipc	a0,0x3
    80002268:	ebc50513          	addi	a0,a0,-324 # 80005120 <_ZZ12printIntegermE6digits+0x68>
    8000226c:	00001097          	auipc	ra,0x1
    80002270:	930080e7          	jalr	-1744(ra) # 80002b9c <panic>

0000000080002274 <either_copyin>:
    80002274:	ff010113          	addi	sp,sp,-16
    80002278:	00813023          	sd	s0,0(sp)
    8000227c:	00113423          	sd	ra,8(sp)
    80002280:	01010413          	addi	s0,sp,16
    80002284:	02059463          	bnez	a1,800022ac <either_copyin+0x38>
    80002288:	00060593          	mv	a1,a2
    8000228c:	0006861b          	sext.w	a2,a3
    80002290:	00002097          	auipc	ra,0x2
    80002294:	c14080e7          	jalr	-1004(ra) # 80003ea4 <__memmove>
    80002298:	00813083          	ld	ra,8(sp)
    8000229c:	00013403          	ld	s0,0(sp)
    800022a0:	00000513          	li	a0,0
    800022a4:	01010113          	addi	sp,sp,16
    800022a8:	00008067          	ret
    800022ac:	00003517          	auipc	a0,0x3
    800022b0:	e9c50513          	addi	a0,a0,-356 # 80005148 <_ZZ12printIntegermE6digits+0x90>
    800022b4:	00001097          	auipc	ra,0x1
    800022b8:	8e8080e7          	jalr	-1816(ra) # 80002b9c <panic>

00000000800022bc <trapinit>:
    800022bc:	ff010113          	addi	sp,sp,-16
    800022c0:	00813423          	sd	s0,8(sp)
    800022c4:	01010413          	addi	s0,sp,16
    800022c8:	00813403          	ld	s0,8(sp)
    800022cc:	00003597          	auipc	a1,0x3
    800022d0:	ea458593          	addi	a1,a1,-348 # 80005170 <_ZZ12printIntegermE6digits+0xb8>
    800022d4:	00004517          	auipc	a0,0x4
    800022d8:	71c50513          	addi	a0,a0,1820 # 800069f0 <tickslock>
    800022dc:	01010113          	addi	sp,sp,16
    800022e0:	00001317          	auipc	t1,0x1
    800022e4:	5c830067          	jr	1480(t1) # 800038a8 <initlock>

00000000800022e8 <trapinithart>:
    800022e8:	ff010113          	addi	sp,sp,-16
    800022ec:	00813423          	sd	s0,8(sp)
    800022f0:	01010413          	addi	s0,sp,16
    800022f4:	00000797          	auipc	a5,0x0
    800022f8:	2fc78793          	addi	a5,a5,764 # 800025f0 <kernelvec>
    800022fc:	10579073          	csrw	stvec,a5
    80002300:	00813403          	ld	s0,8(sp)
    80002304:	01010113          	addi	sp,sp,16
    80002308:	00008067          	ret

000000008000230c <usertrap>:
    8000230c:	ff010113          	addi	sp,sp,-16
    80002310:	00813423          	sd	s0,8(sp)
    80002314:	01010413          	addi	s0,sp,16
    80002318:	00813403          	ld	s0,8(sp)
    8000231c:	01010113          	addi	sp,sp,16
    80002320:	00008067          	ret

0000000080002324 <usertrapret>:
    80002324:	ff010113          	addi	sp,sp,-16
    80002328:	00813423          	sd	s0,8(sp)
    8000232c:	01010413          	addi	s0,sp,16
    80002330:	00813403          	ld	s0,8(sp)
    80002334:	01010113          	addi	sp,sp,16
    80002338:	00008067          	ret

000000008000233c <kerneltrap>:
    8000233c:	fe010113          	addi	sp,sp,-32
    80002340:	00813823          	sd	s0,16(sp)
    80002344:	00113c23          	sd	ra,24(sp)
    80002348:	00913423          	sd	s1,8(sp)
    8000234c:	02010413          	addi	s0,sp,32
    80002350:	142025f3          	csrr	a1,scause
    80002354:	100027f3          	csrr	a5,sstatus
    80002358:	0027f793          	andi	a5,a5,2
    8000235c:	10079c63          	bnez	a5,80002474 <kerneltrap+0x138>
    80002360:	142027f3          	csrr	a5,scause
    80002364:	0207ce63          	bltz	a5,800023a0 <kerneltrap+0x64>
    80002368:	00003517          	auipc	a0,0x3
    8000236c:	e5050513          	addi	a0,a0,-432 # 800051b8 <_ZZ12printIntegermE6digits+0x100>
    80002370:	00001097          	auipc	ra,0x1
    80002374:	888080e7          	jalr	-1912(ra) # 80002bf8 <__printf>
    80002378:	141025f3          	csrr	a1,sepc
    8000237c:	14302673          	csrr	a2,stval
    80002380:	00003517          	auipc	a0,0x3
    80002384:	e4850513          	addi	a0,a0,-440 # 800051c8 <_ZZ12printIntegermE6digits+0x110>
    80002388:	00001097          	auipc	ra,0x1
    8000238c:	870080e7          	jalr	-1936(ra) # 80002bf8 <__printf>
    80002390:	00003517          	auipc	a0,0x3
    80002394:	e5050513          	addi	a0,a0,-432 # 800051e0 <_ZZ12printIntegermE6digits+0x128>
    80002398:	00001097          	auipc	ra,0x1
    8000239c:	804080e7          	jalr	-2044(ra) # 80002b9c <panic>
    800023a0:	0ff7f713          	andi	a4,a5,255
    800023a4:	00900693          	li	a3,9
    800023a8:	04d70063          	beq	a4,a3,800023e8 <kerneltrap+0xac>
    800023ac:	fff00713          	li	a4,-1
    800023b0:	03f71713          	slli	a4,a4,0x3f
    800023b4:	00170713          	addi	a4,a4,1
    800023b8:	fae798e3          	bne	a5,a4,80002368 <kerneltrap+0x2c>
    800023bc:	00000097          	auipc	ra,0x0
    800023c0:	e00080e7          	jalr	-512(ra) # 800021bc <cpuid>
    800023c4:	06050663          	beqz	a0,80002430 <kerneltrap+0xf4>
    800023c8:	144027f3          	csrr	a5,sip
    800023cc:	ffd7f793          	andi	a5,a5,-3
    800023d0:	14479073          	csrw	sip,a5
    800023d4:	01813083          	ld	ra,24(sp)
    800023d8:	01013403          	ld	s0,16(sp)
    800023dc:	00813483          	ld	s1,8(sp)
    800023e0:	02010113          	addi	sp,sp,32
    800023e4:	00008067          	ret
    800023e8:	00000097          	auipc	ra,0x0
    800023ec:	3cc080e7          	jalr	972(ra) # 800027b4 <plic_claim>
    800023f0:	00a00793          	li	a5,10
    800023f4:	00050493          	mv	s1,a0
    800023f8:	06f50863          	beq	a0,a5,80002468 <kerneltrap+0x12c>
    800023fc:	fc050ce3          	beqz	a0,800023d4 <kerneltrap+0x98>
    80002400:	00050593          	mv	a1,a0
    80002404:	00003517          	auipc	a0,0x3
    80002408:	d9450513          	addi	a0,a0,-620 # 80005198 <_ZZ12printIntegermE6digits+0xe0>
    8000240c:	00000097          	auipc	ra,0x0
    80002410:	7ec080e7          	jalr	2028(ra) # 80002bf8 <__printf>
    80002414:	01013403          	ld	s0,16(sp)
    80002418:	01813083          	ld	ra,24(sp)
    8000241c:	00048513          	mv	a0,s1
    80002420:	00813483          	ld	s1,8(sp)
    80002424:	02010113          	addi	sp,sp,32
    80002428:	00000317          	auipc	t1,0x0
    8000242c:	3c430067          	jr	964(t1) # 800027ec <plic_complete>
    80002430:	00004517          	auipc	a0,0x4
    80002434:	5c050513          	addi	a0,a0,1472 # 800069f0 <tickslock>
    80002438:	00001097          	auipc	ra,0x1
    8000243c:	494080e7          	jalr	1172(ra) # 800038cc <acquire>
    80002440:	00003717          	auipc	a4,0x3
    80002444:	4cc70713          	addi	a4,a4,1228 # 8000590c <ticks>
    80002448:	00072783          	lw	a5,0(a4)
    8000244c:	00004517          	auipc	a0,0x4
    80002450:	5a450513          	addi	a0,a0,1444 # 800069f0 <tickslock>
    80002454:	0017879b          	addiw	a5,a5,1
    80002458:	00f72023          	sw	a5,0(a4)
    8000245c:	00001097          	auipc	ra,0x1
    80002460:	53c080e7          	jalr	1340(ra) # 80003998 <release>
    80002464:	f65ff06f          	j	800023c8 <kerneltrap+0x8c>
    80002468:	00001097          	auipc	ra,0x1
    8000246c:	098080e7          	jalr	152(ra) # 80003500 <uartintr>
    80002470:	fa5ff06f          	j	80002414 <kerneltrap+0xd8>
    80002474:	00003517          	auipc	a0,0x3
    80002478:	d0450513          	addi	a0,a0,-764 # 80005178 <_ZZ12printIntegermE6digits+0xc0>
    8000247c:	00000097          	auipc	ra,0x0
    80002480:	720080e7          	jalr	1824(ra) # 80002b9c <panic>

0000000080002484 <clockintr>:
    80002484:	fe010113          	addi	sp,sp,-32
    80002488:	00813823          	sd	s0,16(sp)
    8000248c:	00913423          	sd	s1,8(sp)
    80002490:	00113c23          	sd	ra,24(sp)
    80002494:	02010413          	addi	s0,sp,32
    80002498:	00004497          	auipc	s1,0x4
    8000249c:	55848493          	addi	s1,s1,1368 # 800069f0 <tickslock>
    800024a0:	00048513          	mv	a0,s1
    800024a4:	00001097          	auipc	ra,0x1
    800024a8:	428080e7          	jalr	1064(ra) # 800038cc <acquire>
    800024ac:	00003717          	auipc	a4,0x3
    800024b0:	46070713          	addi	a4,a4,1120 # 8000590c <ticks>
    800024b4:	00072783          	lw	a5,0(a4)
    800024b8:	01013403          	ld	s0,16(sp)
    800024bc:	01813083          	ld	ra,24(sp)
    800024c0:	00048513          	mv	a0,s1
    800024c4:	0017879b          	addiw	a5,a5,1
    800024c8:	00813483          	ld	s1,8(sp)
    800024cc:	00f72023          	sw	a5,0(a4)
    800024d0:	02010113          	addi	sp,sp,32
    800024d4:	00001317          	auipc	t1,0x1
    800024d8:	4c430067          	jr	1220(t1) # 80003998 <release>

00000000800024dc <devintr>:
    800024dc:	142027f3          	csrr	a5,scause
    800024e0:	00000513          	li	a0,0
    800024e4:	0007c463          	bltz	a5,800024ec <devintr+0x10>
    800024e8:	00008067          	ret
    800024ec:	fe010113          	addi	sp,sp,-32
    800024f0:	00813823          	sd	s0,16(sp)
    800024f4:	00113c23          	sd	ra,24(sp)
    800024f8:	00913423          	sd	s1,8(sp)
    800024fc:	02010413          	addi	s0,sp,32
    80002500:	0ff7f713          	andi	a4,a5,255
    80002504:	00900693          	li	a3,9
    80002508:	04d70c63          	beq	a4,a3,80002560 <devintr+0x84>
    8000250c:	fff00713          	li	a4,-1
    80002510:	03f71713          	slli	a4,a4,0x3f
    80002514:	00170713          	addi	a4,a4,1
    80002518:	00e78c63          	beq	a5,a4,80002530 <devintr+0x54>
    8000251c:	01813083          	ld	ra,24(sp)
    80002520:	01013403          	ld	s0,16(sp)
    80002524:	00813483          	ld	s1,8(sp)
    80002528:	02010113          	addi	sp,sp,32
    8000252c:	00008067          	ret
    80002530:	00000097          	auipc	ra,0x0
    80002534:	c8c080e7          	jalr	-884(ra) # 800021bc <cpuid>
    80002538:	06050663          	beqz	a0,800025a4 <devintr+0xc8>
    8000253c:	144027f3          	csrr	a5,sip
    80002540:	ffd7f793          	andi	a5,a5,-3
    80002544:	14479073          	csrw	sip,a5
    80002548:	01813083          	ld	ra,24(sp)
    8000254c:	01013403          	ld	s0,16(sp)
    80002550:	00813483          	ld	s1,8(sp)
    80002554:	00200513          	li	a0,2
    80002558:	02010113          	addi	sp,sp,32
    8000255c:	00008067          	ret
    80002560:	00000097          	auipc	ra,0x0
    80002564:	254080e7          	jalr	596(ra) # 800027b4 <plic_claim>
    80002568:	00a00793          	li	a5,10
    8000256c:	00050493          	mv	s1,a0
    80002570:	06f50663          	beq	a0,a5,800025dc <devintr+0x100>
    80002574:	00100513          	li	a0,1
    80002578:	fa0482e3          	beqz	s1,8000251c <devintr+0x40>
    8000257c:	00048593          	mv	a1,s1
    80002580:	00003517          	auipc	a0,0x3
    80002584:	c1850513          	addi	a0,a0,-1000 # 80005198 <_ZZ12printIntegermE6digits+0xe0>
    80002588:	00000097          	auipc	ra,0x0
    8000258c:	670080e7          	jalr	1648(ra) # 80002bf8 <__printf>
    80002590:	00048513          	mv	a0,s1
    80002594:	00000097          	auipc	ra,0x0
    80002598:	258080e7          	jalr	600(ra) # 800027ec <plic_complete>
    8000259c:	00100513          	li	a0,1
    800025a0:	f7dff06f          	j	8000251c <devintr+0x40>
    800025a4:	00004517          	auipc	a0,0x4
    800025a8:	44c50513          	addi	a0,a0,1100 # 800069f0 <tickslock>
    800025ac:	00001097          	auipc	ra,0x1
    800025b0:	320080e7          	jalr	800(ra) # 800038cc <acquire>
    800025b4:	00003717          	auipc	a4,0x3
    800025b8:	35870713          	addi	a4,a4,856 # 8000590c <ticks>
    800025bc:	00072783          	lw	a5,0(a4)
    800025c0:	00004517          	auipc	a0,0x4
    800025c4:	43050513          	addi	a0,a0,1072 # 800069f0 <tickslock>
    800025c8:	0017879b          	addiw	a5,a5,1
    800025cc:	00f72023          	sw	a5,0(a4)
    800025d0:	00001097          	auipc	ra,0x1
    800025d4:	3c8080e7          	jalr	968(ra) # 80003998 <release>
    800025d8:	f65ff06f          	j	8000253c <devintr+0x60>
    800025dc:	00001097          	auipc	ra,0x1
    800025e0:	f24080e7          	jalr	-220(ra) # 80003500 <uartintr>
    800025e4:	fadff06f          	j	80002590 <devintr+0xb4>
	...

00000000800025f0 <kernelvec>:
    800025f0:	f0010113          	addi	sp,sp,-256
    800025f4:	00113023          	sd	ra,0(sp)
    800025f8:	00213423          	sd	sp,8(sp)
    800025fc:	00313823          	sd	gp,16(sp)
    80002600:	00413c23          	sd	tp,24(sp)
    80002604:	02513023          	sd	t0,32(sp)
    80002608:	02613423          	sd	t1,40(sp)
    8000260c:	02713823          	sd	t2,48(sp)
    80002610:	02813c23          	sd	s0,56(sp)
    80002614:	04913023          	sd	s1,64(sp)
    80002618:	04a13423          	sd	a0,72(sp)
    8000261c:	04b13823          	sd	a1,80(sp)
    80002620:	04c13c23          	sd	a2,88(sp)
    80002624:	06d13023          	sd	a3,96(sp)
    80002628:	06e13423          	sd	a4,104(sp)
    8000262c:	06f13823          	sd	a5,112(sp)
    80002630:	07013c23          	sd	a6,120(sp)
    80002634:	09113023          	sd	a7,128(sp)
    80002638:	09213423          	sd	s2,136(sp)
    8000263c:	09313823          	sd	s3,144(sp)
    80002640:	09413c23          	sd	s4,152(sp)
    80002644:	0b513023          	sd	s5,160(sp)
    80002648:	0b613423          	sd	s6,168(sp)
    8000264c:	0b713823          	sd	s7,176(sp)
    80002650:	0b813c23          	sd	s8,184(sp)
    80002654:	0d913023          	sd	s9,192(sp)
    80002658:	0da13423          	sd	s10,200(sp)
    8000265c:	0db13823          	sd	s11,208(sp)
    80002660:	0dc13c23          	sd	t3,216(sp)
    80002664:	0fd13023          	sd	t4,224(sp)
    80002668:	0fe13423          	sd	t5,232(sp)
    8000266c:	0ff13823          	sd	t6,240(sp)
    80002670:	ccdff0ef          	jal	ra,8000233c <kerneltrap>
    80002674:	00013083          	ld	ra,0(sp)
    80002678:	00813103          	ld	sp,8(sp)
    8000267c:	01013183          	ld	gp,16(sp)
    80002680:	02013283          	ld	t0,32(sp)
    80002684:	02813303          	ld	t1,40(sp)
    80002688:	03013383          	ld	t2,48(sp)
    8000268c:	03813403          	ld	s0,56(sp)
    80002690:	04013483          	ld	s1,64(sp)
    80002694:	04813503          	ld	a0,72(sp)
    80002698:	05013583          	ld	a1,80(sp)
    8000269c:	05813603          	ld	a2,88(sp)
    800026a0:	06013683          	ld	a3,96(sp)
    800026a4:	06813703          	ld	a4,104(sp)
    800026a8:	07013783          	ld	a5,112(sp)
    800026ac:	07813803          	ld	a6,120(sp)
    800026b0:	08013883          	ld	a7,128(sp)
    800026b4:	08813903          	ld	s2,136(sp)
    800026b8:	09013983          	ld	s3,144(sp)
    800026bc:	09813a03          	ld	s4,152(sp)
    800026c0:	0a013a83          	ld	s5,160(sp)
    800026c4:	0a813b03          	ld	s6,168(sp)
    800026c8:	0b013b83          	ld	s7,176(sp)
    800026cc:	0b813c03          	ld	s8,184(sp)
    800026d0:	0c013c83          	ld	s9,192(sp)
    800026d4:	0c813d03          	ld	s10,200(sp)
    800026d8:	0d013d83          	ld	s11,208(sp)
    800026dc:	0d813e03          	ld	t3,216(sp)
    800026e0:	0e013e83          	ld	t4,224(sp)
    800026e4:	0e813f03          	ld	t5,232(sp)
    800026e8:	0f013f83          	ld	t6,240(sp)
    800026ec:	10010113          	addi	sp,sp,256
    800026f0:	10200073          	sret
    800026f4:	00000013          	nop
    800026f8:	00000013          	nop
    800026fc:	00000013          	nop

0000000080002700 <timervec>:
    80002700:	34051573          	csrrw	a0,mscratch,a0
    80002704:	00b53023          	sd	a1,0(a0)
    80002708:	00c53423          	sd	a2,8(a0)
    8000270c:	00d53823          	sd	a3,16(a0)
    80002710:	01853583          	ld	a1,24(a0)
    80002714:	02053603          	ld	a2,32(a0)
    80002718:	0005b683          	ld	a3,0(a1)
    8000271c:	00c686b3          	add	a3,a3,a2
    80002720:	00d5b023          	sd	a3,0(a1)
    80002724:	00200593          	li	a1,2
    80002728:	14459073          	csrw	sip,a1
    8000272c:	01053683          	ld	a3,16(a0)
    80002730:	00853603          	ld	a2,8(a0)
    80002734:	00053583          	ld	a1,0(a0)
    80002738:	34051573          	csrrw	a0,mscratch,a0
    8000273c:	30200073          	mret

0000000080002740 <plicinit>:
    80002740:	ff010113          	addi	sp,sp,-16
    80002744:	00813423          	sd	s0,8(sp)
    80002748:	01010413          	addi	s0,sp,16
    8000274c:	00813403          	ld	s0,8(sp)
    80002750:	0c0007b7          	lui	a5,0xc000
    80002754:	00100713          	li	a4,1
    80002758:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000275c:	00e7a223          	sw	a4,4(a5)
    80002760:	01010113          	addi	sp,sp,16
    80002764:	00008067          	ret

0000000080002768 <plicinithart>:
    80002768:	ff010113          	addi	sp,sp,-16
    8000276c:	00813023          	sd	s0,0(sp)
    80002770:	00113423          	sd	ra,8(sp)
    80002774:	01010413          	addi	s0,sp,16
    80002778:	00000097          	auipc	ra,0x0
    8000277c:	a44080e7          	jalr	-1468(ra) # 800021bc <cpuid>
    80002780:	0085171b          	slliw	a4,a0,0x8
    80002784:	0c0027b7          	lui	a5,0xc002
    80002788:	00e787b3          	add	a5,a5,a4
    8000278c:	40200713          	li	a4,1026
    80002790:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002794:	00813083          	ld	ra,8(sp)
    80002798:	00013403          	ld	s0,0(sp)
    8000279c:	00d5151b          	slliw	a0,a0,0xd
    800027a0:	0c2017b7          	lui	a5,0xc201
    800027a4:	00a78533          	add	a0,a5,a0
    800027a8:	00052023          	sw	zero,0(a0)
    800027ac:	01010113          	addi	sp,sp,16
    800027b0:	00008067          	ret

00000000800027b4 <plic_claim>:
    800027b4:	ff010113          	addi	sp,sp,-16
    800027b8:	00813023          	sd	s0,0(sp)
    800027bc:	00113423          	sd	ra,8(sp)
    800027c0:	01010413          	addi	s0,sp,16
    800027c4:	00000097          	auipc	ra,0x0
    800027c8:	9f8080e7          	jalr	-1544(ra) # 800021bc <cpuid>
    800027cc:	00813083          	ld	ra,8(sp)
    800027d0:	00013403          	ld	s0,0(sp)
    800027d4:	00d5151b          	slliw	a0,a0,0xd
    800027d8:	0c2017b7          	lui	a5,0xc201
    800027dc:	00a78533          	add	a0,a5,a0
    800027e0:	00452503          	lw	a0,4(a0)
    800027e4:	01010113          	addi	sp,sp,16
    800027e8:	00008067          	ret

00000000800027ec <plic_complete>:
    800027ec:	fe010113          	addi	sp,sp,-32
    800027f0:	00813823          	sd	s0,16(sp)
    800027f4:	00913423          	sd	s1,8(sp)
    800027f8:	00113c23          	sd	ra,24(sp)
    800027fc:	02010413          	addi	s0,sp,32
    80002800:	00050493          	mv	s1,a0
    80002804:	00000097          	auipc	ra,0x0
    80002808:	9b8080e7          	jalr	-1608(ra) # 800021bc <cpuid>
    8000280c:	01813083          	ld	ra,24(sp)
    80002810:	01013403          	ld	s0,16(sp)
    80002814:	00d5179b          	slliw	a5,a0,0xd
    80002818:	0c201737          	lui	a4,0xc201
    8000281c:	00f707b3          	add	a5,a4,a5
    80002820:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002824:	00813483          	ld	s1,8(sp)
    80002828:	02010113          	addi	sp,sp,32
    8000282c:	00008067          	ret

0000000080002830 <consolewrite>:
    80002830:	fb010113          	addi	sp,sp,-80
    80002834:	04813023          	sd	s0,64(sp)
    80002838:	04113423          	sd	ra,72(sp)
    8000283c:	02913c23          	sd	s1,56(sp)
    80002840:	03213823          	sd	s2,48(sp)
    80002844:	03313423          	sd	s3,40(sp)
    80002848:	03413023          	sd	s4,32(sp)
    8000284c:	01513c23          	sd	s5,24(sp)
    80002850:	05010413          	addi	s0,sp,80
    80002854:	06c05c63          	blez	a2,800028cc <consolewrite+0x9c>
    80002858:	00060993          	mv	s3,a2
    8000285c:	00050a13          	mv	s4,a0
    80002860:	00058493          	mv	s1,a1
    80002864:	00000913          	li	s2,0
    80002868:	fff00a93          	li	s5,-1
    8000286c:	01c0006f          	j	80002888 <consolewrite+0x58>
    80002870:	fbf44503          	lbu	a0,-65(s0)
    80002874:	0019091b          	addiw	s2,s2,1
    80002878:	00148493          	addi	s1,s1,1
    8000287c:	00001097          	auipc	ra,0x1
    80002880:	a9c080e7          	jalr	-1380(ra) # 80003318 <uartputc>
    80002884:	03298063          	beq	s3,s2,800028a4 <consolewrite+0x74>
    80002888:	00048613          	mv	a2,s1
    8000288c:	00100693          	li	a3,1
    80002890:	000a0593          	mv	a1,s4
    80002894:	fbf40513          	addi	a0,s0,-65
    80002898:	00000097          	auipc	ra,0x0
    8000289c:	9dc080e7          	jalr	-1572(ra) # 80002274 <either_copyin>
    800028a0:	fd5518e3          	bne	a0,s5,80002870 <consolewrite+0x40>
    800028a4:	04813083          	ld	ra,72(sp)
    800028a8:	04013403          	ld	s0,64(sp)
    800028ac:	03813483          	ld	s1,56(sp)
    800028b0:	02813983          	ld	s3,40(sp)
    800028b4:	02013a03          	ld	s4,32(sp)
    800028b8:	01813a83          	ld	s5,24(sp)
    800028bc:	00090513          	mv	a0,s2
    800028c0:	03013903          	ld	s2,48(sp)
    800028c4:	05010113          	addi	sp,sp,80
    800028c8:	00008067          	ret
    800028cc:	00000913          	li	s2,0
    800028d0:	fd5ff06f          	j	800028a4 <consolewrite+0x74>

00000000800028d4 <consoleread>:
    800028d4:	f9010113          	addi	sp,sp,-112
    800028d8:	06813023          	sd	s0,96(sp)
    800028dc:	04913c23          	sd	s1,88(sp)
    800028e0:	05213823          	sd	s2,80(sp)
    800028e4:	05313423          	sd	s3,72(sp)
    800028e8:	05413023          	sd	s4,64(sp)
    800028ec:	03513c23          	sd	s5,56(sp)
    800028f0:	03613823          	sd	s6,48(sp)
    800028f4:	03713423          	sd	s7,40(sp)
    800028f8:	03813023          	sd	s8,32(sp)
    800028fc:	06113423          	sd	ra,104(sp)
    80002900:	01913c23          	sd	s9,24(sp)
    80002904:	07010413          	addi	s0,sp,112
    80002908:	00060b93          	mv	s7,a2
    8000290c:	00050913          	mv	s2,a0
    80002910:	00058c13          	mv	s8,a1
    80002914:	00060b1b          	sext.w	s6,a2
    80002918:	00004497          	auipc	s1,0x4
    8000291c:	10048493          	addi	s1,s1,256 # 80006a18 <cons>
    80002920:	00400993          	li	s3,4
    80002924:	fff00a13          	li	s4,-1
    80002928:	00a00a93          	li	s5,10
    8000292c:	05705e63          	blez	s7,80002988 <consoleread+0xb4>
    80002930:	09c4a703          	lw	a4,156(s1)
    80002934:	0984a783          	lw	a5,152(s1)
    80002938:	0007071b          	sext.w	a4,a4
    8000293c:	08e78463          	beq	a5,a4,800029c4 <consoleread+0xf0>
    80002940:	07f7f713          	andi	a4,a5,127
    80002944:	00e48733          	add	a4,s1,a4
    80002948:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000294c:	0017869b          	addiw	a3,a5,1
    80002950:	08d4ac23          	sw	a3,152(s1)
    80002954:	00070c9b          	sext.w	s9,a4
    80002958:	0b370663          	beq	a4,s3,80002a04 <consoleread+0x130>
    8000295c:	00100693          	li	a3,1
    80002960:	f9f40613          	addi	a2,s0,-97
    80002964:	000c0593          	mv	a1,s8
    80002968:	00090513          	mv	a0,s2
    8000296c:	f8e40fa3          	sb	a4,-97(s0)
    80002970:	00000097          	auipc	ra,0x0
    80002974:	8b8080e7          	jalr	-1864(ra) # 80002228 <either_copyout>
    80002978:	01450863          	beq	a0,s4,80002988 <consoleread+0xb4>
    8000297c:	001c0c13          	addi	s8,s8,1
    80002980:	fffb8b9b          	addiw	s7,s7,-1
    80002984:	fb5c94e3          	bne	s9,s5,8000292c <consoleread+0x58>
    80002988:	000b851b          	sext.w	a0,s7
    8000298c:	06813083          	ld	ra,104(sp)
    80002990:	06013403          	ld	s0,96(sp)
    80002994:	05813483          	ld	s1,88(sp)
    80002998:	05013903          	ld	s2,80(sp)
    8000299c:	04813983          	ld	s3,72(sp)
    800029a0:	04013a03          	ld	s4,64(sp)
    800029a4:	03813a83          	ld	s5,56(sp)
    800029a8:	02813b83          	ld	s7,40(sp)
    800029ac:	02013c03          	ld	s8,32(sp)
    800029b0:	01813c83          	ld	s9,24(sp)
    800029b4:	40ab053b          	subw	a0,s6,a0
    800029b8:	03013b03          	ld	s6,48(sp)
    800029bc:	07010113          	addi	sp,sp,112
    800029c0:	00008067          	ret
    800029c4:	00001097          	auipc	ra,0x1
    800029c8:	1d8080e7          	jalr	472(ra) # 80003b9c <push_on>
    800029cc:	0984a703          	lw	a4,152(s1)
    800029d0:	09c4a783          	lw	a5,156(s1)
    800029d4:	0007879b          	sext.w	a5,a5
    800029d8:	fef70ce3          	beq	a4,a5,800029d0 <consoleread+0xfc>
    800029dc:	00001097          	auipc	ra,0x1
    800029e0:	234080e7          	jalr	564(ra) # 80003c10 <pop_on>
    800029e4:	0984a783          	lw	a5,152(s1)
    800029e8:	07f7f713          	andi	a4,a5,127
    800029ec:	00e48733          	add	a4,s1,a4
    800029f0:	01874703          	lbu	a4,24(a4)
    800029f4:	0017869b          	addiw	a3,a5,1
    800029f8:	08d4ac23          	sw	a3,152(s1)
    800029fc:	00070c9b          	sext.w	s9,a4
    80002a00:	f5371ee3          	bne	a4,s3,8000295c <consoleread+0x88>
    80002a04:	000b851b          	sext.w	a0,s7
    80002a08:	f96bf2e3          	bgeu	s7,s6,8000298c <consoleread+0xb8>
    80002a0c:	08f4ac23          	sw	a5,152(s1)
    80002a10:	f7dff06f          	j	8000298c <consoleread+0xb8>

0000000080002a14 <consputc>:
    80002a14:	10000793          	li	a5,256
    80002a18:	00f50663          	beq	a0,a5,80002a24 <consputc+0x10>
    80002a1c:	00001317          	auipc	t1,0x1
    80002a20:	9f430067          	jr	-1548(t1) # 80003410 <uartputc_sync>
    80002a24:	ff010113          	addi	sp,sp,-16
    80002a28:	00113423          	sd	ra,8(sp)
    80002a2c:	00813023          	sd	s0,0(sp)
    80002a30:	01010413          	addi	s0,sp,16
    80002a34:	00800513          	li	a0,8
    80002a38:	00001097          	auipc	ra,0x1
    80002a3c:	9d8080e7          	jalr	-1576(ra) # 80003410 <uartputc_sync>
    80002a40:	02000513          	li	a0,32
    80002a44:	00001097          	auipc	ra,0x1
    80002a48:	9cc080e7          	jalr	-1588(ra) # 80003410 <uartputc_sync>
    80002a4c:	00013403          	ld	s0,0(sp)
    80002a50:	00813083          	ld	ra,8(sp)
    80002a54:	00800513          	li	a0,8
    80002a58:	01010113          	addi	sp,sp,16
    80002a5c:	00001317          	auipc	t1,0x1
    80002a60:	9b430067          	jr	-1612(t1) # 80003410 <uartputc_sync>

0000000080002a64 <consoleintr>:
    80002a64:	fe010113          	addi	sp,sp,-32
    80002a68:	00813823          	sd	s0,16(sp)
    80002a6c:	00913423          	sd	s1,8(sp)
    80002a70:	01213023          	sd	s2,0(sp)
    80002a74:	00113c23          	sd	ra,24(sp)
    80002a78:	02010413          	addi	s0,sp,32
    80002a7c:	00004917          	auipc	s2,0x4
    80002a80:	f9c90913          	addi	s2,s2,-100 # 80006a18 <cons>
    80002a84:	00050493          	mv	s1,a0
    80002a88:	00090513          	mv	a0,s2
    80002a8c:	00001097          	auipc	ra,0x1
    80002a90:	e40080e7          	jalr	-448(ra) # 800038cc <acquire>
    80002a94:	02048c63          	beqz	s1,80002acc <consoleintr+0x68>
    80002a98:	0a092783          	lw	a5,160(s2)
    80002a9c:	09892703          	lw	a4,152(s2)
    80002aa0:	07f00693          	li	a3,127
    80002aa4:	40e7873b          	subw	a4,a5,a4
    80002aa8:	02e6e263          	bltu	a3,a4,80002acc <consoleintr+0x68>
    80002aac:	00d00713          	li	a4,13
    80002ab0:	04e48063          	beq	s1,a4,80002af0 <consoleintr+0x8c>
    80002ab4:	07f7f713          	andi	a4,a5,127
    80002ab8:	00e90733          	add	a4,s2,a4
    80002abc:	0017879b          	addiw	a5,a5,1
    80002ac0:	0af92023          	sw	a5,160(s2)
    80002ac4:	00970c23          	sb	s1,24(a4)
    80002ac8:	08f92e23          	sw	a5,156(s2)
    80002acc:	01013403          	ld	s0,16(sp)
    80002ad0:	01813083          	ld	ra,24(sp)
    80002ad4:	00813483          	ld	s1,8(sp)
    80002ad8:	00013903          	ld	s2,0(sp)
    80002adc:	00004517          	auipc	a0,0x4
    80002ae0:	f3c50513          	addi	a0,a0,-196 # 80006a18 <cons>
    80002ae4:	02010113          	addi	sp,sp,32
    80002ae8:	00001317          	auipc	t1,0x1
    80002aec:	eb030067          	jr	-336(t1) # 80003998 <release>
    80002af0:	00a00493          	li	s1,10
    80002af4:	fc1ff06f          	j	80002ab4 <consoleintr+0x50>

0000000080002af8 <consoleinit>:
    80002af8:	fe010113          	addi	sp,sp,-32
    80002afc:	00113c23          	sd	ra,24(sp)
    80002b00:	00813823          	sd	s0,16(sp)
    80002b04:	00913423          	sd	s1,8(sp)
    80002b08:	02010413          	addi	s0,sp,32
    80002b0c:	00004497          	auipc	s1,0x4
    80002b10:	f0c48493          	addi	s1,s1,-244 # 80006a18 <cons>
    80002b14:	00048513          	mv	a0,s1
    80002b18:	00002597          	auipc	a1,0x2
    80002b1c:	6d858593          	addi	a1,a1,1752 # 800051f0 <_ZZ12printIntegermE6digits+0x138>
    80002b20:	00001097          	auipc	ra,0x1
    80002b24:	d88080e7          	jalr	-632(ra) # 800038a8 <initlock>
    80002b28:	00000097          	auipc	ra,0x0
    80002b2c:	7ac080e7          	jalr	1964(ra) # 800032d4 <uartinit>
    80002b30:	01813083          	ld	ra,24(sp)
    80002b34:	01013403          	ld	s0,16(sp)
    80002b38:	00000797          	auipc	a5,0x0
    80002b3c:	d9c78793          	addi	a5,a5,-612 # 800028d4 <consoleread>
    80002b40:	0af4bc23          	sd	a5,184(s1)
    80002b44:	00000797          	auipc	a5,0x0
    80002b48:	cec78793          	addi	a5,a5,-788 # 80002830 <consolewrite>
    80002b4c:	0cf4b023          	sd	a5,192(s1)
    80002b50:	00813483          	ld	s1,8(sp)
    80002b54:	02010113          	addi	sp,sp,32
    80002b58:	00008067          	ret

0000000080002b5c <console_read>:
    80002b5c:	ff010113          	addi	sp,sp,-16
    80002b60:	00813423          	sd	s0,8(sp)
    80002b64:	01010413          	addi	s0,sp,16
    80002b68:	00813403          	ld	s0,8(sp)
    80002b6c:	00004317          	auipc	t1,0x4
    80002b70:	f6433303          	ld	t1,-156(t1) # 80006ad0 <devsw+0x10>
    80002b74:	01010113          	addi	sp,sp,16
    80002b78:	00030067          	jr	t1

0000000080002b7c <console_write>:
    80002b7c:	ff010113          	addi	sp,sp,-16
    80002b80:	00813423          	sd	s0,8(sp)
    80002b84:	01010413          	addi	s0,sp,16
    80002b88:	00813403          	ld	s0,8(sp)
    80002b8c:	00004317          	auipc	t1,0x4
    80002b90:	f4c33303          	ld	t1,-180(t1) # 80006ad8 <devsw+0x18>
    80002b94:	01010113          	addi	sp,sp,16
    80002b98:	00030067          	jr	t1

0000000080002b9c <panic>:
    80002b9c:	fe010113          	addi	sp,sp,-32
    80002ba0:	00113c23          	sd	ra,24(sp)
    80002ba4:	00813823          	sd	s0,16(sp)
    80002ba8:	00913423          	sd	s1,8(sp)
    80002bac:	02010413          	addi	s0,sp,32
    80002bb0:	00050493          	mv	s1,a0
    80002bb4:	00002517          	auipc	a0,0x2
    80002bb8:	64450513          	addi	a0,a0,1604 # 800051f8 <_ZZ12printIntegermE6digits+0x140>
    80002bbc:	00004797          	auipc	a5,0x4
    80002bc0:	fa07ae23          	sw	zero,-68(a5) # 80006b78 <pr+0x18>
    80002bc4:	00000097          	auipc	ra,0x0
    80002bc8:	034080e7          	jalr	52(ra) # 80002bf8 <__printf>
    80002bcc:	00048513          	mv	a0,s1
    80002bd0:	00000097          	auipc	ra,0x0
    80002bd4:	028080e7          	jalr	40(ra) # 80002bf8 <__printf>
    80002bd8:	00002517          	auipc	a0,0x2
    80002bdc:	4d850513          	addi	a0,a0,1240 # 800050b0 <CONSOLE_STATUS+0xa0>
    80002be0:	00000097          	auipc	ra,0x0
    80002be4:	018080e7          	jalr	24(ra) # 80002bf8 <__printf>
    80002be8:	00100793          	li	a5,1
    80002bec:	00003717          	auipc	a4,0x3
    80002bf0:	d2f72223          	sw	a5,-732(a4) # 80005910 <panicked>
    80002bf4:	0000006f          	j	80002bf4 <panic+0x58>

0000000080002bf8 <__printf>:
    80002bf8:	f3010113          	addi	sp,sp,-208
    80002bfc:	08813023          	sd	s0,128(sp)
    80002c00:	07313423          	sd	s3,104(sp)
    80002c04:	09010413          	addi	s0,sp,144
    80002c08:	05813023          	sd	s8,64(sp)
    80002c0c:	08113423          	sd	ra,136(sp)
    80002c10:	06913c23          	sd	s1,120(sp)
    80002c14:	07213823          	sd	s2,112(sp)
    80002c18:	07413023          	sd	s4,96(sp)
    80002c1c:	05513c23          	sd	s5,88(sp)
    80002c20:	05613823          	sd	s6,80(sp)
    80002c24:	05713423          	sd	s7,72(sp)
    80002c28:	03913c23          	sd	s9,56(sp)
    80002c2c:	03a13823          	sd	s10,48(sp)
    80002c30:	03b13423          	sd	s11,40(sp)
    80002c34:	00004317          	auipc	t1,0x4
    80002c38:	f2c30313          	addi	t1,t1,-212 # 80006b60 <pr>
    80002c3c:	01832c03          	lw	s8,24(t1)
    80002c40:	00b43423          	sd	a1,8(s0)
    80002c44:	00c43823          	sd	a2,16(s0)
    80002c48:	00d43c23          	sd	a3,24(s0)
    80002c4c:	02e43023          	sd	a4,32(s0)
    80002c50:	02f43423          	sd	a5,40(s0)
    80002c54:	03043823          	sd	a6,48(s0)
    80002c58:	03143c23          	sd	a7,56(s0)
    80002c5c:	00050993          	mv	s3,a0
    80002c60:	4a0c1663          	bnez	s8,8000310c <__printf+0x514>
    80002c64:	60098c63          	beqz	s3,8000327c <__printf+0x684>
    80002c68:	0009c503          	lbu	a0,0(s3)
    80002c6c:	00840793          	addi	a5,s0,8
    80002c70:	f6f43c23          	sd	a5,-136(s0)
    80002c74:	00000493          	li	s1,0
    80002c78:	22050063          	beqz	a0,80002e98 <__printf+0x2a0>
    80002c7c:	00002a37          	lui	s4,0x2
    80002c80:	00018ab7          	lui	s5,0x18
    80002c84:	000f4b37          	lui	s6,0xf4
    80002c88:	00989bb7          	lui	s7,0x989
    80002c8c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002c90:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002c94:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002c98:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002c9c:	00148c9b          	addiw	s9,s1,1
    80002ca0:	02500793          	li	a5,37
    80002ca4:	01998933          	add	s2,s3,s9
    80002ca8:	38f51263          	bne	a0,a5,8000302c <__printf+0x434>
    80002cac:	00094783          	lbu	a5,0(s2)
    80002cb0:	00078c9b          	sext.w	s9,a5
    80002cb4:	1e078263          	beqz	a5,80002e98 <__printf+0x2a0>
    80002cb8:	0024849b          	addiw	s1,s1,2
    80002cbc:	07000713          	li	a4,112
    80002cc0:	00998933          	add	s2,s3,s1
    80002cc4:	38e78a63          	beq	a5,a4,80003058 <__printf+0x460>
    80002cc8:	20f76863          	bltu	a4,a5,80002ed8 <__printf+0x2e0>
    80002ccc:	42a78863          	beq	a5,a0,800030fc <__printf+0x504>
    80002cd0:	06400713          	li	a4,100
    80002cd4:	40e79663          	bne	a5,a4,800030e0 <__printf+0x4e8>
    80002cd8:	f7843783          	ld	a5,-136(s0)
    80002cdc:	0007a603          	lw	a2,0(a5)
    80002ce0:	00878793          	addi	a5,a5,8
    80002ce4:	f6f43c23          	sd	a5,-136(s0)
    80002ce8:	42064a63          	bltz	a2,8000311c <__printf+0x524>
    80002cec:	00a00713          	li	a4,10
    80002cf0:	02e677bb          	remuw	a5,a2,a4
    80002cf4:	00002d97          	auipc	s11,0x2
    80002cf8:	52cd8d93          	addi	s11,s11,1324 # 80005220 <digits>
    80002cfc:	00900593          	li	a1,9
    80002d00:	0006051b          	sext.w	a0,a2
    80002d04:	00000c93          	li	s9,0
    80002d08:	02079793          	slli	a5,a5,0x20
    80002d0c:	0207d793          	srli	a5,a5,0x20
    80002d10:	00fd87b3          	add	a5,s11,a5
    80002d14:	0007c783          	lbu	a5,0(a5)
    80002d18:	02e656bb          	divuw	a3,a2,a4
    80002d1c:	f8f40023          	sb	a5,-128(s0)
    80002d20:	14c5d863          	bge	a1,a2,80002e70 <__printf+0x278>
    80002d24:	06300593          	li	a1,99
    80002d28:	00100c93          	li	s9,1
    80002d2c:	02e6f7bb          	remuw	a5,a3,a4
    80002d30:	02079793          	slli	a5,a5,0x20
    80002d34:	0207d793          	srli	a5,a5,0x20
    80002d38:	00fd87b3          	add	a5,s11,a5
    80002d3c:	0007c783          	lbu	a5,0(a5)
    80002d40:	02e6d73b          	divuw	a4,a3,a4
    80002d44:	f8f400a3          	sb	a5,-127(s0)
    80002d48:	12a5f463          	bgeu	a1,a0,80002e70 <__printf+0x278>
    80002d4c:	00a00693          	li	a3,10
    80002d50:	00900593          	li	a1,9
    80002d54:	02d777bb          	remuw	a5,a4,a3
    80002d58:	02079793          	slli	a5,a5,0x20
    80002d5c:	0207d793          	srli	a5,a5,0x20
    80002d60:	00fd87b3          	add	a5,s11,a5
    80002d64:	0007c503          	lbu	a0,0(a5)
    80002d68:	02d757bb          	divuw	a5,a4,a3
    80002d6c:	f8a40123          	sb	a0,-126(s0)
    80002d70:	48e5f263          	bgeu	a1,a4,800031f4 <__printf+0x5fc>
    80002d74:	06300513          	li	a0,99
    80002d78:	02d7f5bb          	remuw	a1,a5,a3
    80002d7c:	02059593          	slli	a1,a1,0x20
    80002d80:	0205d593          	srli	a1,a1,0x20
    80002d84:	00bd85b3          	add	a1,s11,a1
    80002d88:	0005c583          	lbu	a1,0(a1)
    80002d8c:	02d7d7bb          	divuw	a5,a5,a3
    80002d90:	f8b401a3          	sb	a1,-125(s0)
    80002d94:	48e57263          	bgeu	a0,a4,80003218 <__printf+0x620>
    80002d98:	3e700513          	li	a0,999
    80002d9c:	02d7f5bb          	remuw	a1,a5,a3
    80002da0:	02059593          	slli	a1,a1,0x20
    80002da4:	0205d593          	srli	a1,a1,0x20
    80002da8:	00bd85b3          	add	a1,s11,a1
    80002dac:	0005c583          	lbu	a1,0(a1)
    80002db0:	02d7d7bb          	divuw	a5,a5,a3
    80002db4:	f8b40223          	sb	a1,-124(s0)
    80002db8:	46e57663          	bgeu	a0,a4,80003224 <__printf+0x62c>
    80002dbc:	02d7f5bb          	remuw	a1,a5,a3
    80002dc0:	02059593          	slli	a1,a1,0x20
    80002dc4:	0205d593          	srli	a1,a1,0x20
    80002dc8:	00bd85b3          	add	a1,s11,a1
    80002dcc:	0005c583          	lbu	a1,0(a1)
    80002dd0:	02d7d7bb          	divuw	a5,a5,a3
    80002dd4:	f8b402a3          	sb	a1,-123(s0)
    80002dd8:	46ea7863          	bgeu	s4,a4,80003248 <__printf+0x650>
    80002ddc:	02d7f5bb          	remuw	a1,a5,a3
    80002de0:	02059593          	slli	a1,a1,0x20
    80002de4:	0205d593          	srli	a1,a1,0x20
    80002de8:	00bd85b3          	add	a1,s11,a1
    80002dec:	0005c583          	lbu	a1,0(a1)
    80002df0:	02d7d7bb          	divuw	a5,a5,a3
    80002df4:	f8b40323          	sb	a1,-122(s0)
    80002df8:	3eeaf863          	bgeu	s5,a4,800031e8 <__printf+0x5f0>
    80002dfc:	02d7f5bb          	remuw	a1,a5,a3
    80002e00:	02059593          	slli	a1,a1,0x20
    80002e04:	0205d593          	srli	a1,a1,0x20
    80002e08:	00bd85b3          	add	a1,s11,a1
    80002e0c:	0005c583          	lbu	a1,0(a1)
    80002e10:	02d7d7bb          	divuw	a5,a5,a3
    80002e14:	f8b403a3          	sb	a1,-121(s0)
    80002e18:	42eb7e63          	bgeu	s6,a4,80003254 <__printf+0x65c>
    80002e1c:	02d7f5bb          	remuw	a1,a5,a3
    80002e20:	02059593          	slli	a1,a1,0x20
    80002e24:	0205d593          	srli	a1,a1,0x20
    80002e28:	00bd85b3          	add	a1,s11,a1
    80002e2c:	0005c583          	lbu	a1,0(a1)
    80002e30:	02d7d7bb          	divuw	a5,a5,a3
    80002e34:	f8b40423          	sb	a1,-120(s0)
    80002e38:	42ebfc63          	bgeu	s7,a4,80003270 <__printf+0x678>
    80002e3c:	02079793          	slli	a5,a5,0x20
    80002e40:	0207d793          	srli	a5,a5,0x20
    80002e44:	00fd8db3          	add	s11,s11,a5
    80002e48:	000dc703          	lbu	a4,0(s11)
    80002e4c:	00a00793          	li	a5,10
    80002e50:	00900c93          	li	s9,9
    80002e54:	f8e404a3          	sb	a4,-119(s0)
    80002e58:	00065c63          	bgez	a2,80002e70 <__printf+0x278>
    80002e5c:	f9040713          	addi	a4,s0,-112
    80002e60:	00f70733          	add	a4,a4,a5
    80002e64:	02d00693          	li	a3,45
    80002e68:	fed70823          	sb	a3,-16(a4)
    80002e6c:	00078c93          	mv	s9,a5
    80002e70:	f8040793          	addi	a5,s0,-128
    80002e74:	01978cb3          	add	s9,a5,s9
    80002e78:	f7f40d13          	addi	s10,s0,-129
    80002e7c:	000cc503          	lbu	a0,0(s9)
    80002e80:	fffc8c93          	addi	s9,s9,-1
    80002e84:	00000097          	auipc	ra,0x0
    80002e88:	b90080e7          	jalr	-1136(ra) # 80002a14 <consputc>
    80002e8c:	ffac98e3          	bne	s9,s10,80002e7c <__printf+0x284>
    80002e90:	00094503          	lbu	a0,0(s2)
    80002e94:	e00514e3          	bnez	a0,80002c9c <__printf+0xa4>
    80002e98:	1a0c1663          	bnez	s8,80003044 <__printf+0x44c>
    80002e9c:	08813083          	ld	ra,136(sp)
    80002ea0:	08013403          	ld	s0,128(sp)
    80002ea4:	07813483          	ld	s1,120(sp)
    80002ea8:	07013903          	ld	s2,112(sp)
    80002eac:	06813983          	ld	s3,104(sp)
    80002eb0:	06013a03          	ld	s4,96(sp)
    80002eb4:	05813a83          	ld	s5,88(sp)
    80002eb8:	05013b03          	ld	s6,80(sp)
    80002ebc:	04813b83          	ld	s7,72(sp)
    80002ec0:	04013c03          	ld	s8,64(sp)
    80002ec4:	03813c83          	ld	s9,56(sp)
    80002ec8:	03013d03          	ld	s10,48(sp)
    80002ecc:	02813d83          	ld	s11,40(sp)
    80002ed0:	0d010113          	addi	sp,sp,208
    80002ed4:	00008067          	ret
    80002ed8:	07300713          	li	a4,115
    80002edc:	1ce78a63          	beq	a5,a4,800030b0 <__printf+0x4b8>
    80002ee0:	07800713          	li	a4,120
    80002ee4:	1ee79e63          	bne	a5,a4,800030e0 <__printf+0x4e8>
    80002ee8:	f7843783          	ld	a5,-136(s0)
    80002eec:	0007a703          	lw	a4,0(a5)
    80002ef0:	00878793          	addi	a5,a5,8
    80002ef4:	f6f43c23          	sd	a5,-136(s0)
    80002ef8:	28074263          	bltz	a4,8000317c <__printf+0x584>
    80002efc:	00002d97          	auipc	s11,0x2
    80002f00:	324d8d93          	addi	s11,s11,804 # 80005220 <digits>
    80002f04:	00f77793          	andi	a5,a4,15
    80002f08:	00fd87b3          	add	a5,s11,a5
    80002f0c:	0007c683          	lbu	a3,0(a5)
    80002f10:	00f00613          	li	a2,15
    80002f14:	0007079b          	sext.w	a5,a4
    80002f18:	f8d40023          	sb	a3,-128(s0)
    80002f1c:	0047559b          	srliw	a1,a4,0x4
    80002f20:	0047569b          	srliw	a3,a4,0x4
    80002f24:	00000c93          	li	s9,0
    80002f28:	0ee65063          	bge	a2,a4,80003008 <__printf+0x410>
    80002f2c:	00f6f693          	andi	a3,a3,15
    80002f30:	00dd86b3          	add	a3,s11,a3
    80002f34:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002f38:	0087d79b          	srliw	a5,a5,0x8
    80002f3c:	00100c93          	li	s9,1
    80002f40:	f8d400a3          	sb	a3,-127(s0)
    80002f44:	0cb67263          	bgeu	a2,a1,80003008 <__printf+0x410>
    80002f48:	00f7f693          	andi	a3,a5,15
    80002f4c:	00dd86b3          	add	a3,s11,a3
    80002f50:	0006c583          	lbu	a1,0(a3)
    80002f54:	00f00613          	li	a2,15
    80002f58:	0047d69b          	srliw	a3,a5,0x4
    80002f5c:	f8b40123          	sb	a1,-126(s0)
    80002f60:	0047d593          	srli	a1,a5,0x4
    80002f64:	28f67e63          	bgeu	a2,a5,80003200 <__printf+0x608>
    80002f68:	00f6f693          	andi	a3,a3,15
    80002f6c:	00dd86b3          	add	a3,s11,a3
    80002f70:	0006c503          	lbu	a0,0(a3)
    80002f74:	0087d813          	srli	a6,a5,0x8
    80002f78:	0087d69b          	srliw	a3,a5,0x8
    80002f7c:	f8a401a3          	sb	a0,-125(s0)
    80002f80:	28b67663          	bgeu	a2,a1,8000320c <__printf+0x614>
    80002f84:	00f6f693          	andi	a3,a3,15
    80002f88:	00dd86b3          	add	a3,s11,a3
    80002f8c:	0006c583          	lbu	a1,0(a3)
    80002f90:	00c7d513          	srli	a0,a5,0xc
    80002f94:	00c7d69b          	srliw	a3,a5,0xc
    80002f98:	f8b40223          	sb	a1,-124(s0)
    80002f9c:	29067a63          	bgeu	a2,a6,80003230 <__printf+0x638>
    80002fa0:	00f6f693          	andi	a3,a3,15
    80002fa4:	00dd86b3          	add	a3,s11,a3
    80002fa8:	0006c583          	lbu	a1,0(a3)
    80002fac:	0107d813          	srli	a6,a5,0x10
    80002fb0:	0107d69b          	srliw	a3,a5,0x10
    80002fb4:	f8b402a3          	sb	a1,-123(s0)
    80002fb8:	28a67263          	bgeu	a2,a0,8000323c <__printf+0x644>
    80002fbc:	00f6f693          	andi	a3,a3,15
    80002fc0:	00dd86b3          	add	a3,s11,a3
    80002fc4:	0006c683          	lbu	a3,0(a3)
    80002fc8:	0147d79b          	srliw	a5,a5,0x14
    80002fcc:	f8d40323          	sb	a3,-122(s0)
    80002fd0:	21067663          	bgeu	a2,a6,800031dc <__printf+0x5e4>
    80002fd4:	02079793          	slli	a5,a5,0x20
    80002fd8:	0207d793          	srli	a5,a5,0x20
    80002fdc:	00fd8db3          	add	s11,s11,a5
    80002fe0:	000dc683          	lbu	a3,0(s11)
    80002fe4:	00800793          	li	a5,8
    80002fe8:	00700c93          	li	s9,7
    80002fec:	f8d403a3          	sb	a3,-121(s0)
    80002ff0:	00075c63          	bgez	a4,80003008 <__printf+0x410>
    80002ff4:	f9040713          	addi	a4,s0,-112
    80002ff8:	00f70733          	add	a4,a4,a5
    80002ffc:	02d00693          	li	a3,45
    80003000:	fed70823          	sb	a3,-16(a4)
    80003004:	00078c93          	mv	s9,a5
    80003008:	f8040793          	addi	a5,s0,-128
    8000300c:	01978cb3          	add	s9,a5,s9
    80003010:	f7f40d13          	addi	s10,s0,-129
    80003014:	000cc503          	lbu	a0,0(s9)
    80003018:	fffc8c93          	addi	s9,s9,-1
    8000301c:	00000097          	auipc	ra,0x0
    80003020:	9f8080e7          	jalr	-1544(ra) # 80002a14 <consputc>
    80003024:	ff9d18e3          	bne	s10,s9,80003014 <__printf+0x41c>
    80003028:	0100006f          	j	80003038 <__printf+0x440>
    8000302c:	00000097          	auipc	ra,0x0
    80003030:	9e8080e7          	jalr	-1560(ra) # 80002a14 <consputc>
    80003034:	000c8493          	mv	s1,s9
    80003038:	00094503          	lbu	a0,0(s2)
    8000303c:	c60510e3          	bnez	a0,80002c9c <__printf+0xa4>
    80003040:	e40c0ee3          	beqz	s8,80002e9c <__printf+0x2a4>
    80003044:	00004517          	auipc	a0,0x4
    80003048:	b1c50513          	addi	a0,a0,-1252 # 80006b60 <pr>
    8000304c:	00001097          	auipc	ra,0x1
    80003050:	94c080e7          	jalr	-1716(ra) # 80003998 <release>
    80003054:	e49ff06f          	j	80002e9c <__printf+0x2a4>
    80003058:	f7843783          	ld	a5,-136(s0)
    8000305c:	03000513          	li	a0,48
    80003060:	01000d13          	li	s10,16
    80003064:	00878713          	addi	a4,a5,8
    80003068:	0007bc83          	ld	s9,0(a5)
    8000306c:	f6e43c23          	sd	a4,-136(s0)
    80003070:	00000097          	auipc	ra,0x0
    80003074:	9a4080e7          	jalr	-1628(ra) # 80002a14 <consputc>
    80003078:	07800513          	li	a0,120
    8000307c:	00000097          	auipc	ra,0x0
    80003080:	998080e7          	jalr	-1640(ra) # 80002a14 <consputc>
    80003084:	00002d97          	auipc	s11,0x2
    80003088:	19cd8d93          	addi	s11,s11,412 # 80005220 <digits>
    8000308c:	03ccd793          	srli	a5,s9,0x3c
    80003090:	00fd87b3          	add	a5,s11,a5
    80003094:	0007c503          	lbu	a0,0(a5)
    80003098:	fffd0d1b          	addiw	s10,s10,-1
    8000309c:	004c9c93          	slli	s9,s9,0x4
    800030a0:	00000097          	auipc	ra,0x0
    800030a4:	974080e7          	jalr	-1676(ra) # 80002a14 <consputc>
    800030a8:	fe0d12e3          	bnez	s10,8000308c <__printf+0x494>
    800030ac:	f8dff06f          	j	80003038 <__printf+0x440>
    800030b0:	f7843783          	ld	a5,-136(s0)
    800030b4:	0007bc83          	ld	s9,0(a5)
    800030b8:	00878793          	addi	a5,a5,8
    800030bc:	f6f43c23          	sd	a5,-136(s0)
    800030c0:	000c9a63          	bnez	s9,800030d4 <__printf+0x4dc>
    800030c4:	1080006f          	j	800031cc <__printf+0x5d4>
    800030c8:	001c8c93          	addi	s9,s9,1
    800030cc:	00000097          	auipc	ra,0x0
    800030d0:	948080e7          	jalr	-1720(ra) # 80002a14 <consputc>
    800030d4:	000cc503          	lbu	a0,0(s9)
    800030d8:	fe0518e3          	bnez	a0,800030c8 <__printf+0x4d0>
    800030dc:	f5dff06f          	j	80003038 <__printf+0x440>
    800030e0:	02500513          	li	a0,37
    800030e4:	00000097          	auipc	ra,0x0
    800030e8:	930080e7          	jalr	-1744(ra) # 80002a14 <consputc>
    800030ec:	000c8513          	mv	a0,s9
    800030f0:	00000097          	auipc	ra,0x0
    800030f4:	924080e7          	jalr	-1756(ra) # 80002a14 <consputc>
    800030f8:	f41ff06f          	j	80003038 <__printf+0x440>
    800030fc:	02500513          	li	a0,37
    80003100:	00000097          	auipc	ra,0x0
    80003104:	914080e7          	jalr	-1772(ra) # 80002a14 <consputc>
    80003108:	f31ff06f          	j	80003038 <__printf+0x440>
    8000310c:	00030513          	mv	a0,t1
    80003110:	00000097          	auipc	ra,0x0
    80003114:	7bc080e7          	jalr	1980(ra) # 800038cc <acquire>
    80003118:	b4dff06f          	j	80002c64 <__printf+0x6c>
    8000311c:	40c0053b          	negw	a0,a2
    80003120:	00a00713          	li	a4,10
    80003124:	02e576bb          	remuw	a3,a0,a4
    80003128:	00002d97          	auipc	s11,0x2
    8000312c:	0f8d8d93          	addi	s11,s11,248 # 80005220 <digits>
    80003130:	ff700593          	li	a1,-9
    80003134:	02069693          	slli	a3,a3,0x20
    80003138:	0206d693          	srli	a3,a3,0x20
    8000313c:	00dd86b3          	add	a3,s11,a3
    80003140:	0006c683          	lbu	a3,0(a3)
    80003144:	02e557bb          	divuw	a5,a0,a4
    80003148:	f8d40023          	sb	a3,-128(s0)
    8000314c:	10b65e63          	bge	a2,a1,80003268 <__printf+0x670>
    80003150:	06300593          	li	a1,99
    80003154:	02e7f6bb          	remuw	a3,a5,a4
    80003158:	02069693          	slli	a3,a3,0x20
    8000315c:	0206d693          	srli	a3,a3,0x20
    80003160:	00dd86b3          	add	a3,s11,a3
    80003164:	0006c683          	lbu	a3,0(a3)
    80003168:	02e7d73b          	divuw	a4,a5,a4
    8000316c:	00200793          	li	a5,2
    80003170:	f8d400a3          	sb	a3,-127(s0)
    80003174:	bca5ece3          	bltu	a1,a0,80002d4c <__printf+0x154>
    80003178:	ce5ff06f          	j	80002e5c <__printf+0x264>
    8000317c:	40e007bb          	negw	a5,a4
    80003180:	00002d97          	auipc	s11,0x2
    80003184:	0a0d8d93          	addi	s11,s11,160 # 80005220 <digits>
    80003188:	00f7f693          	andi	a3,a5,15
    8000318c:	00dd86b3          	add	a3,s11,a3
    80003190:	0006c583          	lbu	a1,0(a3)
    80003194:	ff100613          	li	a2,-15
    80003198:	0047d69b          	srliw	a3,a5,0x4
    8000319c:	f8b40023          	sb	a1,-128(s0)
    800031a0:	0047d59b          	srliw	a1,a5,0x4
    800031a4:	0ac75e63          	bge	a4,a2,80003260 <__printf+0x668>
    800031a8:	00f6f693          	andi	a3,a3,15
    800031ac:	00dd86b3          	add	a3,s11,a3
    800031b0:	0006c603          	lbu	a2,0(a3)
    800031b4:	00f00693          	li	a3,15
    800031b8:	0087d79b          	srliw	a5,a5,0x8
    800031bc:	f8c400a3          	sb	a2,-127(s0)
    800031c0:	d8b6e4e3          	bltu	a3,a1,80002f48 <__printf+0x350>
    800031c4:	00200793          	li	a5,2
    800031c8:	e2dff06f          	j	80002ff4 <__printf+0x3fc>
    800031cc:	00002c97          	auipc	s9,0x2
    800031d0:	034c8c93          	addi	s9,s9,52 # 80005200 <_ZZ12printIntegermE6digits+0x148>
    800031d4:	02800513          	li	a0,40
    800031d8:	ef1ff06f          	j	800030c8 <__printf+0x4d0>
    800031dc:	00700793          	li	a5,7
    800031e0:	00600c93          	li	s9,6
    800031e4:	e0dff06f          	j	80002ff0 <__printf+0x3f8>
    800031e8:	00700793          	li	a5,7
    800031ec:	00600c93          	li	s9,6
    800031f0:	c69ff06f          	j	80002e58 <__printf+0x260>
    800031f4:	00300793          	li	a5,3
    800031f8:	00200c93          	li	s9,2
    800031fc:	c5dff06f          	j	80002e58 <__printf+0x260>
    80003200:	00300793          	li	a5,3
    80003204:	00200c93          	li	s9,2
    80003208:	de9ff06f          	j	80002ff0 <__printf+0x3f8>
    8000320c:	00400793          	li	a5,4
    80003210:	00300c93          	li	s9,3
    80003214:	dddff06f          	j	80002ff0 <__printf+0x3f8>
    80003218:	00400793          	li	a5,4
    8000321c:	00300c93          	li	s9,3
    80003220:	c39ff06f          	j	80002e58 <__printf+0x260>
    80003224:	00500793          	li	a5,5
    80003228:	00400c93          	li	s9,4
    8000322c:	c2dff06f          	j	80002e58 <__printf+0x260>
    80003230:	00500793          	li	a5,5
    80003234:	00400c93          	li	s9,4
    80003238:	db9ff06f          	j	80002ff0 <__printf+0x3f8>
    8000323c:	00600793          	li	a5,6
    80003240:	00500c93          	li	s9,5
    80003244:	dadff06f          	j	80002ff0 <__printf+0x3f8>
    80003248:	00600793          	li	a5,6
    8000324c:	00500c93          	li	s9,5
    80003250:	c09ff06f          	j	80002e58 <__printf+0x260>
    80003254:	00800793          	li	a5,8
    80003258:	00700c93          	li	s9,7
    8000325c:	bfdff06f          	j	80002e58 <__printf+0x260>
    80003260:	00100793          	li	a5,1
    80003264:	d91ff06f          	j	80002ff4 <__printf+0x3fc>
    80003268:	00100793          	li	a5,1
    8000326c:	bf1ff06f          	j	80002e5c <__printf+0x264>
    80003270:	00900793          	li	a5,9
    80003274:	00800c93          	li	s9,8
    80003278:	be1ff06f          	j	80002e58 <__printf+0x260>
    8000327c:	00002517          	auipc	a0,0x2
    80003280:	f8c50513          	addi	a0,a0,-116 # 80005208 <_ZZ12printIntegermE6digits+0x150>
    80003284:	00000097          	auipc	ra,0x0
    80003288:	918080e7          	jalr	-1768(ra) # 80002b9c <panic>

000000008000328c <printfinit>:
    8000328c:	fe010113          	addi	sp,sp,-32
    80003290:	00813823          	sd	s0,16(sp)
    80003294:	00913423          	sd	s1,8(sp)
    80003298:	00113c23          	sd	ra,24(sp)
    8000329c:	02010413          	addi	s0,sp,32
    800032a0:	00004497          	auipc	s1,0x4
    800032a4:	8c048493          	addi	s1,s1,-1856 # 80006b60 <pr>
    800032a8:	00048513          	mv	a0,s1
    800032ac:	00002597          	auipc	a1,0x2
    800032b0:	f6c58593          	addi	a1,a1,-148 # 80005218 <_ZZ12printIntegermE6digits+0x160>
    800032b4:	00000097          	auipc	ra,0x0
    800032b8:	5f4080e7          	jalr	1524(ra) # 800038a8 <initlock>
    800032bc:	01813083          	ld	ra,24(sp)
    800032c0:	01013403          	ld	s0,16(sp)
    800032c4:	0004ac23          	sw	zero,24(s1)
    800032c8:	00813483          	ld	s1,8(sp)
    800032cc:	02010113          	addi	sp,sp,32
    800032d0:	00008067          	ret

00000000800032d4 <uartinit>:
    800032d4:	ff010113          	addi	sp,sp,-16
    800032d8:	00813423          	sd	s0,8(sp)
    800032dc:	01010413          	addi	s0,sp,16
    800032e0:	100007b7          	lui	a5,0x10000
    800032e4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800032e8:	f8000713          	li	a4,-128
    800032ec:	00e781a3          	sb	a4,3(a5)
    800032f0:	00300713          	li	a4,3
    800032f4:	00e78023          	sb	a4,0(a5)
    800032f8:	000780a3          	sb	zero,1(a5)
    800032fc:	00e781a3          	sb	a4,3(a5)
    80003300:	00700693          	li	a3,7
    80003304:	00d78123          	sb	a3,2(a5)
    80003308:	00e780a3          	sb	a4,1(a5)
    8000330c:	00813403          	ld	s0,8(sp)
    80003310:	01010113          	addi	sp,sp,16
    80003314:	00008067          	ret

0000000080003318 <uartputc>:
    80003318:	00002797          	auipc	a5,0x2
    8000331c:	5f87a783          	lw	a5,1528(a5) # 80005910 <panicked>
    80003320:	00078463          	beqz	a5,80003328 <uartputc+0x10>
    80003324:	0000006f          	j	80003324 <uartputc+0xc>
    80003328:	fd010113          	addi	sp,sp,-48
    8000332c:	02813023          	sd	s0,32(sp)
    80003330:	00913c23          	sd	s1,24(sp)
    80003334:	01213823          	sd	s2,16(sp)
    80003338:	01313423          	sd	s3,8(sp)
    8000333c:	02113423          	sd	ra,40(sp)
    80003340:	03010413          	addi	s0,sp,48
    80003344:	00002917          	auipc	s2,0x2
    80003348:	5d490913          	addi	s2,s2,1492 # 80005918 <uart_tx_r>
    8000334c:	00093783          	ld	a5,0(s2)
    80003350:	00002497          	auipc	s1,0x2
    80003354:	5d048493          	addi	s1,s1,1488 # 80005920 <uart_tx_w>
    80003358:	0004b703          	ld	a4,0(s1)
    8000335c:	02078693          	addi	a3,a5,32
    80003360:	00050993          	mv	s3,a0
    80003364:	02e69c63          	bne	a3,a4,8000339c <uartputc+0x84>
    80003368:	00001097          	auipc	ra,0x1
    8000336c:	834080e7          	jalr	-1996(ra) # 80003b9c <push_on>
    80003370:	00093783          	ld	a5,0(s2)
    80003374:	0004b703          	ld	a4,0(s1)
    80003378:	02078793          	addi	a5,a5,32
    8000337c:	00e79463          	bne	a5,a4,80003384 <uartputc+0x6c>
    80003380:	0000006f          	j	80003380 <uartputc+0x68>
    80003384:	00001097          	auipc	ra,0x1
    80003388:	88c080e7          	jalr	-1908(ra) # 80003c10 <pop_on>
    8000338c:	00093783          	ld	a5,0(s2)
    80003390:	0004b703          	ld	a4,0(s1)
    80003394:	02078693          	addi	a3,a5,32
    80003398:	fce688e3          	beq	a3,a4,80003368 <uartputc+0x50>
    8000339c:	01f77693          	andi	a3,a4,31
    800033a0:	00003597          	auipc	a1,0x3
    800033a4:	7e058593          	addi	a1,a1,2016 # 80006b80 <uart_tx_buf>
    800033a8:	00d586b3          	add	a3,a1,a3
    800033ac:	00170713          	addi	a4,a4,1
    800033b0:	01368023          	sb	s3,0(a3)
    800033b4:	00e4b023          	sd	a4,0(s1)
    800033b8:	10000637          	lui	a2,0x10000
    800033bc:	02f71063          	bne	a4,a5,800033dc <uartputc+0xc4>
    800033c0:	0340006f          	j	800033f4 <uartputc+0xdc>
    800033c4:	00074703          	lbu	a4,0(a4)
    800033c8:	00f93023          	sd	a5,0(s2)
    800033cc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800033d0:	00093783          	ld	a5,0(s2)
    800033d4:	0004b703          	ld	a4,0(s1)
    800033d8:	00f70e63          	beq	a4,a5,800033f4 <uartputc+0xdc>
    800033dc:	00564683          	lbu	a3,5(a2)
    800033e0:	01f7f713          	andi	a4,a5,31
    800033e4:	00e58733          	add	a4,a1,a4
    800033e8:	0206f693          	andi	a3,a3,32
    800033ec:	00178793          	addi	a5,a5,1
    800033f0:	fc069ae3          	bnez	a3,800033c4 <uartputc+0xac>
    800033f4:	02813083          	ld	ra,40(sp)
    800033f8:	02013403          	ld	s0,32(sp)
    800033fc:	01813483          	ld	s1,24(sp)
    80003400:	01013903          	ld	s2,16(sp)
    80003404:	00813983          	ld	s3,8(sp)
    80003408:	03010113          	addi	sp,sp,48
    8000340c:	00008067          	ret

0000000080003410 <uartputc_sync>:
    80003410:	ff010113          	addi	sp,sp,-16
    80003414:	00813423          	sd	s0,8(sp)
    80003418:	01010413          	addi	s0,sp,16
    8000341c:	00002717          	auipc	a4,0x2
    80003420:	4f472703          	lw	a4,1268(a4) # 80005910 <panicked>
    80003424:	02071663          	bnez	a4,80003450 <uartputc_sync+0x40>
    80003428:	00050793          	mv	a5,a0
    8000342c:	100006b7          	lui	a3,0x10000
    80003430:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003434:	02077713          	andi	a4,a4,32
    80003438:	fe070ce3          	beqz	a4,80003430 <uartputc_sync+0x20>
    8000343c:	0ff7f793          	andi	a5,a5,255
    80003440:	00f68023          	sb	a5,0(a3)
    80003444:	00813403          	ld	s0,8(sp)
    80003448:	01010113          	addi	sp,sp,16
    8000344c:	00008067          	ret
    80003450:	0000006f          	j	80003450 <uartputc_sync+0x40>

0000000080003454 <uartstart>:
    80003454:	ff010113          	addi	sp,sp,-16
    80003458:	00813423          	sd	s0,8(sp)
    8000345c:	01010413          	addi	s0,sp,16
    80003460:	00002617          	auipc	a2,0x2
    80003464:	4b860613          	addi	a2,a2,1208 # 80005918 <uart_tx_r>
    80003468:	00002517          	auipc	a0,0x2
    8000346c:	4b850513          	addi	a0,a0,1208 # 80005920 <uart_tx_w>
    80003470:	00063783          	ld	a5,0(a2)
    80003474:	00053703          	ld	a4,0(a0)
    80003478:	04f70263          	beq	a4,a5,800034bc <uartstart+0x68>
    8000347c:	100005b7          	lui	a1,0x10000
    80003480:	00003817          	auipc	a6,0x3
    80003484:	70080813          	addi	a6,a6,1792 # 80006b80 <uart_tx_buf>
    80003488:	01c0006f          	j	800034a4 <uartstart+0x50>
    8000348c:	0006c703          	lbu	a4,0(a3)
    80003490:	00f63023          	sd	a5,0(a2)
    80003494:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003498:	00063783          	ld	a5,0(a2)
    8000349c:	00053703          	ld	a4,0(a0)
    800034a0:	00f70e63          	beq	a4,a5,800034bc <uartstart+0x68>
    800034a4:	01f7f713          	andi	a4,a5,31
    800034a8:	00e806b3          	add	a3,a6,a4
    800034ac:	0055c703          	lbu	a4,5(a1)
    800034b0:	00178793          	addi	a5,a5,1
    800034b4:	02077713          	andi	a4,a4,32
    800034b8:	fc071ae3          	bnez	a4,8000348c <uartstart+0x38>
    800034bc:	00813403          	ld	s0,8(sp)
    800034c0:	01010113          	addi	sp,sp,16
    800034c4:	00008067          	ret

00000000800034c8 <uartgetc>:
    800034c8:	ff010113          	addi	sp,sp,-16
    800034cc:	00813423          	sd	s0,8(sp)
    800034d0:	01010413          	addi	s0,sp,16
    800034d4:	10000737          	lui	a4,0x10000
    800034d8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800034dc:	0017f793          	andi	a5,a5,1
    800034e0:	00078c63          	beqz	a5,800034f8 <uartgetc+0x30>
    800034e4:	00074503          	lbu	a0,0(a4)
    800034e8:	0ff57513          	andi	a0,a0,255
    800034ec:	00813403          	ld	s0,8(sp)
    800034f0:	01010113          	addi	sp,sp,16
    800034f4:	00008067          	ret
    800034f8:	fff00513          	li	a0,-1
    800034fc:	ff1ff06f          	j	800034ec <uartgetc+0x24>

0000000080003500 <uartintr>:
    80003500:	100007b7          	lui	a5,0x10000
    80003504:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003508:	0017f793          	andi	a5,a5,1
    8000350c:	0a078463          	beqz	a5,800035b4 <uartintr+0xb4>
    80003510:	fe010113          	addi	sp,sp,-32
    80003514:	00813823          	sd	s0,16(sp)
    80003518:	00913423          	sd	s1,8(sp)
    8000351c:	00113c23          	sd	ra,24(sp)
    80003520:	02010413          	addi	s0,sp,32
    80003524:	100004b7          	lui	s1,0x10000
    80003528:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000352c:	0ff57513          	andi	a0,a0,255
    80003530:	fffff097          	auipc	ra,0xfffff
    80003534:	534080e7          	jalr	1332(ra) # 80002a64 <consoleintr>
    80003538:	0054c783          	lbu	a5,5(s1)
    8000353c:	0017f793          	andi	a5,a5,1
    80003540:	fe0794e3          	bnez	a5,80003528 <uartintr+0x28>
    80003544:	00002617          	auipc	a2,0x2
    80003548:	3d460613          	addi	a2,a2,980 # 80005918 <uart_tx_r>
    8000354c:	00002517          	auipc	a0,0x2
    80003550:	3d450513          	addi	a0,a0,980 # 80005920 <uart_tx_w>
    80003554:	00063783          	ld	a5,0(a2)
    80003558:	00053703          	ld	a4,0(a0)
    8000355c:	04f70263          	beq	a4,a5,800035a0 <uartintr+0xa0>
    80003560:	100005b7          	lui	a1,0x10000
    80003564:	00003817          	auipc	a6,0x3
    80003568:	61c80813          	addi	a6,a6,1564 # 80006b80 <uart_tx_buf>
    8000356c:	01c0006f          	j	80003588 <uartintr+0x88>
    80003570:	0006c703          	lbu	a4,0(a3)
    80003574:	00f63023          	sd	a5,0(a2)
    80003578:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000357c:	00063783          	ld	a5,0(a2)
    80003580:	00053703          	ld	a4,0(a0)
    80003584:	00f70e63          	beq	a4,a5,800035a0 <uartintr+0xa0>
    80003588:	01f7f713          	andi	a4,a5,31
    8000358c:	00e806b3          	add	a3,a6,a4
    80003590:	0055c703          	lbu	a4,5(a1)
    80003594:	00178793          	addi	a5,a5,1
    80003598:	02077713          	andi	a4,a4,32
    8000359c:	fc071ae3          	bnez	a4,80003570 <uartintr+0x70>
    800035a0:	01813083          	ld	ra,24(sp)
    800035a4:	01013403          	ld	s0,16(sp)
    800035a8:	00813483          	ld	s1,8(sp)
    800035ac:	02010113          	addi	sp,sp,32
    800035b0:	00008067          	ret
    800035b4:	00002617          	auipc	a2,0x2
    800035b8:	36460613          	addi	a2,a2,868 # 80005918 <uart_tx_r>
    800035bc:	00002517          	auipc	a0,0x2
    800035c0:	36450513          	addi	a0,a0,868 # 80005920 <uart_tx_w>
    800035c4:	00063783          	ld	a5,0(a2)
    800035c8:	00053703          	ld	a4,0(a0)
    800035cc:	04f70263          	beq	a4,a5,80003610 <uartintr+0x110>
    800035d0:	100005b7          	lui	a1,0x10000
    800035d4:	00003817          	auipc	a6,0x3
    800035d8:	5ac80813          	addi	a6,a6,1452 # 80006b80 <uart_tx_buf>
    800035dc:	01c0006f          	j	800035f8 <uartintr+0xf8>
    800035e0:	0006c703          	lbu	a4,0(a3)
    800035e4:	00f63023          	sd	a5,0(a2)
    800035e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800035ec:	00063783          	ld	a5,0(a2)
    800035f0:	00053703          	ld	a4,0(a0)
    800035f4:	02f70063          	beq	a4,a5,80003614 <uartintr+0x114>
    800035f8:	01f7f713          	andi	a4,a5,31
    800035fc:	00e806b3          	add	a3,a6,a4
    80003600:	0055c703          	lbu	a4,5(a1)
    80003604:	00178793          	addi	a5,a5,1
    80003608:	02077713          	andi	a4,a4,32
    8000360c:	fc071ae3          	bnez	a4,800035e0 <uartintr+0xe0>
    80003610:	00008067          	ret
    80003614:	00008067          	ret

0000000080003618 <kinit>:
    80003618:	fc010113          	addi	sp,sp,-64
    8000361c:	02913423          	sd	s1,40(sp)
    80003620:	fffff7b7          	lui	a5,0xfffff
    80003624:	00004497          	auipc	s1,0x4
    80003628:	57b48493          	addi	s1,s1,1403 # 80007b9f <end+0xfff>
    8000362c:	02813823          	sd	s0,48(sp)
    80003630:	01313c23          	sd	s3,24(sp)
    80003634:	00f4f4b3          	and	s1,s1,a5
    80003638:	02113c23          	sd	ra,56(sp)
    8000363c:	03213023          	sd	s2,32(sp)
    80003640:	01413823          	sd	s4,16(sp)
    80003644:	01513423          	sd	s5,8(sp)
    80003648:	04010413          	addi	s0,sp,64
    8000364c:	000017b7          	lui	a5,0x1
    80003650:	01100993          	li	s3,17
    80003654:	00f487b3          	add	a5,s1,a5
    80003658:	01b99993          	slli	s3,s3,0x1b
    8000365c:	06f9e063          	bltu	s3,a5,800036bc <kinit+0xa4>
    80003660:	00003a97          	auipc	s5,0x3
    80003664:	540a8a93          	addi	s5,s5,1344 # 80006ba0 <end>
    80003668:	0754ec63          	bltu	s1,s5,800036e0 <kinit+0xc8>
    8000366c:	0734fa63          	bgeu	s1,s3,800036e0 <kinit+0xc8>
    80003670:	00088a37          	lui	s4,0x88
    80003674:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003678:	00002917          	auipc	s2,0x2
    8000367c:	2b090913          	addi	s2,s2,688 # 80005928 <kmem>
    80003680:	00ca1a13          	slli	s4,s4,0xc
    80003684:	0140006f          	j	80003698 <kinit+0x80>
    80003688:	000017b7          	lui	a5,0x1
    8000368c:	00f484b3          	add	s1,s1,a5
    80003690:	0554e863          	bltu	s1,s5,800036e0 <kinit+0xc8>
    80003694:	0534f663          	bgeu	s1,s3,800036e0 <kinit+0xc8>
    80003698:	00001637          	lui	a2,0x1
    8000369c:	00100593          	li	a1,1
    800036a0:	00048513          	mv	a0,s1
    800036a4:	00000097          	auipc	ra,0x0
    800036a8:	5e4080e7          	jalr	1508(ra) # 80003c88 <__memset>
    800036ac:	00093783          	ld	a5,0(s2)
    800036b0:	00f4b023          	sd	a5,0(s1)
    800036b4:	00993023          	sd	s1,0(s2)
    800036b8:	fd4498e3          	bne	s1,s4,80003688 <kinit+0x70>
    800036bc:	03813083          	ld	ra,56(sp)
    800036c0:	03013403          	ld	s0,48(sp)
    800036c4:	02813483          	ld	s1,40(sp)
    800036c8:	02013903          	ld	s2,32(sp)
    800036cc:	01813983          	ld	s3,24(sp)
    800036d0:	01013a03          	ld	s4,16(sp)
    800036d4:	00813a83          	ld	s5,8(sp)
    800036d8:	04010113          	addi	sp,sp,64
    800036dc:	00008067          	ret
    800036e0:	00002517          	auipc	a0,0x2
    800036e4:	b5850513          	addi	a0,a0,-1192 # 80005238 <digits+0x18>
    800036e8:	fffff097          	auipc	ra,0xfffff
    800036ec:	4b4080e7          	jalr	1204(ra) # 80002b9c <panic>

00000000800036f0 <freerange>:
    800036f0:	fc010113          	addi	sp,sp,-64
    800036f4:	000017b7          	lui	a5,0x1
    800036f8:	02913423          	sd	s1,40(sp)
    800036fc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003700:	009504b3          	add	s1,a0,s1
    80003704:	fffff537          	lui	a0,0xfffff
    80003708:	02813823          	sd	s0,48(sp)
    8000370c:	02113c23          	sd	ra,56(sp)
    80003710:	03213023          	sd	s2,32(sp)
    80003714:	01313c23          	sd	s3,24(sp)
    80003718:	01413823          	sd	s4,16(sp)
    8000371c:	01513423          	sd	s5,8(sp)
    80003720:	01613023          	sd	s6,0(sp)
    80003724:	04010413          	addi	s0,sp,64
    80003728:	00a4f4b3          	and	s1,s1,a0
    8000372c:	00f487b3          	add	a5,s1,a5
    80003730:	06f5e463          	bltu	a1,a5,80003798 <freerange+0xa8>
    80003734:	00003a97          	auipc	s5,0x3
    80003738:	46ca8a93          	addi	s5,s5,1132 # 80006ba0 <end>
    8000373c:	0954e263          	bltu	s1,s5,800037c0 <freerange+0xd0>
    80003740:	01100993          	li	s3,17
    80003744:	01b99993          	slli	s3,s3,0x1b
    80003748:	0734fc63          	bgeu	s1,s3,800037c0 <freerange+0xd0>
    8000374c:	00058a13          	mv	s4,a1
    80003750:	00002917          	auipc	s2,0x2
    80003754:	1d890913          	addi	s2,s2,472 # 80005928 <kmem>
    80003758:	00002b37          	lui	s6,0x2
    8000375c:	0140006f          	j	80003770 <freerange+0x80>
    80003760:	000017b7          	lui	a5,0x1
    80003764:	00f484b3          	add	s1,s1,a5
    80003768:	0554ec63          	bltu	s1,s5,800037c0 <freerange+0xd0>
    8000376c:	0534fa63          	bgeu	s1,s3,800037c0 <freerange+0xd0>
    80003770:	00001637          	lui	a2,0x1
    80003774:	00100593          	li	a1,1
    80003778:	00048513          	mv	a0,s1
    8000377c:	00000097          	auipc	ra,0x0
    80003780:	50c080e7          	jalr	1292(ra) # 80003c88 <__memset>
    80003784:	00093703          	ld	a4,0(s2)
    80003788:	016487b3          	add	a5,s1,s6
    8000378c:	00e4b023          	sd	a4,0(s1)
    80003790:	00993023          	sd	s1,0(s2)
    80003794:	fcfa76e3          	bgeu	s4,a5,80003760 <freerange+0x70>
    80003798:	03813083          	ld	ra,56(sp)
    8000379c:	03013403          	ld	s0,48(sp)
    800037a0:	02813483          	ld	s1,40(sp)
    800037a4:	02013903          	ld	s2,32(sp)
    800037a8:	01813983          	ld	s3,24(sp)
    800037ac:	01013a03          	ld	s4,16(sp)
    800037b0:	00813a83          	ld	s5,8(sp)
    800037b4:	00013b03          	ld	s6,0(sp)
    800037b8:	04010113          	addi	sp,sp,64
    800037bc:	00008067          	ret
    800037c0:	00002517          	auipc	a0,0x2
    800037c4:	a7850513          	addi	a0,a0,-1416 # 80005238 <digits+0x18>
    800037c8:	fffff097          	auipc	ra,0xfffff
    800037cc:	3d4080e7          	jalr	980(ra) # 80002b9c <panic>

00000000800037d0 <kfree>:
    800037d0:	fe010113          	addi	sp,sp,-32
    800037d4:	00813823          	sd	s0,16(sp)
    800037d8:	00113c23          	sd	ra,24(sp)
    800037dc:	00913423          	sd	s1,8(sp)
    800037e0:	02010413          	addi	s0,sp,32
    800037e4:	03451793          	slli	a5,a0,0x34
    800037e8:	04079c63          	bnez	a5,80003840 <kfree+0x70>
    800037ec:	00003797          	auipc	a5,0x3
    800037f0:	3b478793          	addi	a5,a5,948 # 80006ba0 <end>
    800037f4:	00050493          	mv	s1,a0
    800037f8:	04f56463          	bltu	a0,a5,80003840 <kfree+0x70>
    800037fc:	01100793          	li	a5,17
    80003800:	01b79793          	slli	a5,a5,0x1b
    80003804:	02f57e63          	bgeu	a0,a5,80003840 <kfree+0x70>
    80003808:	00001637          	lui	a2,0x1
    8000380c:	00100593          	li	a1,1
    80003810:	00000097          	auipc	ra,0x0
    80003814:	478080e7          	jalr	1144(ra) # 80003c88 <__memset>
    80003818:	00002797          	auipc	a5,0x2
    8000381c:	11078793          	addi	a5,a5,272 # 80005928 <kmem>
    80003820:	0007b703          	ld	a4,0(a5)
    80003824:	01813083          	ld	ra,24(sp)
    80003828:	01013403          	ld	s0,16(sp)
    8000382c:	00e4b023          	sd	a4,0(s1)
    80003830:	0097b023          	sd	s1,0(a5)
    80003834:	00813483          	ld	s1,8(sp)
    80003838:	02010113          	addi	sp,sp,32
    8000383c:	00008067          	ret
    80003840:	00002517          	auipc	a0,0x2
    80003844:	9f850513          	addi	a0,a0,-1544 # 80005238 <digits+0x18>
    80003848:	fffff097          	auipc	ra,0xfffff
    8000384c:	354080e7          	jalr	852(ra) # 80002b9c <panic>

0000000080003850 <kalloc>:
    80003850:	fe010113          	addi	sp,sp,-32
    80003854:	00813823          	sd	s0,16(sp)
    80003858:	00913423          	sd	s1,8(sp)
    8000385c:	00113c23          	sd	ra,24(sp)
    80003860:	02010413          	addi	s0,sp,32
    80003864:	00002797          	auipc	a5,0x2
    80003868:	0c478793          	addi	a5,a5,196 # 80005928 <kmem>
    8000386c:	0007b483          	ld	s1,0(a5)
    80003870:	02048063          	beqz	s1,80003890 <kalloc+0x40>
    80003874:	0004b703          	ld	a4,0(s1)
    80003878:	00001637          	lui	a2,0x1
    8000387c:	00500593          	li	a1,5
    80003880:	00048513          	mv	a0,s1
    80003884:	00e7b023          	sd	a4,0(a5)
    80003888:	00000097          	auipc	ra,0x0
    8000388c:	400080e7          	jalr	1024(ra) # 80003c88 <__memset>
    80003890:	01813083          	ld	ra,24(sp)
    80003894:	01013403          	ld	s0,16(sp)
    80003898:	00048513          	mv	a0,s1
    8000389c:	00813483          	ld	s1,8(sp)
    800038a0:	02010113          	addi	sp,sp,32
    800038a4:	00008067          	ret

00000000800038a8 <initlock>:
    800038a8:	ff010113          	addi	sp,sp,-16
    800038ac:	00813423          	sd	s0,8(sp)
    800038b0:	01010413          	addi	s0,sp,16
    800038b4:	00813403          	ld	s0,8(sp)
    800038b8:	00b53423          	sd	a1,8(a0)
    800038bc:	00052023          	sw	zero,0(a0)
    800038c0:	00053823          	sd	zero,16(a0)
    800038c4:	01010113          	addi	sp,sp,16
    800038c8:	00008067          	ret

00000000800038cc <acquire>:
    800038cc:	fe010113          	addi	sp,sp,-32
    800038d0:	00813823          	sd	s0,16(sp)
    800038d4:	00913423          	sd	s1,8(sp)
    800038d8:	00113c23          	sd	ra,24(sp)
    800038dc:	01213023          	sd	s2,0(sp)
    800038e0:	02010413          	addi	s0,sp,32
    800038e4:	00050493          	mv	s1,a0
    800038e8:	10002973          	csrr	s2,sstatus
    800038ec:	100027f3          	csrr	a5,sstatus
    800038f0:	ffd7f793          	andi	a5,a5,-3
    800038f4:	10079073          	csrw	sstatus,a5
    800038f8:	fffff097          	auipc	ra,0xfffff
    800038fc:	8e4080e7          	jalr	-1820(ra) # 800021dc <mycpu>
    80003900:	07852783          	lw	a5,120(a0)
    80003904:	06078e63          	beqz	a5,80003980 <acquire+0xb4>
    80003908:	fffff097          	auipc	ra,0xfffff
    8000390c:	8d4080e7          	jalr	-1836(ra) # 800021dc <mycpu>
    80003910:	07852783          	lw	a5,120(a0)
    80003914:	0004a703          	lw	a4,0(s1)
    80003918:	0017879b          	addiw	a5,a5,1
    8000391c:	06f52c23          	sw	a5,120(a0)
    80003920:	04071063          	bnez	a4,80003960 <acquire+0x94>
    80003924:	00100713          	li	a4,1
    80003928:	00070793          	mv	a5,a4
    8000392c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003930:	0007879b          	sext.w	a5,a5
    80003934:	fe079ae3          	bnez	a5,80003928 <acquire+0x5c>
    80003938:	0ff0000f          	fence
    8000393c:	fffff097          	auipc	ra,0xfffff
    80003940:	8a0080e7          	jalr	-1888(ra) # 800021dc <mycpu>
    80003944:	01813083          	ld	ra,24(sp)
    80003948:	01013403          	ld	s0,16(sp)
    8000394c:	00a4b823          	sd	a0,16(s1)
    80003950:	00013903          	ld	s2,0(sp)
    80003954:	00813483          	ld	s1,8(sp)
    80003958:	02010113          	addi	sp,sp,32
    8000395c:	00008067          	ret
    80003960:	0104b903          	ld	s2,16(s1)
    80003964:	fffff097          	auipc	ra,0xfffff
    80003968:	878080e7          	jalr	-1928(ra) # 800021dc <mycpu>
    8000396c:	faa91ce3          	bne	s2,a0,80003924 <acquire+0x58>
    80003970:	00002517          	auipc	a0,0x2
    80003974:	8d050513          	addi	a0,a0,-1840 # 80005240 <digits+0x20>
    80003978:	fffff097          	auipc	ra,0xfffff
    8000397c:	224080e7          	jalr	548(ra) # 80002b9c <panic>
    80003980:	00195913          	srli	s2,s2,0x1
    80003984:	fffff097          	auipc	ra,0xfffff
    80003988:	858080e7          	jalr	-1960(ra) # 800021dc <mycpu>
    8000398c:	00197913          	andi	s2,s2,1
    80003990:	07252e23          	sw	s2,124(a0)
    80003994:	f75ff06f          	j	80003908 <acquire+0x3c>

0000000080003998 <release>:
    80003998:	fe010113          	addi	sp,sp,-32
    8000399c:	00813823          	sd	s0,16(sp)
    800039a0:	00113c23          	sd	ra,24(sp)
    800039a4:	00913423          	sd	s1,8(sp)
    800039a8:	01213023          	sd	s2,0(sp)
    800039ac:	02010413          	addi	s0,sp,32
    800039b0:	00052783          	lw	a5,0(a0)
    800039b4:	00079a63          	bnez	a5,800039c8 <release+0x30>
    800039b8:	00002517          	auipc	a0,0x2
    800039bc:	89050513          	addi	a0,a0,-1904 # 80005248 <digits+0x28>
    800039c0:	fffff097          	auipc	ra,0xfffff
    800039c4:	1dc080e7          	jalr	476(ra) # 80002b9c <panic>
    800039c8:	01053903          	ld	s2,16(a0)
    800039cc:	00050493          	mv	s1,a0
    800039d0:	fffff097          	auipc	ra,0xfffff
    800039d4:	80c080e7          	jalr	-2036(ra) # 800021dc <mycpu>
    800039d8:	fea910e3          	bne	s2,a0,800039b8 <release+0x20>
    800039dc:	0004b823          	sd	zero,16(s1)
    800039e0:	0ff0000f          	fence
    800039e4:	0f50000f          	fence	iorw,ow
    800039e8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800039ec:	ffffe097          	auipc	ra,0xffffe
    800039f0:	7f0080e7          	jalr	2032(ra) # 800021dc <mycpu>
    800039f4:	100027f3          	csrr	a5,sstatus
    800039f8:	0027f793          	andi	a5,a5,2
    800039fc:	04079a63          	bnez	a5,80003a50 <release+0xb8>
    80003a00:	07852783          	lw	a5,120(a0)
    80003a04:	02f05e63          	blez	a5,80003a40 <release+0xa8>
    80003a08:	fff7871b          	addiw	a4,a5,-1
    80003a0c:	06e52c23          	sw	a4,120(a0)
    80003a10:	00071c63          	bnez	a4,80003a28 <release+0x90>
    80003a14:	07c52783          	lw	a5,124(a0)
    80003a18:	00078863          	beqz	a5,80003a28 <release+0x90>
    80003a1c:	100027f3          	csrr	a5,sstatus
    80003a20:	0027e793          	ori	a5,a5,2
    80003a24:	10079073          	csrw	sstatus,a5
    80003a28:	01813083          	ld	ra,24(sp)
    80003a2c:	01013403          	ld	s0,16(sp)
    80003a30:	00813483          	ld	s1,8(sp)
    80003a34:	00013903          	ld	s2,0(sp)
    80003a38:	02010113          	addi	sp,sp,32
    80003a3c:	00008067          	ret
    80003a40:	00002517          	auipc	a0,0x2
    80003a44:	82850513          	addi	a0,a0,-2008 # 80005268 <digits+0x48>
    80003a48:	fffff097          	auipc	ra,0xfffff
    80003a4c:	154080e7          	jalr	340(ra) # 80002b9c <panic>
    80003a50:	00002517          	auipc	a0,0x2
    80003a54:	80050513          	addi	a0,a0,-2048 # 80005250 <digits+0x30>
    80003a58:	fffff097          	auipc	ra,0xfffff
    80003a5c:	144080e7          	jalr	324(ra) # 80002b9c <panic>

0000000080003a60 <holding>:
    80003a60:	00052783          	lw	a5,0(a0)
    80003a64:	00079663          	bnez	a5,80003a70 <holding+0x10>
    80003a68:	00000513          	li	a0,0
    80003a6c:	00008067          	ret
    80003a70:	fe010113          	addi	sp,sp,-32
    80003a74:	00813823          	sd	s0,16(sp)
    80003a78:	00913423          	sd	s1,8(sp)
    80003a7c:	00113c23          	sd	ra,24(sp)
    80003a80:	02010413          	addi	s0,sp,32
    80003a84:	01053483          	ld	s1,16(a0)
    80003a88:	ffffe097          	auipc	ra,0xffffe
    80003a8c:	754080e7          	jalr	1876(ra) # 800021dc <mycpu>
    80003a90:	01813083          	ld	ra,24(sp)
    80003a94:	01013403          	ld	s0,16(sp)
    80003a98:	40a48533          	sub	a0,s1,a0
    80003a9c:	00153513          	seqz	a0,a0
    80003aa0:	00813483          	ld	s1,8(sp)
    80003aa4:	02010113          	addi	sp,sp,32
    80003aa8:	00008067          	ret

0000000080003aac <push_off>:
    80003aac:	fe010113          	addi	sp,sp,-32
    80003ab0:	00813823          	sd	s0,16(sp)
    80003ab4:	00113c23          	sd	ra,24(sp)
    80003ab8:	00913423          	sd	s1,8(sp)
    80003abc:	02010413          	addi	s0,sp,32
    80003ac0:	100024f3          	csrr	s1,sstatus
    80003ac4:	100027f3          	csrr	a5,sstatus
    80003ac8:	ffd7f793          	andi	a5,a5,-3
    80003acc:	10079073          	csrw	sstatus,a5
    80003ad0:	ffffe097          	auipc	ra,0xffffe
    80003ad4:	70c080e7          	jalr	1804(ra) # 800021dc <mycpu>
    80003ad8:	07852783          	lw	a5,120(a0)
    80003adc:	02078663          	beqz	a5,80003b08 <push_off+0x5c>
    80003ae0:	ffffe097          	auipc	ra,0xffffe
    80003ae4:	6fc080e7          	jalr	1788(ra) # 800021dc <mycpu>
    80003ae8:	07852783          	lw	a5,120(a0)
    80003aec:	01813083          	ld	ra,24(sp)
    80003af0:	01013403          	ld	s0,16(sp)
    80003af4:	0017879b          	addiw	a5,a5,1
    80003af8:	06f52c23          	sw	a5,120(a0)
    80003afc:	00813483          	ld	s1,8(sp)
    80003b00:	02010113          	addi	sp,sp,32
    80003b04:	00008067          	ret
    80003b08:	0014d493          	srli	s1,s1,0x1
    80003b0c:	ffffe097          	auipc	ra,0xffffe
    80003b10:	6d0080e7          	jalr	1744(ra) # 800021dc <mycpu>
    80003b14:	0014f493          	andi	s1,s1,1
    80003b18:	06952e23          	sw	s1,124(a0)
    80003b1c:	fc5ff06f          	j	80003ae0 <push_off+0x34>

0000000080003b20 <pop_off>:
    80003b20:	ff010113          	addi	sp,sp,-16
    80003b24:	00813023          	sd	s0,0(sp)
    80003b28:	00113423          	sd	ra,8(sp)
    80003b2c:	01010413          	addi	s0,sp,16
    80003b30:	ffffe097          	auipc	ra,0xffffe
    80003b34:	6ac080e7          	jalr	1708(ra) # 800021dc <mycpu>
    80003b38:	100027f3          	csrr	a5,sstatus
    80003b3c:	0027f793          	andi	a5,a5,2
    80003b40:	04079663          	bnez	a5,80003b8c <pop_off+0x6c>
    80003b44:	07852783          	lw	a5,120(a0)
    80003b48:	02f05a63          	blez	a5,80003b7c <pop_off+0x5c>
    80003b4c:	fff7871b          	addiw	a4,a5,-1
    80003b50:	06e52c23          	sw	a4,120(a0)
    80003b54:	00071c63          	bnez	a4,80003b6c <pop_off+0x4c>
    80003b58:	07c52783          	lw	a5,124(a0)
    80003b5c:	00078863          	beqz	a5,80003b6c <pop_off+0x4c>
    80003b60:	100027f3          	csrr	a5,sstatus
    80003b64:	0027e793          	ori	a5,a5,2
    80003b68:	10079073          	csrw	sstatus,a5
    80003b6c:	00813083          	ld	ra,8(sp)
    80003b70:	00013403          	ld	s0,0(sp)
    80003b74:	01010113          	addi	sp,sp,16
    80003b78:	00008067          	ret
    80003b7c:	00001517          	auipc	a0,0x1
    80003b80:	6ec50513          	addi	a0,a0,1772 # 80005268 <digits+0x48>
    80003b84:	fffff097          	auipc	ra,0xfffff
    80003b88:	018080e7          	jalr	24(ra) # 80002b9c <panic>
    80003b8c:	00001517          	auipc	a0,0x1
    80003b90:	6c450513          	addi	a0,a0,1732 # 80005250 <digits+0x30>
    80003b94:	fffff097          	auipc	ra,0xfffff
    80003b98:	008080e7          	jalr	8(ra) # 80002b9c <panic>

0000000080003b9c <push_on>:
    80003b9c:	fe010113          	addi	sp,sp,-32
    80003ba0:	00813823          	sd	s0,16(sp)
    80003ba4:	00113c23          	sd	ra,24(sp)
    80003ba8:	00913423          	sd	s1,8(sp)
    80003bac:	02010413          	addi	s0,sp,32
    80003bb0:	100024f3          	csrr	s1,sstatus
    80003bb4:	100027f3          	csrr	a5,sstatus
    80003bb8:	0027e793          	ori	a5,a5,2
    80003bbc:	10079073          	csrw	sstatus,a5
    80003bc0:	ffffe097          	auipc	ra,0xffffe
    80003bc4:	61c080e7          	jalr	1564(ra) # 800021dc <mycpu>
    80003bc8:	07852783          	lw	a5,120(a0)
    80003bcc:	02078663          	beqz	a5,80003bf8 <push_on+0x5c>
    80003bd0:	ffffe097          	auipc	ra,0xffffe
    80003bd4:	60c080e7          	jalr	1548(ra) # 800021dc <mycpu>
    80003bd8:	07852783          	lw	a5,120(a0)
    80003bdc:	01813083          	ld	ra,24(sp)
    80003be0:	01013403          	ld	s0,16(sp)
    80003be4:	0017879b          	addiw	a5,a5,1
    80003be8:	06f52c23          	sw	a5,120(a0)
    80003bec:	00813483          	ld	s1,8(sp)
    80003bf0:	02010113          	addi	sp,sp,32
    80003bf4:	00008067          	ret
    80003bf8:	0014d493          	srli	s1,s1,0x1
    80003bfc:	ffffe097          	auipc	ra,0xffffe
    80003c00:	5e0080e7          	jalr	1504(ra) # 800021dc <mycpu>
    80003c04:	0014f493          	andi	s1,s1,1
    80003c08:	06952e23          	sw	s1,124(a0)
    80003c0c:	fc5ff06f          	j	80003bd0 <push_on+0x34>

0000000080003c10 <pop_on>:
    80003c10:	ff010113          	addi	sp,sp,-16
    80003c14:	00813023          	sd	s0,0(sp)
    80003c18:	00113423          	sd	ra,8(sp)
    80003c1c:	01010413          	addi	s0,sp,16
    80003c20:	ffffe097          	auipc	ra,0xffffe
    80003c24:	5bc080e7          	jalr	1468(ra) # 800021dc <mycpu>
    80003c28:	100027f3          	csrr	a5,sstatus
    80003c2c:	0027f793          	andi	a5,a5,2
    80003c30:	04078463          	beqz	a5,80003c78 <pop_on+0x68>
    80003c34:	07852783          	lw	a5,120(a0)
    80003c38:	02f05863          	blez	a5,80003c68 <pop_on+0x58>
    80003c3c:	fff7879b          	addiw	a5,a5,-1
    80003c40:	06f52c23          	sw	a5,120(a0)
    80003c44:	07853783          	ld	a5,120(a0)
    80003c48:	00079863          	bnez	a5,80003c58 <pop_on+0x48>
    80003c4c:	100027f3          	csrr	a5,sstatus
    80003c50:	ffd7f793          	andi	a5,a5,-3
    80003c54:	10079073          	csrw	sstatus,a5
    80003c58:	00813083          	ld	ra,8(sp)
    80003c5c:	00013403          	ld	s0,0(sp)
    80003c60:	01010113          	addi	sp,sp,16
    80003c64:	00008067          	ret
    80003c68:	00001517          	auipc	a0,0x1
    80003c6c:	62850513          	addi	a0,a0,1576 # 80005290 <digits+0x70>
    80003c70:	fffff097          	auipc	ra,0xfffff
    80003c74:	f2c080e7          	jalr	-212(ra) # 80002b9c <panic>
    80003c78:	00001517          	auipc	a0,0x1
    80003c7c:	5f850513          	addi	a0,a0,1528 # 80005270 <digits+0x50>
    80003c80:	fffff097          	auipc	ra,0xfffff
    80003c84:	f1c080e7          	jalr	-228(ra) # 80002b9c <panic>

0000000080003c88 <__memset>:
    80003c88:	ff010113          	addi	sp,sp,-16
    80003c8c:	00813423          	sd	s0,8(sp)
    80003c90:	01010413          	addi	s0,sp,16
    80003c94:	1a060e63          	beqz	a2,80003e50 <__memset+0x1c8>
    80003c98:	40a007b3          	neg	a5,a0
    80003c9c:	0077f793          	andi	a5,a5,7
    80003ca0:	00778693          	addi	a3,a5,7
    80003ca4:	00b00813          	li	a6,11
    80003ca8:	0ff5f593          	andi	a1,a1,255
    80003cac:	fff6071b          	addiw	a4,a2,-1
    80003cb0:	1b06e663          	bltu	a3,a6,80003e5c <__memset+0x1d4>
    80003cb4:	1cd76463          	bltu	a4,a3,80003e7c <__memset+0x1f4>
    80003cb8:	1a078e63          	beqz	a5,80003e74 <__memset+0x1ec>
    80003cbc:	00b50023          	sb	a1,0(a0)
    80003cc0:	00100713          	li	a4,1
    80003cc4:	1ae78463          	beq	a5,a4,80003e6c <__memset+0x1e4>
    80003cc8:	00b500a3          	sb	a1,1(a0)
    80003ccc:	00200713          	li	a4,2
    80003cd0:	1ae78a63          	beq	a5,a4,80003e84 <__memset+0x1fc>
    80003cd4:	00b50123          	sb	a1,2(a0)
    80003cd8:	00300713          	li	a4,3
    80003cdc:	18e78463          	beq	a5,a4,80003e64 <__memset+0x1dc>
    80003ce0:	00b501a3          	sb	a1,3(a0)
    80003ce4:	00400713          	li	a4,4
    80003ce8:	1ae78263          	beq	a5,a4,80003e8c <__memset+0x204>
    80003cec:	00b50223          	sb	a1,4(a0)
    80003cf0:	00500713          	li	a4,5
    80003cf4:	1ae78063          	beq	a5,a4,80003e94 <__memset+0x20c>
    80003cf8:	00b502a3          	sb	a1,5(a0)
    80003cfc:	00700713          	li	a4,7
    80003d00:	18e79e63          	bne	a5,a4,80003e9c <__memset+0x214>
    80003d04:	00b50323          	sb	a1,6(a0)
    80003d08:	00700e93          	li	t4,7
    80003d0c:	00859713          	slli	a4,a1,0x8
    80003d10:	00e5e733          	or	a4,a1,a4
    80003d14:	01059e13          	slli	t3,a1,0x10
    80003d18:	01c76e33          	or	t3,a4,t3
    80003d1c:	01859313          	slli	t1,a1,0x18
    80003d20:	006e6333          	or	t1,t3,t1
    80003d24:	02059893          	slli	a7,a1,0x20
    80003d28:	40f60e3b          	subw	t3,a2,a5
    80003d2c:	011368b3          	or	a7,t1,a7
    80003d30:	02859813          	slli	a6,a1,0x28
    80003d34:	0108e833          	or	a6,a7,a6
    80003d38:	03059693          	slli	a3,a1,0x30
    80003d3c:	003e589b          	srliw	a7,t3,0x3
    80003d40:	00d866b3          	or	a3,a6,a3
    80003d44:	03859713          	slli	a4,a1,0x38
    80003d48:	00389813          	slli	a6,a7,0x3
    80003d4c:	00f507b3          	add	a5,a0,a5
    80003d50:	00e6e733          	or	a4,a3,a4
    80003d54:	000e089b          	sext.w	a7,t3
    80003d58:	00f806b3          	add	a3,a6,a5
    80003d5c:	00e7b023          	sd	a4,0(a5)
    80003d60:	00878793          	addi	a5,a5,8
    80003d64:	fed79ce3          	bne	a5,a3,80003d5c <__memset+0xd4>
    80003d68:	ff8e7793          	andi	a5,t3,-8
    80003d6c:	0007871b          	sext.w	a4,a5
    80003d70:	01d787bb          	addw	a5,a5,t4
    80003d74:	0ce88e63          	beq	a7,a4,80003e50 <__memset+0x1c8>
    80003d78:	00f50733          	add	a4,a0,a5
    80003d7c:	00b70023          	sb	a1,0(a4)
    80003d80:	0017871b          	addiw	a4,a5,1
    80003d84:	0cc77663          	bgeu	a4,a2,80003e50 <__memset+0x1c8>
    80003d88:	00e50733          	add	a4,a0,a4
    80003d8c:	00b70023          	sb	a1,0(a4)
    80003d90:	0027871b          	addiw	a4,a5,2
    80003d94:	0ac77e63          	bgeu	a4,a2,80003e50 <__memset+0x1c8>
    80003d98:	00e50733          	add	a4,a0,a4
    80003d9c:	00b70023          	sb	a1,0(a4)
    80003da0:	0037871b          	addiw	a4,a5,3
    80003da4:	0ac77663          	bgeu	a4,a2,80003e50 <__memset+0x1c8>
    80003da8:	00e50733          	add	a4,a0,a4
    80003dac:	00b70023          	sb	a1,0(a4)
    80003db0:	0047871b          	addiw	a4,a5,4
    80003db4:	08c77e63          	bgeu	a4,a2,80003e50 <__memset+0x1c8>
    80003db8:	00e50733          	add	a4,a0,a4
    80003dbc:	00b70023          	sb	a1,0(a4)
    80003dc0:	0057871b          	addiw	a4,a5,5
    80003dc4:	08c77663          	bgeu	a4,a2,80003e50 <__memset+0x1c8>
    80003dc8:	00e50733          	add	a4,a0,a4
    80003dcc:	00b70023          	sb	a1,0(a4)
    80003dd0:	0067871b          	addiw	a4,a5,6
    80003dd4:	06c77e63          	bgeu	a4,a2,80003e50 <__memset+0x1c8>
    80003dd8:	00e50733          	add	a4,a0,a4
    80003ddc:	00b70023          	sb	a1,0(a4)
    80003de0:	0077871b          	addiw	a4,a5,7
    80003de4:	06c77663          	bgeu	a4,a2,80003e50 <__memset+0x1c8>
    80003de8:	00e50733          	add	a4,a0,a4
    80003dec:	00b70023          	sb	a1,0(a4)
    80003df0:	0087871b          	addiw	a4,a5,8
    80003df4:	04c77e63          	bgeu	a4,a2,80003e50 <__memset+0x1c8>
    80003df8:	00e50733          	add	a4,a0,a4
    80003dfc:	00b70023          	sb	a1,0(a4)
    80003e00:	0097871b          	addiw	a4,a5,9
    80003e04:	04c77663          	bgeu	a4,a2,80003e50 <__memset+0x1c8>
    80003e08:	00e50733          	add	a4,a0,a4
    80003e0c:	00b70023          	sb	a1,0(a4)
    80003e10:	00a7871b          	addiw	a4,a5,10
    80003e14:	02c77e63          	bgeu	a4,a2,80003e50 <__memset+0x1c8>
    80003e18:	00e50733          	add	a4,a0,a4
    80003e1c:	00b70023          	sb	a1,0(a4)
    80003e20:	00b7871b          	addiw	a4,a5,11
    80003e24:	02c77663          	bgeu	a4,a2,80003e50 <__memset+0x1c8>
    80003e28:	00e50733          	add	a4,a0,a4
    80003e2c:	00b70023          	sb	a1,0(a4)
    80003e30:	00c7871b          	addiw	a4,a5,12
    80003e34:	00c77e63          	bgeu	a4,a2,80003e50 <__memset+0x1c8>
    80003e38:	00e50733          	add	a4,a0,a4
    80003e3c:	00b70023          	sb	a1,0(a4)
    80003e40:	00d7879b          	addiw	a5,a5,13
    80003e44:	00c7f663          	bgeu	a5,a2,80003e50 <__memset+0x1c8>
    80003e48:	00f507b3          	add	a5,a0,a5
    80003e4c:	00b78023          	sb	a1,0(a5)
    80003e50:	00813403          	ld	s0,8(sp)
    80003e54:	01010113          	addi	sp,sp,16
    80003e58:	00008067          	ret
    80003e5c:	00b00693          	li	a3,11
    80003e60:	e55ff06f          	j	80003cb4 <__memset+0x2c>
    80003e64:	00300e93          	li	t4,3
    80003e68:	ea5ff06f          	j	80003d0c <__memset+0x84>
    80003e6c:	00100e93          	li	t4,1
    80003e70:	e9dff06f          	j	80003d0c <__memset+0x84>
    80003e74:	00000e93          	li	t4,0
    80003e78:	e95ff06f          	j	80003d0c <__memset+0x84>
    80003e7c:	00000793          	li	a5,0
    80003e80:	ef9ff06f          	j	80003d78 <__memset+0xf0>
    80003e84:	00200e93          	li	t4,2
    80003e88:	e85ff06f          	j	80003d0c <__memset+0x84>
    80003e8c:	00400e93          	li	t4,4
    80003e90:	e7dff06f          	j	80003d0c <__memset+0x84>
    80003e94:	00500e93          	li	t4,5
    80003e98:	e75ff06f          	j	80003d0c <__memset+0x84>
    80003e9c:	00600e93          	li	t4,6
    80003ea0:	e6dff06f          	j	80003d0c <__memset+0x84>

0000000080003ea4 <__memmove>:
    80003ea4:	ff010113          	addi	sp,sp,-16
    80003ea8:	00813423          	sd	s0,8(sp)
    80003eac:	01010413          	addi	s0,sp,16
    80003eb0:	0e060863          	beqz	a2,80003fa0 <__memmove+0xfc>
    80003eb4:	fff6069b          	addiw	a3,a2,-1
    80003eb8:	0006881b          	sext.w	a6,a3
    80003ebc:	0ea5e863          	bltu	a1,a0,80003fac <__memmove+0x108>
    80003ec0:	00758713          	addi	a4,a1,7
    80003ec4:	00a5e7b3          	or	a5,a1,a0
    80003ec8:	40a70733          	sub	a4,a4,a0
    80003ecc:	0077f793          	andi	a5,a5,7
    80003ed0:	00f73713          	sltiu	a4,a4,15
    80003ed4:	00174713          	xori	a4,a4,1
    80003ed8:	0017b793          	seqz	a5,a5
    80003edc:	00e7f7b3          	and	a5,a5,a4
    80003ee0:	10078863          	beqz	a5,80003ff0 <__memmove+0x14c>
    80003ee4:	00900793          	li	a5,9
    80003ee8:	1107f463          	bgeu	a5,a6,80003ff0 <__memmove+0x14c>
    80003eec:	0036581b          	srliw	a6,a2,0x3
    80003ef0:	fff8081b          	addiw	a6,a6,-1
    80003ef4:	02081813          	slli	a6,a6,0x20
    80003ef8:	01d85893          	srli	a7,a6,0x1d
    80003efc:	00858813          	addi	a6,a1,8
    80003f00:	00058793          	mv	a5,a1
    80003f04:	00050713          	mv	a4,a0
    80003f08:	01088833          	add	a6,a7,a6
    80003f0c:	0007b883          	ld	a7,0(a5)
    80003f10:	00878793          	addi	a5,a5,8
    80003f14:	00870713          	addi	a4,a4,8
    80003f18:	ff173c23          	sd	a7,-8(a4)
    80003f1c:	ff0798e3          	bne	a5,a6,80003f0c <__memmove+0x68>
    80003f20:	ff867713          	andi	a4,a2,-8
    80003f24:	02071793          	slli	a5,a4,0x20
    80003f28:	0207d793          	srli	a5,a5,0x20
    80003f2c:	00f585b3          	add	a1,a1,a5
    80003f30:	40e686bb          	subw	a3,a3,a4
    80003f34:	00f507b3          	add	a5,a0,a5
    80003f38:	06e60463          	beq	a2,a4,80003fa0 <__memmove+0xfc>
    80003f3c:	0005c703          	lbu	a4,0(a1)
    80003f40:	00e78023          	sb	a4,0(a5)
    80003f44:	04068e63          	beqz	a3,80003fa0 <__memmove+0xfc>
    80003f48:	0015c603          	lbu	a2,1(a1)
    80003f4c:	00100713          	li	a4,1
    80003f50:	00c780a3          	sb	a2,1(a5)
    80003f54:	04e68663          	beq	a3,a4,80003fa0 <__memmove+0xfc>
    80003f58:	0025c603          	lbu	a2,2(a1)
    80003f5c:	00200713          	li	a4,2
    80003f60:	00c78123          	sb	a2,2(a5)
    80003f64:	02e68e63          	beq	a3,a4,80003fa0 <__memmove+0xfc>
    80003f68:	0035c603          	lbu	a2,3(a1)
    80003f6c:	00300713          	li	a4,3
    80003f70:	00c781a3          	sb	a2,3(a5)
    80003f74:	02e68663          	beq	a3,a4,80003fa0 <__memmove+0xfc>
    80003f78:	0045c603          	lbu	a2,4(a1)
    80003f7c:	00400713          	li	a4,4
    80003f80:	00c78223          	sb	a2,4(a5)
    80003f84:	00e68e63          	beq	a3,a4,80003fa0 <__memmove+0xfc>
    80003f88:	0055c603          	lbu	a2,5(a1)
    80003f8c:	00500713          	li	a4,5
    80003f90:	00c782a3          	sb	a2,5(a5)
    80003f94:	00e68663          	beq	a3,a4,80003fa0 <__memmove+0xfc>
    80003f98:	0065c703          	lbu	a4,6(a1)
    80003f9c:	00e78323          	sb	a4,6(a5)
    80003fa0:	00813403          	ld	s0,8(sp)
    80003fa4:	01010113          	addi	sp,sp,16
    80003fa8:	00008067          	ret
    80003fac:	02061713          	slli	a4,a2,0x20
    80003fb0:	02075713          	srli	a4,a4,0x20
    80003fb4:	00e587b3          	add	a5,a1,a4
    80003fb8:	f0f574e3          	bgeu	a0,a5,80003ec0 <__memmove+0x1c>
    80003fbc:	02069613          	slli	a2,a3,0x20
    80003fc0:	02065613          	srli	a2,a2,0x20
    80003fc4:	fff64613          	not	a2,a2
    80003fc8:	00e50733          	add	a4,a0,a4
    80003fcc:	00c78633          	add	a2,a5,a2
    80003fd0:	fff7c683          	lbu	a3,-1(a5)
    80003fd4:	fff78793          	addi	a5,a5,-1
    80003fd8:	fff70713          	addi	a4,a4,-1
    80003fdc:	00d70023          	sb	a3,0(a4)
    80003fe0:	fec798e3          	bne	a5,a2,80003fd0 <__memmove+0x12c>
    80003fe4:	00813403          	ld	s0,8(sp)
    80003fe8:	01010113          	addi	sp,sp,16
    80003fec:	00008067          	ret
    80003ff0:	02069713          	slli	a4,a3,0x20
    80003ff4:	02075713          	srli	a4,a4,0x20
    80003ff8:	00170713          	addi	a4,a4,1
    80003ffc:	00e50733          	add	a4,a0,a4
    80004000:	00050793          	mv	a5,a0
    80004004:	0005c683          	lbu	a3,0(a1)
    80004008:	00178793          	addi	a5,a5,1
    8000400c:	00158593          	addi	a1,a1,1
    80004010:	fed78fa3          	sb	a3,-1(a5)
    80004014:	fee798e3          	bne	a5,a4,80004004 <__memmove+0x160>
    80004018:	f89ff06f          	j	80003fa0 <__memmove+0xfc>

000000008000401c <__putc>:
    8000401c:	fe010113          	addi	sp,sp,-32
    80004020:	00813823          	sd	s0,16(sp)
    80004024:	00113c23          	sd	ra,24(sp)
    80004028:	02010413          	addi	s0,sp,32
    8000402c:	00050793          	mv	a5,a0
    80004030:	fef40593          	addi	a1,s0,-17
    80004034:	00100613          	li	a2,1
    80004038:	00000513          	li	a0,0
    8000403c:	fef407a3          	sb	a5,-17(s0)
    80004040:	fffff097          	auipc	ra,0xfffff
    80004044:	b3c080e7          	jalr	-1220(ra) # 80002b7c <console_write>
    80004048:	01813083          	ld	ra,24(sp)
    8000404c:	01013403          	ld	s0,16(sp)
    80004050:	02010113          	addi	sp,sp,32
    80004054:	00008067          	ret

0000000080004058 <__getc>:
    80004058:	fe010113          	addi	sp,sp,-32
    8000405c:	00813823          	sd	s0,16(sp)
    80004060:	00113c23          	sd	ra,24(sp)
    80004064:	02010413          	addi	s0,sp,32
    80004068:	fe840593          	addi	a1,s0,-24
    8000406c:	00100613          	li	a2,1
    80004070:	00000513          	li	a0,0
    80004074:	fffff097          	auipc	ra,0xfffff
    80004078:	ae8080e7          	jalr	-1304(ra) # 80002b5c <console_read>
    8000407c:	fe844503          	lbu	a0,-24(s0)
    80004080:	01813083          	ld	ra,24(sp)
    80004084:	01013403          	ld	s0,16(sp)
    80004088:	02010113          	addi	sp,sp,32
    8000408c:	00008067          	ret

0000000080004090 <console_handler>:
    80004090:	fe010113          	addi	sp,sp,-32
    80004094:	00813823          	sd	s0,16(sp)
    80004098:	00113c23          	sd	ra,24(sp)
    8000409c:	00913423          	sd	s1,8(sp)
    800040a0:	02010413          	addi	s0,sp,32
    800040a4:	14202773          	csrr	a4,scause
    800040a8:	100027f3          	csrr	a5,sstatus
    800040ac:	0027f793          	andi	a5,a5,2
    800040b0:	06079e63          	bnez	a5,8000412c <console_handler+0x9c>
    800040b4:	00074c63          	bltz	a4,800040cc <console_handler+0x3c>
    800040b8:	01813083          	ld	ra,24(sp)
    800040bc:	01013403          	ld	s0,16(sp)
    800040c0:	00813483          	ld	s1,8(sp)
    800040c4:	02010113          	addi	sp,sp,32
    800040c8:	00008067          	ret
    800040cc:	0ff77713          	andi	a4,a4,255
    800040d0:	00900793          	li	a5,9
    800040d4:	fef712e3          	bne	a4,a5,800040b8 <console_handler+0x28>
    800040d8:	ffffe097          	auipc	ra,0xffffe
    800040dc:	6dc080e7          	jalr	1756(ra) # 800027b4 <plic_claim>
    800040e0:	00a00793          	li	a5,10
    800040e4:	00050493          	mv	s1,a0
    800040e8:	02f50c63          	beq	a0,a5,80004120 <console_handler+0x90>
    800040ec:	fc0506e3          	beqz	a0,800040b8 <console_handler+0x28>
    800040f0:	00050593          	mv	a1,a0
    800040f4:	00001517          	auipc	a0,0x1
    800040f8:	0a450513          	addi	a0,a0,164 # 80005198 <_ZZ12printIntegermE6digits+0xe0>
    800040fc:	fffff097          	auipc	ra,0xfffff
    80004100:	afc080e7          	jalr	-1284(ra) # 80002bf8 <__printf>
    80004104:	01013403          	ld	s0,16(sp)
    80004108:	01813083          	ld	ra,24(sp)
    8000410c:	00048513          	mv	a0,s1
    80004110:	00813483          	ld	s1,8(sp)
    80004114:	02010113          	addi	sp,sp,32
    80004118:	ffffe317          	auipc	t1,0xffffe
    8000411c:	6d430067          	jr	1748(t1) # 800027ec <plic_complete>
    80004120:	fffff097          	auipc	ra,0xfffff
    80004124:	3e0080e7          	jalr	992(ra) # 80003500 <uartintr>
    80004128:	fddff06f          	j	80004104 <console_handler+0x74>
    8000412c:	00001517          	auipc	a0,0x1
    80004130:	16c50513          	addi	a0,a0,364 # 80005298 <digits+0x78>
    80004134:	fffff097          	auipc	ra,0xfffff
    80004138:	a68080e7          	jalr	-1432(ra) # 80002b9c <panic>
	...
