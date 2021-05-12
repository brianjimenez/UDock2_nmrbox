#!/bin/bash

# First compile glm
cd glm
rm -rf CMakeCache*
cmake .
cd ..

# Then UDock
rm -rf build
mkdir build
cd build
#export CXX=clang++
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/local/lib
#export LIBRARY_PATH=$LIBRARY_PATH:$HOME/UDock2_linux/src/bullet
cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON ..
make clean
make
rm -rf ../../release
mkdir ../../release
mv udock ../../release
cd ..
cp udock.sh ../release

echo "Done."
