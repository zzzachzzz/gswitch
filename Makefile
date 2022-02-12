all:

install:
	mkdir -p ${DESTDIR}/usr/bin
	cp gswitch ${DESTDIR}/usr/bin/gswitch
	chmod +x ${DESTDIR}/usr/bin/gswitch
	mkdir -p ${DESTDIR}/usr/share/gswitch
	cp xorg.template.conf ${DESTDIR}/usr/share/gswitch/xorg.template.conf
	mkdir -p ${DESTDIR}/etc/systemd/system
	cp gswitch.service ${DESTDIR}/etc/systemd/system/gswitch.service
	systemctl daemon-reload

uninstall:
	rm -f ${DESTDIR}/etc/systemd/system/gswitch.service
	rm -f ${DESTDIR}/etc/X11/99-gswitch-host.conf
	rm -f ${DESTDIR}/etc/X11/99-gswitch-host.conf.skip
	rm -f ${DESTDIR}/etc/X11/99-gswitch-guest.conf
	rm -f ${DESTDIR}/etc/X11/99-gswitch-guest.conf.skip
	rm -rf ${DESTDIR}/usr/share/gswitch
	rm -f ${DESTDIR}/usr/bin/gswitch
	systemctl daemon-reload
