#!/bin/bash

#############################################################
# 
# This script downloads Pharo and loads the application
#
#############################################################
# (c) 2022, Dipl.-Inf. T. Bergmann - astares.com
#############################################################

# Check for the base directory to be given as argument
if [[ $# -eq 0 ]] ; then
    echo 'Provide the absolute file path as an argument'
    exit 0
fi

# Build directory
BUILD_PATH="$1/build"

# If there is an old build directory then remove it
if [ -d build ]; then 
    echo "Removing old build directory $BUILD_PATH"
    rm -Rf "$BUILD_PATH" 
fi

# Create and switch to build directory
mkdir "$BUILD_PATH"
cd "$BUILD_PATH"

# Download Pharo using ZeroConf (http://get.pharo.org)
wget -O- https://get.pharo.org/64/100+vm | bash

# Start Pharo with the load script
./pharo-ui ./Pharo.image ../scripts/load.st
