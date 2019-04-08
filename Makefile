MANDIR ?= /usr/share/man
LIBDIR ?= /usr/lib64
export LIBDIR

help:
	@echo "Vanir GUI main Makefile:" ;\
	    echo "make all                  <--- build binaries";\
	    echo "make all                  <--- install files into \$$DESTDIR";\
	    echo "make clean                <--- clean all the binary files";\
	    @exit 0;

all: gui-daemon/vanir-guid shmoverride/shmoverride.so shmoverride/X-wrapper-vanir \
		pulse/pacat-simple-vchan screen-layout-handler/watch-screen-layout-changes

gui-daemon/vanir-guid:
	(cd gui-daemon; $(MAKE))

shmoverride/shmoverride.so:
	(cd shmoverride; $(MAKE) shmoverride.so)

shmoverride/X-wrapper-vanir:
	(cd shmoverride; $(MAKE) X-wrapper-vanir)
	
pulse/pacat-simple-vchan:
	$(MAKE) -C pulse pacat-simple-vchan

screen-layout-handler/watch-screen-layout-changes:
	$(MAKE) -C screen-layout-handler watch-screen-layout-changes

install:
	install -D gui-daemon/vanir-guid $(DESTDIR)/usr/bin/vanir-guid
	install -m 0644 -D gui-daemon/vanir-guid.1 $(DESTDIR)$(MANDIR)/man1/vanir-guid.1
	install -D pulse/pacat-simple-vchan $(DESTDIR)/usr/bin/pacat-simple-vchan
	install -D -m 0644 pulse/pacat-control-api.xml $(DESTDIR)/usr/share/dbus-1/interfaces/org.vos.Audio.xml
	install -D -m 0644 pulse/org.vos.Audio.conf $(DESTDIR)/etc/dbus-1/system.d/org.vos.Audio.conf
	install -D shmoverride/X-wrapper-vanir $(DESTDIR)/usr/bin/X-wrapper-vanir
	install -D shmoverride/shmoverride.so $(DESTDIR)$(LIBDIR)/vanir-gui-daemon/shmoverride.so
	install -D -m 0644 gui-daemon/guid.conf $(DESTDIR)/etc/vanir/guid.conf
	install -D gui-daemon/vanir-localgroup.sh $(DESTDIR)/etc/X11/xinit/xinitrc.d/vanir-localgroup.sh
	install -D -m 0644 gui-daemon/vanir.ClipboardPaste.policy $(DESTDIR)/etc/vanir-rpc/policy/vanir.ClipboardPaste
	install -D screen-layout-handler/watch-screen-layout-changes $(DESTDIR)/usr/libexec/vanir/watch-screen-layout-changes
	install -D -m 0644 screen-layout-handler/vanir-screen-layout-watches.desktop $(DESTDIR)/etc/xdg/autostart/vanir-screen-layout-watches.desktop
	$(MAKE) -C window-icon-updater install

tar:
	git archive --format=tar --prefix=vanir-gui/ HEAD -o vanir-gui.tar

clean:
	(cd common; $(MAKE) clean)
	(cd gui-common; $(MAKE) clean)
	(cd gui-daemon; $(MAKE) clean)
	(cd shmoverride; $(MAKE) clean)
	$(MAKE) -C pulse clean

