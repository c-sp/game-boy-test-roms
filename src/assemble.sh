#!/bin/bash -e



###############################################################################
##
##   utility methods
##
###############################################################################

print_usage_and_exit()
{
    echo "usages:"
    echo "    $0 $CMD_BLARGG"
    echo "    $0 $CMD_GAMBATTE"
    echo "    $0 $CMD_MOONEYE_GB"
    echo "    $0 $CMD_RELEASE_ZIP <zip-file>"
    exit 1
}


mkdir_artifact()
{
    if ! [ -n "$1" ]; then
        echo "artifact name not specified"
        exit 1
    fi
    ART_DIR="$ARTIFACTS_DIR/$1"

    # delete old artifact dir
    if [ -e "$ART_DIR" ]; then
        rm -rf "$ART_DIR"
    fi

    # create artifact dir
    mkdir -p "$ART_DIR"
    echo "$ART_DIR"
}


assemble_blargg()
{
    REPO=$(mktemp -d)
    ARTIFACT=$(mkdir_artifact blargg)

    cd "$REPO"
    git clone https://github.com/retrio/gb-test-roms.git .
    git checkout c240dd7d700e5c0b00a7bbba52b53e4ee67b5f15

    shopt -s globstar
    cp --parents **/*.gb "$ARTIFACT"

    cd "$SRC_DIR/blargg-expected"
    cp --parents **/*.* "$ARTIFACT"
}


assemble_gambatte()
{
    REPO=$(mktemp -d)
    ARTIFACT=$(mkdir_artifact gambatte)

    cd "$REPO"
    git clone https://github.com/sinamas/gambatte.git .
    git checkout f93c5be1a47e8c355e7d87938c00f03224340279
    cd test
    ./assemble_tests.sh

    cd hwtests
    shopt -s globstar
    cp --parents **/*.gb "$ARTIFACT"
    cp --parents **/*.gbc "$ARTIFACT"
    cp --parents **/*.png "$ARTIFACT"
}


assemble_mooneye_gb()
{
    REPO_WLA_DX=$(mktemp -d)
    REPO=$(mktemp -d)
    ARTIFACT=$(mkdir_artifact mooneye-gb)

    cd "$REPO_WLA_DX"
    git clone https://github.com/vhelin/wla-dx.git .
    git checkout b4ebbc32601e7462a84728c93954573f245e94f2
    cmake -G "Unix Makefiles" .
    make
    PATH="$PATH:$REPO_WLA_DX/binaries"

    cd "$REPO"
    git clone https://github.com/Gekkio/mooneye-gb.git .
    git checkout 7cb040d0b7a418bf9063754a448ec72ae1d4c422
    make -C tests clean all

    cd tests/build
    shopt -s globstar
    cp --parents **/*.gb "$ARTIFACT"
}



create_release_zip()
{
    if ! [ -n "$1" ]; then
        print_usage_and_exit
    fi

    mkdir -p "$ARTIFACTS_DIR"
    cp README.md "$ARTIFACTS_DIR"

    cd "$ARTIFACTS_DIR"
    zip -r "$1" .
}



###############################################################################
##
##   script starting point
##
###############################################################################

CMD_BLARGG=blargg-roms
CMD_GAMBATTE=gambatte-roms
CMD_MOONEYE_GB=mooneye-gb-roms
CMD_RELEASE_ZIP=release-zip

# identify repository directories based on the path of this script
SCRIPT_DIR=`dirname $0`
REPO_DIR=`cd "$SCRIPT_DIR/.." && pwd -P`
ARTIFACTS_DIR="$REPO_DIR/artifacts"
SRC_DIR="$REPO_DIR/src"

# check the first parameter
CMD=$1
if [ -n "$CMD" ]; then
    shift
fi

case ${CMD} in
    ${CMD_BLARGG}) assemble_blargg $@ ;;
    ${CMD_GAMBATTE}) assemble_gambatte $@ ;;
    ${CMD_MOONEYE_GB}) assemble_mooneye_gb $@ ;;
    ${CMD_RELEASE_ZIP}) create_release_zip $@ ;;

    *) print_usage_and_exit ;;
esac
