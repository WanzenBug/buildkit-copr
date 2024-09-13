NAME := buildkit
VERSION ?= $(shell rpmspec -q --srpm --queryformat='%{version}' ./buildkit.spec)

DEBIAN_SOURCES := $(wildcard debian/**)

export DEBEMAIL = $(shell git show --format="%aE" -s HEAD)
export DEBAUTHOR = $(shell git show --format="%aN" -s HEAD)

debbuild: buildkit_$(VERSION).orig.tar.gz debian/changelog
	rm -rf ./buildkit-$(VERSION)/
	tar -xf buildkit_$(VERSION).orig.tar.gz
	cp -a ./debian ./buildkit-$(VERSION)/

.PHONY: debian/changelog
debian/changelog:
	gbp dch --ignore-branch -R

buildkit-$(VERSION): buildkit-$(VERSION).tar.gz
	rm -rf $@
	tar -xf $<

buildkit-$(VERSION)/debian: $(DEBIAN_SOURCES)

buildkit-$(VERSION).tar.gz: buildkit.spec
	rpmdev-spectool -g $<

buildkit_$(VERSION).orig.tar.gz: buildkit-$(VERSION).tar.gz
	ln -snf $< $@
