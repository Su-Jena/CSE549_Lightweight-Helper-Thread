#include "bsg_manycore_arch.h"
#include "bsg_manycore_asm.h"
.text
// main thread code
_start:
   0:   02c02783                lw      a5,44(zero) # 2c <__bsg_id>
 4:   05802703                lw      a4,88(zero) # 58 <__cuda_barrier_cfg>
 8:   02112e23                sw      ra,60(sp)
 c:   00178093                addi    ra,a5,1
 10:   00209293                slli    t0,ra,0x2
    int sense = 1;
 14:   00100813                li      a6,1
 18:   01012623                sw      a6,12(sp)
    int cfg = __cuda_barrier_cfg[1+__bsg_id];
 1c:   00570333                add     t1,a4,t0
 20:   02812c23                sw      s0,56(sp)
 24:   02912a23                sw      s1,52(sp)
 28:   01812c23                sw      s8,24(sp)
    asm volatile ("csrrw x0, 0xfc1, %0" : : "r" (cfg));
 2c:   00032383                lw      t2,0(t1)
 30:   03212823                sw      s2,48(sp)
 34:   03312623                sw      s3,44(sp)
 38:   03412423                sw      s4,40(sp)
 3c:   03512223                sw      s5,36(sp)
 40:   03612023                sw      s6,32(sp)
 44:   01912a23                sw      s9,20(sp)
 48:   00050413                mv      s0,a0
 4c:   00058493                mv      s1,a1
 50:   00060c13                mv      s8,a2
  bsg_asm_finish(IO_X_INDEX, 0)
loop:
  beq x0, x0, loop
// helper thread code
.align 2 // 4-byte alignment
_helper_thread:

300:   000c8c93               addi      x25, x25, 0   
304:   0x001c8c93             addi      x25, x25, 1
308:   0x001c8c93             addi      x25, x25, 1
30c:   0x001c8c93             addi      x25, x25, 1
310:   0x001c8c93             addi      x25, x25, 1
314:   0x001c8c93             addi      x25, x25, 1
318:   0x001c8c93             addi      x25, x25, 1
31c:   0x001c8c93             addi      x25, x25, 1
