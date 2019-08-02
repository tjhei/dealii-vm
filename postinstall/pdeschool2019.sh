#!/bin/bash

DIR=~/pdeschool2019

if [ ! -d "$DIR" ]
then
    sudo apt-get install gv
    echo "export PATH=$PATH:/home/ubuntu/bin/qtcreator-4.9.0/bin" >> ~/.bash_aliases
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
