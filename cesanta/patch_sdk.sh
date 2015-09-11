#!/bin/sh

# Espressif's implementations of _xxxxx_r functions
# (at least in SDK versions up to 1.2.0) 
# are stubs that just print the name of the function
# In order to use file operations, working implementations of
# these functions have to be provided by user code
xtensa-lx106-elf-objcopy --redefine-sym _read_r=_read_r_broken \
                         --redefine-sym _write_r=_write_r_broken \
                         --redefine-sym _lseek_r=_lseek_r_broken \
                         --redefine-sym _close_r=_close_r_broken \
                         ./../lib/libmain.a
