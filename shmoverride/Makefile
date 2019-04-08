LIBDIR ?= /usr/lib64
CFLAGS+=-g -O2 -I../include/ -fPIC -Wall -Wextra -Werror \
		-DBACKEND_VMM_$(BACKEND_VMM) \
		-DSHMOVERRIDE_LIB_PATH=\"$(LIBDIR)/vanir-gui-daemon/shmoverride.so\"
CC=gcc

all: shmoverride.so X-wrapper-vanir

shmoverride.so: shmoverride.o list.o
	gcc -shared -o shmoverride.so \
		shmoverride.o list.o -ldl -lxenctrl -lxengnttab

list.o: ../common/list.c
	$(CC) $(CFLAGS) -shared -c -o list.o ../common/list.c

X-wrapper-vanir: X-wrapper-vanir.o

clean:
	rm -f *~ *.o shmoverride.so X-wrapper-vanir
