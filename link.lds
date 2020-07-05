SECTIONS
{
    . = 0x02023400;
    .text : {
        start.o
        * (.text)
    }
    .data : {
        * (.data*)
    }
    .bss : {
        * (.bss)
        * (COMMON)
    }
}
