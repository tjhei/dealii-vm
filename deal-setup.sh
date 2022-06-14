#!/bin/bash

echo "deal setup"

rm -rf build installed

if [ ! -d "dealii/.git" ]; then
  rm -rf dealii
  git clone https://github.com/dealii/dealii.git
  cd dealii && git checkout v9.3.3 && cd ..
fi


mkdir build && cd build && \
    cmake -D DEAL_II_WITH_MPI=ON \
          -D DEAL_II_COMPONENT_EXAMPLES=OFF \
          -D CMAKE_INSTALL_PREFIX=~/deal.II/installed \
          -D DEAL_II_WITH_P4EST=ON \
          -D DEAL_II_WITH_PETSC=ON \
          -D DEAL_II_WITH_TRILINOS=ON \
          -D DEAL_II_WITH_HDF5=ON \
          ../dealii && \
    make -j2 && make install && \
    make clean &&
    cd .. #&& rm -rf build
