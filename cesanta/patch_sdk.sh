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
			 --redefine-sym _fstat_r=_fstat_r_sdk \
			 --redefine-sym _rename_r=_rename_r_sdk \
			 --redefine-sym _unlink_r=_unlink_r_sdk \
			 --redefine-sym _exit=_exit_sdk \
			 --redefine-sym _open_r=_open_sdk \
                         ./../lib/libmain.a

for i in ./../lib/*.a; do
    xtensa-lx106-elf-objcopy --redefine-sym printf=printf_broken $i
done
# make -C ./src/lwip/
