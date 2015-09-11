# Note:
# This makefile is indended for patching RTOS SDK
# In order to use it install appropriate toolchain
# and add it to PATH
CFLAGS = -Wall -Werror -Os -mtext-section-literals -ffunction-sections \
         -mlongcalls

CC := xtensa-lx106-elf-gcc
AR := xtensa-lx106-elf-ar

SDKROOT = ./../../../

IPATH = $(SDKROOT)/include/lwip $(SDKROOT)/include/lwip/ipv4 \
        $(SDKROOT)/include/lwip/ipv6 $(SDKROOT)/include/espressif \
				$(SDKROOT)/include $(SDKROOT)/extra_include

INCDIRS = $(addprefix -I,$(IPATH))

.PHONY: all clean

all:
	mkdir -p ./tmp
	$(CC) $(CFLAGS) $(INCDIRS) -c sockets.c -o ./tmp/sockets.o
	$(AR) r $(SDKROOT)/lib/liblwip.a ./tmp/sockets.o
	rm -rf ./tmp
