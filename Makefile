#Compiler Flags
CC=gcc
CFALGS=-g -Wall

#Directories
SRC=src
OBJ=obj

#Pattern matching
#get all .c file matching from SRC directory and stores in SRCS variable
SRCS=$(wildcard $(SRC)/%.c))

# search for the pattren *.c [First argument] in SRCS [Third argument]
# and substitute with  *.o [Second argument] i.e For the *.c source files in SRC gereate the *.o files matching the pattern
# This is eleminate the all listing the object files
# OBJS=obj/allocator.o obj/memtest.o 
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))

BINDIR=bin
BIN=$(BINDIR)/main
SUBMITPROJ=project.zip

all:$(BIN)

#release: CFLAGS=-Wall -O2 -DNDEBUG
#release: clean
#release: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CFALGS) $(OBJS) -o $@
	
$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(CFALGS) -c $< -o $@


submit:
#	$(RM) -r $(SUBMITPROJ)
	del $(SUBMITPROJ)
	zip $(SUBMITPROJ) $(BIN)

clean:
	del $(OBJ)\*.o $(BINDIR)\*.exe
#	@echo '%PATH%'
#	@echo '$(OS)'
#	ifeq ($(OS),Windows_NT)
#		del /s *.o *.d *.elf *.map *.log *.exe
#	endif
