#!/bin/bash

echo "* lib setup:"

export P4EST_VERSION=1.1
if [ ! -d "p4est-$P4EST_VERSION" ]; then
mkdir p4est-building
cd p4est-building
wget http://p4est.github.io/release/p4est-$P4EST_VERSION.tar.gz && \
    wget http://www.dealii.org/developer/external-libs/p4est-setup.sh && \
    chmod +x p4est-setup.sh && \
    ./p4est-setup.sh p4est-$P4EST_VERSION.tar.gz ~/libs/p4est-$P4EST_VERSION && \
    cd .. && rm -rf p4est-building
fi
	
export HDF_VERSION=1.8.15-patch1
if [ ! -d "hdf5" ]; then
wget http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-$HDF_VERSION.tar.bz2 && \
    tar xjf hdf5-$HDF_VERSION.tar.bz2 && \
    cd hdf5-$HDF_VERSION &&  \
    ./configure --enable-parallel \
                --enable-shared \
                --prefix=$HOME/libs/hdf5/ && \
    make -j2 && make install && \
    cd .. && \
    rm -rf hdf5-$HDF_VERSION hdf5-$HDF_VERSION.tar.bz2 
fi

#Build Trilinos
export TRILINOS_VERSION=11.14.3
#wget http://trilinos.sandia.gov/download/files/trilinos-$TRILINOS_VERSION-Source.tar.bz2 && 
wget http://trilinos.csbsju.edu/download/files/trilinos-$TRILINOS_VERSION-Source.tar.gz && \
    tar xjf trilinos-$TRILINOS_VERSION-Source.tar.bz2 && \
    mkdir trilinos-$TRILINOS_VERSION-Source/build && \
    cd trilinos-$TRILINOS_VERSION-Source/build && \
    cmake -D Trilinos_ENABLE_Sacado=ON \
          -D Trilinos_ENABLE_Stratimikos=ON \
          -D CMAKE_BUILD_TYPE=RELEASE \
          -D CMAKE_CXX_FLAGS="-O3" \
          -D CMAKE_C_FLAGS="-O3" \
          -D CMAKE_FORTRAN_FLAGS="-O5" \
          -D Trilinos_EXTRA_LINK_FLAGS="-lgfortran" \
          -D CMAKE_VERBOSE_MAKEFILE=FALSE \
          -D Trilinos_VERBOSE_CONFIGURE=FALSE \
          -D TPL_ENABLE_MPI=ON \
          -D BUILD_SHARED_LIBS=ON \
          -D CMAKE_INSTALL_PREFIX:PATH=$HOME/libs/trilinos-$TRILINOS_VERSION \
	  .. && \
	  make -j4 && make install && \
	  cd .. && \
	  rm -rf trilinos-$TRILINOS_VERSION-Source trilinos-$TRILINOS_VERSION-Source.tar.bz2 

#petsc
export PETSC_VERSION=3.6.1
cd ~/libs && wget http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-$PETSC_VERSION.tar.gz && \
    tar xf petsc-lite-$PETSC_VERSION.tar.gz && rm -f petsc-lite-$PETSC_VERSION.tar.gz && \
    cd petsc-$PETSC_VERSION && \
    export PETSC_DIR=`pwd` && \
    ./configure --download-scalapack=1 --download-mumps=1 --download-metis --download-parmetis  \
    			  --with-shared-libraries=1 --with-clanguage=C++ --download-hypre=1  --with-x=0 --with-debugging=0 \
    			  COPTFLAGS='-O3' FOPTFLAGS='-O3' && \
    make all

	#--download-f-blas-lapack=1 --with-debugging=1