# Packages for [buildkit](https://github.com/moby/buildkit)

## Fedora

```
$ sudo dnf copr enable wanzenbug/buildkit
...
$ sudo dnf install buildkit
...
$ sudo systemctl enable buildkit.socket
```

## Ubuntu

```

```

### Development

To build RPM packages, use `fedpkg`:

```
$ fedpkg --release f40 local
...
```

To build Debian packages, use `make` and `debuild`:

```
$ make
$ cd buildkit-*/
$ debuild
```
