#ifndef S3C4412_GPIO_H
#define S3C4412_GPIO_H

#define GPX3CON (0x11000000 + 0x0C60)
#define GPX3DAT (0x11000000 + 0x0C64)
#define GPX3PUD (0x11000000 + 0x0C68)
#define GPX3DRV (0x11000000 + 0x0C6C)

#define GPD0CON (0x11400000 + 0x00A0)
#define GPD0DAT (0x11400000 + 0x00A4)
#define GPD0PUD (0x11400000 + 0x00A8)
#define GPD0DRV (0x11400000 + 0x00AC)

#define GPA0CON (0x11400000 + 0x0000)

#define ULCON1      (0x13810000 + 0x0000)
#define UCON1       (0x13810000 + 0x0004)
#define UFCON1      (0x13810000 + 0x0008)
#define UMCON1      (0x13810000 + 0x000c)
#define UTRSTAT1    (0x13810000 + 0x0010)
#define UERSTAT1    (0x13810000 + 0x0014)
#define UFSTAT1     (0x13810000 + 0x0018)
#define UMSTAT1     (0x13810000 + 0x001C)
#define UTXH1       (0x13810000 + 0x0020)
#define URXH1       (0x13810000 + 0x0024)
#define UBRDIV1     (0x13810000 + 0x0028)
#define UFRACVAL1   (0x13810000 + 0x002C)
#define UINTP1      (0x13810000 + 0x0030)
#define UINTSP1     (0x13810000 + 0x0034)
#define UINTM1      (0x13810000 + 0x0038)

#define MPLL_CON0 (0x10040108)
#define CLK_SRC_DMC (0x10040200)
#define CLK_SRC_TOP1 (0x1003C214)
// system clock
#define CLK_SRC_PERIL0 (0x1003C250)
#define CLK_DIV_PERIL0 (0x1003C550)
#endif
