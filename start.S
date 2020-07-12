#include "s3c4412_gpio.h"
.global _start
.word 0x2000
.word 0x0
.word 0x0
.word 0x0
_start:
    ldr r0, =0x1002330c
    ldr r1, [r0]
    orr r1, r1, #0x300
    str r1, [r0]

    ldr r0, =0x11000c08
    ldr r1, =0x0
    str r1, [r0]

    ldr r0,=GPX3CON
    mov r1, #(0x01 << 4)
    str r1, [r0]

    ldr r0,=GPD0CON
    mov r1, #(0x01 << 0)
    str r1, [r0]

    ldr r0, =GPA0CON         @uart1 GPIO init
    ldr r1, =0x222222
    str r1, [r0]

    ldr r10, =MPLL_CON0
    ldr r11, =0x80640300
    str r11, [r10]

    ldr r10, =CLK_SRC_DMC
    ldr r11, =0x00011000
    str r11, [r10]

    ldr r10, =CLK_SRC_TOP1
    ldr r11, =0x01111000
    str r11, [r10]

    ldr r10, =CLK_SRC_PERIL0
    ldr r11, =0x66666
    str r11, [r10]

    ldr r10, =CLK_DIV_PERIL0
    ldr r11, =0x777777
    str r11, [r10]

    ldr r0, =ULCON1
    ldr r1, =3
    str r1, [r0]

    ldr r0, =UCON1
    ldr r1, =0x305
    str r1, [r0]

    ldr r0, =UFCON1
    ldr r1, =0x1
    str r1, [r0]

    ldr r0, =UMCON1
    ldr r1, =0x0
    str r1, [r0]

    ldr r0, =UBRDIV1
    ldr r1, =0x35
    str r1, [r0]

    ldr r0, =UFRACVAL1
    ldr r1, =0x4
    str r1, [r0]

    ldr r0, =UTXH1
    ldr r1, =0x55
    str r1, [r0]

    ldr r1, =0x61
    str r1, [r0]

    ldr r1, =0x72
    str r1, [r0]

    ldr r1, =0x74
    str r1, [r0]

    ldr r1, =0xa
    str r1, [r0]

    ldr r1, =0xd
    str r1, [r0]

    ldr r0, =0x1234abcd
    bl  display_hex



1:
    ldr r0,=GPX3DAT
    mov r1, #0x2
    str r1, [r0]

    ldr r0,=GPD0DAT
    mov r1, #0x1
    //str r1, [r0]

      b 1b

display_hex:
    ldr r1, =UTXH1
    ldr r2, =0x30
    str r2, [r1]

    ldr r2, =0x78
    str r2, [r1]

    ldr r3,=28

disphex_loop_cnt:
    lsr r2, r0, r3
    and r2, r2, #0xf
    cmp r2, #10
    addmi   r2, r2, #0x30
    addpl   r2, r2, #0x37
    str r2, [r1]

    sub r3, r3, #4
    cmp r3, #0
    bpl disphex_loop_cnt
    
    ldr r2, =0x0a
    str r2, [r1]
    ldr r2, =0x0d
    str r2, [r1]

    mov pc, lr
