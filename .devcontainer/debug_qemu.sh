#!/bin/bash
echo "Debugging with QEMU: $1"
qemu-riscv64-static -g 5005 $1 &
process_id=$!
echo "QEMU RISC-V started. PID=$process_id"!
wait $process_id || { echo "QEMU debugging failed: $?"; exit -1; }
echo "QEMU debugging completed: $?"
