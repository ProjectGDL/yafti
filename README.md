# Yafti Portal

Yafti GTK portal for Project GDL, containing configuration, UI, and installation utilities.

## Installation

### Using Make

```bash
# Default installation to /usr
make install

# Installation with custom prefix
make install PREFIX=/usr/local

# Installation to staging directory
make install DESTDIR=/tmp/staging PREFIX=/usr

# Uninstall
make uninstall
```

## Running

```bash
yafti_gtk.py /usr/share/yafti/yafti.yml
```

Edit `system/usr/share/yafti/yafti.yml` to customize:
- Portal title and screens
- Available actions and options
- Icons and descriptions

Add translations in `system/usr/share/yafti/locale/<lang>.yml`.

