#!/bin/bash

#############################################################
# (c) 2022, Dipl.-Inf. T. Bergmann - astares.com
#############################################################

#
if [[ $# -eq 0 ]] ; then
    echo 'Provide the absolute file path as an argument'
    exit 0
fi

BUILD_PATH="$1/build"

# If there is an old build directory then remove it
if [ -d build ]; then 
    echo "Removing old build directory $BUILD_PATH"
    rm -Rf "$BUILD_PATH" 
fi

mkdir "$BUILD_PATH"
cd "$BUILD_PATH"

# Download
wget -O- https://get.pharo.org/64/100+vm | bash

./pharo-ui ./Pharo.image eval "
|creator repo|
Author uniqueInstance fullName: 'TorstenBergmann'.

creator := IceRepositoryCreator new.
repo := creator repository.
repo 
    name: 'Themis';
    location: '$1' asFileReference.

repo register

"
