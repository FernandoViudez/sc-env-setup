#!/usr/bin/env bash

mkdir -p ./build/

# clean build folder
rm -f ./build/*.teal

set -e # die on error

# "$1" is the first argument when executing this script
# for example, if ./build.sh contracts.donarion_sm
# then "$1" will be replaced with > "contracts.donarion_sm" 
python ./compile.py "$1" ./build/approval.teal ./build/clear.teal
