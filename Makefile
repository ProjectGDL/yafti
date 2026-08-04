.PHONY: install uninstall clean

PREFIX ?= /usr
DESTDIR ?=

# Paths
YAFTI_DATADIR = $(DESTDIR)$(PREFIX)/share/yafti
YAFTI_BINDIR = $(DESTDIR)$(PREFIX)/bin
YAFTI_APPDIR = $(DESTDIR)$(PREFIX)/share/applications

# Source paths
SRC_ICONS = system/usr/share/yafti/icons
SRC_LOCALE = system/usr/share/yafti/locale
SRC_YAFTI_YML = system/usr/share/yafti/yafti.yml
SRC_YAFTI_GTK = system/usr/bin/yafti_gtk.py
SRC_DESKTOP = system/usr/share/applications/io.github.ublue_os.yafti_gtk.desktop

install: install-yafti install-yafti-gtk install-desktop

install-yafti:
	mkdir -p $(YAFTI_DATADIR)/icons $(YAFTI_DATADIR)/locale
	cp $(SRC_YAFTI_YML) $(YAFTI_DATADIR)/
	cp -r $(SRC_ICONS)/* $(YAFTI_DATADIR)/icons/
	cp -r $(SRC_LOCALE)/* $(YAFTI_DATADIR)/locale/

install-yafti-gtk:
	mkdir -p $(YAFTI_BINDIR)
	cp $(SRC_YAFTI_GTK) $(YAFTI_BINDIR)/
	chmod 755 $(YAFTI_BINDIR)/yafti_gtk.py

install-desktop:
	mkdir -p $(YAFTI_APPDIR)
	cp $(SRC_DESKTOP) $(YAFTI_APPDIR)/

uninstall:
	rm -rf $(YAFTI_DATADIR)
	rm -f $(YAFTI_BINDIR)/yafti_gtk.py
	rm -f $(YAFTI_APPDIR)/io.github.ublue_os.yafti_gtk.desktop
	rm -rf $(DESTDIR)$(PREFIX)/libexec/yafti

clean:
	# Nothing to clean for yafti

help:
	@echo "Yafti Installation Makefile"
	@echo ""
	@echo "Targets:"
	@echo "  install       - Install all yafti files"
	@echo "  uninstall     - Remove all installed yafti files"
	@echo "  clean         - Clean build artifacts (N/A for yafti)"
	@echo ""
	@echo "Variables:"
	@echo "  PREFIX        - Installation prefix (default: /usr)"
	@echo "  DESTDIR       - Staging directory (default: empty)"
	@echo ""
	@echo "Examples:"
	@echo "  make install"
	@echo "  make install PREFIX=/usr/local"
	@echo "  make install DESTDIR=/tmp/staging PREFIX=/usr"
