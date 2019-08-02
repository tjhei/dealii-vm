#!/bin/bash

echo "installing visit..."

cd ~/bin
rm -rf visit*
wget -q "http://portal.nersc.gov/svn/visit/trunk/releases/2.8.2/visit2_8_2.linux-x86_64-ubuntu11.tar.gz"
tar xf visit2_8_2.linux-x86_64-ubuntu11.tar.gz
rm visit2_8_2.linux-x86_64-ubuntu11.tar.gz

echo "done."
