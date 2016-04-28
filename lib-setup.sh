#!/bin/bash

echo "* lib setup:"

cd candi
PACKAGES="load:dealii-prepare"
PACKAGES="${PACKAGES} once:opencascade"
PACKAGES="${PACKAGES} once:parmetis"
#PACKAGES="${PACKAGES} once:superlu_dist"
PACKAGES="${PACKAGES} once:hdf5"
PACKAGES="${PACKAGES} once:p4est"
PACKAGES="${PACKAGES} once:trilinos"
PACKAGES="${PACKAGES} once:petsc"
PACKAGES="${PACKAGES} once:slepc"
#PACKAGES="${PACKAGES} dealii"

./candi.sh -j4 -p ~/libs --packages="$PACKAGES"


echo "* cleanup:"
rm -rf ~/libs/tmp
