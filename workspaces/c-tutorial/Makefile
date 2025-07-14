CC=riscv64-unknown-elf-gcc
CFLAGS=-g
LD=riscv64-unknown-elf-gcc
LDFLAGS=
SOURCES=$(wildcard *.c)
EXECUTABLE=$(SOURCES:.c=)
DEST=../build

all: $(EXECUTABLE)

%: %.c
	$(CC) $(CFLAGS) -o $(DEST)/$@ $<

clean:
	rm -f $(DEST)/*
