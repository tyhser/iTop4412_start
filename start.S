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

1:
    ldr r0,=GPX3DAT
    mov r1, #0x2
    str r1, [r0]

    ldr r0,=GPD0DAT
    mov r1, #0x1
    str r1, [r0]


    b 1b
