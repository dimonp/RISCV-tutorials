#!/bin/sh
PID=`pidof qemu-riscv64-static`
echo "Kill process: $PID"
kill -9 $PID
