#!/usr/bin/env bash

########## ANALYSE OPTIONS ###############:
# $1 - architecture (optional, default 64)
# $2 - file to build

ARCH=${1:-"64"}


########### BUILD ####################:
# compile:
TARGET=$2

SRC="$TARGET.asm"
OBJ="$TARGET.o"

nasm -f elf$ARCH  $SRC -o $OBJ

#link:
if [ $ARCH = "32" ] ; then
        LD_FLAG="-melf_i386"
else
        LD_FLAG="-melf_x86_64"
fi
    
ld -o $TARGET $LD_FLAG $OBJ



