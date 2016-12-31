#!/bin/bash

VERSION="2.6.3"

wget https://github.com/hyattpd/Prodigal/releases/download/v${VERSION}/prodigal.linux -O prodigal
chmod a+x prodigal

fpm -s dir -t deb -n prodigal -v ${VERSION} --iteration 1 -m "kblin@biosustain.dtu.dk" ./prodigal=/usr/bin/prodigal
