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
$ sudo apt-add-repository ppa:wanzenbug/buildkit
...
$ sudo apt-get install buildkit
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
