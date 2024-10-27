#!/bin/bash

echo "* lib setup:"

cd candi
PACKAGES="load:dealii-prepare"
PACKAGES="${PACKAGES} once:cmake"
#PACKAGES="${PACKAGES} once:adolc"
#PACKAGES="${PACKAGES} once:arpack-ng"
#PACKAGES="${PACKAGES} once:assimp"
#PACKAGES="${PACKAGES} once:ginkgo"
PACKAGES="${PACKAGES} once:gmsh"
#PACKAGES="${PACKAGES} once:gsl"
#PACKAGES="${PACKAGES} once:mumps"
PACKAGES="${PACKAGES} once:opencascade"
PACKAGES="${PACKAGES} once:parmetis"
PACKAGES="${PACKAGES} once:sundials"
#PACKAGES="${PACKAGES} once:superlu_dist"
PACKAGES="${PACKAGES} once:hdf5"
PACKAGES="${PACKAGES} once:netcdf"
PACKAGES="${PACKAGES} once:p4est"
PACKAGES="${PACKAGES} once:trilinos"
PACKAGES="${PACKAGES} once:petsc"
PACKAGES="${PACKAGES} once:slepc"
PACKAGES="${PACKAGES} once:astyle"
#PACKAGES="${PACKAGES} dealii"

./candi.sh -j4 -p ~/libs --packages="$PACKAGES"


echo "* cleanup:"
rm -rf ~/libs/tmp
