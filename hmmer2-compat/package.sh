#!/bin/bash
fpm -s dir -t deb -n hmmer2-compat -v 0.0.1 --description 'hmm2* to hmm*2 aliases for backwards compatibility' -d hmmer2 links/=/usr/bin
