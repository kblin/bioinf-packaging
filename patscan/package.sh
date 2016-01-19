#!/bin/bash

set -o errexit

if [ ! -e scan_for_matches.tgz ]; then
    wget http://www.theseed.org/servers/downloads/scan_for_matches.tgz
fi

if [ ! -d scan_for_matches ]; then
    tar xf scan_for_matches.tgz
fi

if [ ! -e scan_for_matches/scan_for_matches ]; then
    pushd scan_for_matches >/dev/null
    ./configure
    make
    popd
fi

fpm -s dir -t deb -n patscan -v 2.0 --iteration 1 -m "kblin@biosustain.dtu.dk" scan_for_matches/scan_for_matches=/usr/bin/patscan scan_for_matches/show_hits=/usr/bin/patscan_show_hits
