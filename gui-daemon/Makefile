CC=gcc
CFLAGS+=-I../include/ -g -O2 -Wall -Wextra -Werror -pie -fPIC \
		`pkg-config --cflags libconfig` \
		`pkg-config --cflags libnotify` \
		`pkg-config --cflags libpng` \
		`pkg-config --cflags vchan-$(BACKEND_VMM)`
OBJS=xside.o png.o trayicon.o ../gui-common/double-buffer.o ../gui-common/txrx-vchan.o \
	../gui-common/error.o ../common/list.o

all: vanir-guid vanir-guid.1
vanir-guid: $(OBJS)
	$(CC) -g -pie -o vanir-guid $(OBJS) \
		-lX11 -lXext -Wall -lm \
		`pkg-config --libs vchan-$(BACKEND_VMM)` \
		`pkg-config --libs libpng` \
		`pkg-config --libs libconfig` \
		`pkg-config --libs libnotify`

vanir-guid.1: vanir-guid
	help2man --version-string=`cat ../version` --no-info --name="Vanir GUI daemon" ./vanir-guid  > vanir-guid.1

clean:
	rm -f vanir-guid *.o *~
