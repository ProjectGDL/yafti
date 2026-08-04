# Yafti Portal

Yafti GTK portal for Project GDL, containing configuration, UI, and installation utilities.

## Structure

- `system/` - Files to be installed to system paths
  - `usr/bin/` - Executable Python scripts
  - `usr/share/applications/` - Desktop files
  - `usr/share/yafti/` - Portal data (config, icons, locales)
- `scripts/` - Installation and patching scripts

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

### Manual Installation

```bash
# Install portal data
mkdir -p /usr/share/yafti/{icons,locale}
cp system/usr/share/yafti/yafti.yml /usr/share/yafti/
cp -r system/usr/share/yafti/icons/* /usr/share/yafti/icons/
cp -r system/usr/share/yafti/locale/* /usr/share/yafti/locale/

# Install GTK application
cp system/usr/bin/yafti_gtk.py /usr/bin/
chmod 755 /usr/bin/yafti_gtk.py

# Install desktop file
mkdir -p /usr/share/applications
cp system/usr/share/applications/io.github.ublue_os.yafti_gtk.desktop /usr/share/applications/

# Install helper scripts
mkdir -p /usr/libexec/yafti
cp scripts/*.sh /usr/libexec/yafti/
chmod 755 /usr/libexec/yafti/*.sh
```

## Running

```bash
yafti_gtk.py /usr/share/yafti/yafti.yml
```

With language override:

```bash
yafti_gtk.py /usr/share/yafti/yafti.yml --lang ru
```

## Integration with Base OS

In base-os recipe, add:

```yaml
modules:
  - type: files
    src: relative/yafti
    dest: /root/yafti-build

  - type: shell
    commands:
      - cd /root/yafti-build && make install DESTDIR=/ PREFIX=/usr
      - bash /root/yafti-build/scripts/patch-yafti-breeze.sh
      - rm -rf /root/yafti-build
```

## Configuration

Edit `system/usr/share/yafti/yafti.yml` to customize:
- Portal title and screens
- Available actions and options
- Icons and descriptions

Add translations in `system/usr/share/yafti/locale/<lang>.yml`.

## License

See LICENSE in the parent repository.
