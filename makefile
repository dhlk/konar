INTERNAL := download.bash
SYSTEMD := konar@.service konar@.timer

install:
	install -Dm755 -t "$(DESTDIR)/$(PREFIX)/lib/konar" $(INTERNAL)
	install -Dm644 -t "$(DESTDIR)/$(PREFIX)/lib/systemd/system" $(SYSTEMD)
	install -Dm644 sysusers.d.conf "$(DESTDIR)/$(PREFIX)/lib/sysusers.d/konar.conf"
