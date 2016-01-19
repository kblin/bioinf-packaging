#!/bin/bash
fpm -s python -t deb --iteration 1 -d 'libc6 >= 2.4' -d 'liblzma5 >= 5.1.1alpha+20110809' -d 'python << 2.8' -d 'python >= 2.7' -d 'python-support >= 0.90.0' backports.lzma
