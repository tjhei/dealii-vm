#!/bin/bash

echo "* lib setup:"

cd candi
./candi.sh -j4 -p ~/libs

echo "* cleanup:"
rm -rf ~/libs/tmp
