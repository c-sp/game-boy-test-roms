#!/bin/sh -e

REPO_WLA_DX=repo-wla-dx
REPO_MOONEYE_GB=repo-mooneye-gb
MOONEYE_GB=mooneye-gb

mkdir "$REPO_WLA_DX"
mkdir "$REPO_MOONEYE_GB"
mkdir "$MOONEYE_GB"

# clone & make wla-dx
cd "$REPO_WLA_DX"
git clone https://github.com/vhelin/wla-dx.git .
git checkout d9a3237cc2a15c45e5dfde80b3ee6c6467c70beb
cmake -G "Unix Makefiles" .
make install

# clone Mooneye GB &  make test roms
cd "../$REPO_MOONEYE_GB"
git clone https://github.com/Gekkio/mooneye-gb.git .
git checkout 7cb040d0b7a418bf9063754a448ec72ae1d4c422
make -C tests clean all

# TODO copy compiled test roms to "mooneye-gb" directory to be used as job artifact
