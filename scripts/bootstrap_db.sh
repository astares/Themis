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

# Build and data directory
BUILD_PATH="$1/build"
SCRIPT_PATH="$1/scripts"
DATA_PATH="$1/data"

sqlite3 -init $SCRIPT_PATH/bootstrap_data.sql $DATA_PATH/themis.db
