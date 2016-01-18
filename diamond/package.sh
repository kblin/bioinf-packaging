#!/bin/bash

VERSION="0.7.11"

fpm -s dir -t deb -n diamond -v ${VERSION} --iteration 1 -m "kblin@biosustain.dtu.dk" ./diamond=/usr/bin/diamond
