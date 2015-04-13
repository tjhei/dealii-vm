#!/bin/bash

echo "deal setup"

rm -rf build installed

if [ ! -d "dealii/.git" ]; then
rm -rf dealii
git clone https://github.com/dealii/dealii.git
fi

cd dealii && git checkout v8.2.1 && cd ..

    mkdir build && cd build && \
    cmake -DDEAL_II_WITH_MPI=ON \
          -DDEAL_II_COMPONENT_EXAMPLES=OFF \
          -DCMAKE_INSTALL_PREFIX=~/deal.II/installed \
          -DCMAKE_BUILD_TYPE=Debug \
          -DP4EST_DIR=~/libs/p4est-0.3.4.2/ \
	  -DPETSC_DIR=~/libs/petsc-3.4.5/ \
	  -DPETSC_ARCH=arch-linux2-cxx-debug \
          -DTRILINOS_DIR=~/libs/trilinos-11.8.1/ \
          -DHDF5_DIR=~/libs/hdf5/ \
          ../dealii && \
    make -j2 && make install && \
    cd .. #&& rm -rf build
