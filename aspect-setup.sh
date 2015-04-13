#!/bin/bash
rm -rf CMakeCache.txt aspect cmake_install.cmake CMakeFiles/
cmake -G "Eclipse CDT4 - Unix Makefiles" .
