all:
	arm-eabi-as -ahls -mcpu=cortex-a7 -mfpu=neon-vfpv4 -o 1.o 1.s > 1.lst
	arm-eabi-ld -v -T imx6ull.ld -nostartfiles -o 1.elf 1.o
	arm-eabi-objcopy -O binary 1.elf  1.bin
