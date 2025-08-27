#!/bin/bash
rm -rf build
mkdir build
cd build
cmake -D ASPECT_UNITY_BUILD=OFF ..

ln -sf ~/home/aspect/build/aspect ~/aspect/aspect-debug
ln -sf ~/home/aspect/build/aspect-release ~/aspect/
