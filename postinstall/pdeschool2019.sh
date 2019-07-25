#!/bin/bash

DIR=~/pdeschool2019

if [ ! -d "$DIR" ]
then
   mkdir $DIR && cd $DIR && git clone https://github.com/tjhei/pdeschool.git .

else
    echo "$DIR exists..."
    cd $DIR
    if [ -d ".git" ]
    then
	git pull
    else
	echo "if this fails, please remove $DIR and run this script again"
	git clone https://github.com/tjhei/pdeschool.git .
    fi
fi

echo "updated $DIR."
