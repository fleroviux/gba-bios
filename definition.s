
@ ARM7TDMI-S CPU definitions
.equ MODE_USR, 0x10
.equ MODE_FIQ, 0x11
.equ MODE_IRQ, 0x12
.equ MODE_SVC, 0x13
.equ MODE_ABT, 0x17
.equ MODE_UND, 0x1B
.equ MODE_SYS, 0x1F
.equ IRQ_DISABLE, 0x80

@ GBA related definitions
.equ ROM_ENTRYPOINT, 0x08000000
.equ RAM_ENTRYPOINT, 0x02000000
.equ eWRAM_START,    0x02000000
.equ SVC_STACK,      0x03007FE0
.equ IRQ_STACK,      0x03007FA0
.equ SYS_STACK,      0x03007F00

.equ MMIO_BASE,      0x04000000

.equ REG_DISPCNT,    0x04000000
.equ REG_DISPSTAT,   0x04000004
.equ REG_BG0CNT,     0x04000008
.equ REG_WINOUT,     0x0400004A

.equ REG_DMA0SAD,    0x040000b0
.equ REG_DMA0DAD,    0x040000b4
.equ REG_DMA0CNT_L,  0x040000b8
.equ REG_DMA0CNT_H,  0x040000ba

.equ REG_DMA1SAD,    0x040000bc
.equ REG_DMA1DAD,    0x040000c0
.equ REG_DMA1CNT_L,  0x040000c4
.equ REG_DMA1CNT_H,  0x040000c6

.equ REG_DMA2SAD,    0x040000c8
.equ REG_DMA2DAD,    0x040000cc
.equ REG_DMA2CNT_L,  0x040000d0
.equ REG_DMA2CNT_H,  0x040000d2

.equ REG_SOUNDCNT_L, 0x04000080
.equ REG_SOUNDCNT_H, 0x04000082
.equ REG_SOUNDCNT_X, 0x04000084
.equ REG_SOUNDBIAS,  0x04000088
.equ REG_FIFO_A,     0x040000a0
.equ REG_FIFO_B,     0x040000a4

.equ REG_IE,         0x04000200
.equ REG_IME,        0x04000208
.equ REG_HALTCNT,    0x04000301

.equ PAL_START,      0x05000000
.equ VRAM_START,     0x06000000
.equ OBJ_START,      0x06010000
.equ OAM_START,      0x07000000

.equ SCREEN_WIDTH, 240
.equ CHAR_BLOCK_LENGTH, 0x4000
