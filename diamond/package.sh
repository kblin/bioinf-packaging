#!/bin/bash

VERSION="0.8.31"

wget https://github.com/bbuchfink/diamond/releases/download/v${VERSION}/diamond-linux64.tar.gz
tar xf diamond-linux64.tar.gz diamond

fpm -s dir -t deb -n diamond -v ${VERSION} --iteration 2 -m "kblin@biosustain.dtu.dk" ./diamond=/usr/bin/diamond

rm diamond-linux64.tar.gz diamond
