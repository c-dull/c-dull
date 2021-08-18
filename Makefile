LD = gcc
CC = gcc

CFLAGS := \
	-Isrc/include \
	-Wall \
	-Wextra \
	-Wno-unused-variable\
	-Wno-unused-but-set-variable\
	-Wno-unused-value\
	-Wno-unused-parameter\
	-Wno-return-type\
	-std=gnu99 \

CFILES := $(shell find src/ -name '*.c')
OFILES := $(CFILES:.c=.o)

TARGET = c_dull

all: clean compile

compile: ld
	@ echo "Done!"
	
ld: $(OFILES)
	@ echo "[ LD ] $^"
	@ $(LD) $^ -o $(TARGET)

%.o: %.c
	@ echo "[ CC ] $<"
	@ $(CC) $(CFLAGS) -c $< -o $@

clean:
	@ echo "[ CLEAN ]"
	@ rm -rf $(OFILES) $(TARGET)

run:
	@ ./c_dull