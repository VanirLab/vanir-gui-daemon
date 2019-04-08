all:
	@true

install:
	install -D icon-receiver $(DESTDIR)/usr/lib/vanir/icon-receiver
	install -m 0644 -D vanir.WindowIconUpdater $(DESTDIR)/etc/vanir-rpc
	install -m 0664 -D vanir.WindowIconUpdater.policy $(DESTDIR)/etc/vanir-rpc/policy/vanir.WindowIconUpdater
