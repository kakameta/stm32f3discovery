COMPILER=arm-none-eabi-gcc
LINKER=arm-none-eabi-ld
OBJDUMP=arm-none-eabi-objdump
CFLAGS=-c
CFLAGS+=-ffreestanding 
CFLAGS+=--specs=nosys.specs
all:
	#$(COMPILER) -c -ffreestanding --specs=nosys.specs main.c
	$(COMPILER) $(CFLAGS) main.c
	$(LINKER) -T simple.ld -o main.elf main.o
	$(OBJDUMP) -D main.elf > main.asm 
clean:
	rm -f *.out *.o
