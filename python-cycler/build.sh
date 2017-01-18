#!/bin/bash
pip3 install --upgrade pip

#fpm -s python -t deb --iteration 1 cycler
fpm -s python -t deb --python-pip /usr/local/bin/pip3 --python-bin /usr/bin/python3 --iteration 1 --name python3-cycler cycler
