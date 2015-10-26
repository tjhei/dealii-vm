#!/bin/bash

echo "deal setup"

rm -rf build installed

if [ ! -d "dealii/.git" ]; then
rm -rf dealii
git clone https://github.com/dealii/dealii.git
fi

cd dealii && git checkout v8.3.0 && cd ..

    mkdir build && cd build && \
    cmake -DDEAL_II_WITH_MPI=ON \
          -DDEAL_II_COMPONENT_EXAMPLES=OFF \
          -DCMAKE_INSTALL_PREFIX=~/deal.II/installed \
          -DP4EST_DIR=~/libs/p4est-1.1/ \
	  -D PETSC_DIR=~/libs/petsc-3.6.1/ \
	  -D PETSC_ARCH=arch-linux2-cxx-opt \
	  -D DEAL_II_WITH_PETSC=ON \
          -D TRILINOS_DIR=~/libs/trilinos-12.2.1/ \
	  -D DEAL_II_WITH_TRILINOS=ON \
          -DHDF5_DIR=~/libs/hdf5/ \
          ../dealii && \
    make -j2 && make install && \
    cd .. #&& rm -rf build
