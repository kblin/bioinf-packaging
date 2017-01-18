#!/bin/bash

VERSION="4.11.2"

INSTALLDIR=$(pwd)/build

pushd meme_$VERSION

# Fix install statements to support DESTDIR
sed -i Makefile.in -e "s#mkdir -p \$(MEME_DB)#mkdir -p \$(DESTDIR)\$(MEME_DB)#"
sed -i Makefile.in -e "s#mkdir -p \$(MEME_LOGS)#mkdir -p \$(DESTDIR)\$(MEME_LOGS)#"
sed -i Makefile.in -e "s#chmod a+w \$(MEME_LOGS)#chmod a+w \$(DESTDIR)\$(MEME_LOGS)#"

# Actually run the build
./configure --prefix=/usr --with-db=/var/lib/meme/db --with-logs=/var/log/meme --sysconfdir=/var/lib/meme/web --libdir=/var/lib/meme
make install DESTDIR=$INSTALLDIR
popd

# Last but not least, package it
fpm -s dir -t deb -n meme-suite -v $VERSION -C $INSTALLDIR usr/bin var/lib var/log
