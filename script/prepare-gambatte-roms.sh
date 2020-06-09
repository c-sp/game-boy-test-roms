#!/bin/sh -e

REPO_GAMBATTE=repo-gambatte
GAMBATTE=gambatte

mkdir "$REPO_GAMBATTE"
mkdir "$GAMBATTE"

# clone gambatte & make test roms
cd "$REPO_GAMBATTE"
git clone https://github.com/sinamas/gambatte.git .
git checkout f93c5be1a47e8c355e7d87938c00f03224340279
cd test
./assemble_tests.sh

# TODO copy compiled test roms to "gambatte" directory to be used as job artifact
