object-files:
	arm-none-eabi-gcc -mcpu=cortex-m0 main.c init.s -c
firmware.elf:object-files
	arm-none-eabi-ld -T link.ld init.o main.o -o firmware.elf
firmware.bin:firmware.elf
	arm-none-eabi-objcopy -O binary firmware.elf firmware.bin
flash:firmware.bin
	st-flash --reset write firmware.bin 0x8000000
clean: 
	rm -f firmware.*
	
