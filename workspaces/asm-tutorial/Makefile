CC=riscv64-unknown-elf-as
CFLAGS=-g
LD=riscv64-unknown-elf-ld
LDFLAGS=
SOURCES=$(wildcard *.S)
OBJECTS=$(SOURCES:.S=.o)
EXECUTABLE=$(SOURCES:.S=)
DEST=../build

all: $(EXECUTABLE)

%.o: %.S
	$(CC) $(CFLAGS) $^ -o $(DEST)/$@

$(EXECUTABLE): % : %.o
	$(LD) $(LDFLAGS) $(DEST)/$^ -o $(DEST)/$@

clean:
	rm -f $(DEST)/*
