#!/bin/bash

REPO="https://raw.githubusercontent.com/tjhei/dealii-vm/master/postinstall"

if [ "$#" -ne 1 ]; then
    echo "usage: $0 <eventname>"
    echo "List of events:"
    wget -q -O - $REPO/list
    exit 1
fi

event=$1
wget -q -O - $REPO/$event.sh >~/bin/$event.sh || { echo "ERROR: can not download $REPO/$event.sh"; false; } || exit 1

echo "downloaded $event.sh script. Executing..."

~/bin/$event.sh || exit 2
