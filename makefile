CROSS_COMPILE = arm-linux-gnueabihf-
%.o : %.S
	$(CROSS_COMPILE)gcc -o $@ $< -c 
%.o : %.c
	$(CROSS_COMPILE)gcc -o $@ $< -c 

.PHONY: all
all : 	bl2.bin

bl2.bin: led.bin
	./mkbl2 led.bin bl2.bin 14336

led.bin: led.elf
	$(CROSS_COMPILE)objcopy -O binary led.elf $@

led.elf : start.o link.lds
	$(CROSS_COMPILE)ld -T link.lds -o led.elf $^
	$(CROSS_COMPILE)objdump -D led.elf > led.dis 

.PHONY : clean
clean:
	rm -rf *.o *.elf led.bin *.dis

.PHONY : fush
fush:
	sudo dd iflag=dsync oflag=dsync if=E4412_N.bl1.bin of=/dev/sdc seek=1
	sudo dd if=bl2.bin of=/dev/sdc bs=512 seek=17 iflag=dsync oflag=dsync
	sync
