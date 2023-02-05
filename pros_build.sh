#!/bin/sh

#Build zlib for use with PROS

#Define compiler prefix
export CHOST=arm-none-eabi

#Run configure as a static lib
./configure --static

#Make libz.a
make libz.a

#Copy results into PROS-style folders
mkdir -p firmware
cp libz.a ./firmware/
mkdir -p include/zlib
cp zlib.h zconf.h ./include/zlib/

#Tell Pros to generate a library
prosv5 c create-template . libz 1.0.0 --system "include/zlib/zlib.h" --system "include/zlib/zconf.h" --system "firmware/libz.a" --target v5