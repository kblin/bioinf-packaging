#!/bin/bash

VERSION="2.6.1"

fpm -s dir -t deb -n prodigal -v ${VERSION} --iteration 1 -m "kblin@biosustain.dtu.dk" ./Prodigal-${VERSION}/prodigal=/usr/bin/prodigal
