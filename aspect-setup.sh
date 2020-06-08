#!/bin/bash
rm -rf build
mkdir build
cd build
cmake ..

ln -sf ~/home/aspect/build/aspect ~/aspect/
