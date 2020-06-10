#!/bin/sh -e



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
    exit 1
}


mkdir_artifact()
{
    if ! [ -n "$1" ]; then
        echo "artifact name not specified"
        exit 1
    fi
    ART_DIR="$ARTIFACTS_DIR/$1"

    # delete old artifact
    if [ -e "$ART_DIR" ]; then
        rm -rf "$ART_DIR"
    fi

    # create artifact dir
    mkdir -p "$ART_DIR"
    echo "$ART_DIR"
}


assemble_blargg()
{
    REPO=$(mkdir_artifact repo-gb-test-roms)
    ARTIFACT=$(mkdir_artifact blargg)

    cd "$REPO"
    git clone https://github.com/retrio/gb-test-roms.git .
    git checkout c240dd7d700e5c0b00a7bbba52b53e4ee67b5f15

    shopts -s globstar
    cp -R -p **/*.gb "$ARTIFACT"

    cd "$SRC_DIR"
    cp -R -p blargg-expected/** "$ARTIFACT"
}


assemble_gambatte()
{
    REPO=$(mkdir_artifact repo-gambatte)
    ARTIFACT=$(mkdir_artifact gambatte)

    cd "$REPO"
    git clone https://github.com/sinamas/gambatte.git .
    git checkout f93c5be1a47e8c355e7d87938c00f03224340279
    cd test
    ./assemble_tests.sh

    shopts -s globstar
    cp -R -p **/*.gb "$ARTIFACT"
    cp -R -p **/*.gbc "$ARTIFACT"
    cp -R -p **/*.cgb "$ARTIFACT"
    # TODO copy screenshots
}


assemble_mooneye_gb()
{
    REPO_WLA_DX=$(mkdir_artifact repo-wla-dx)
    REPO=$(mkdir_artifact repo-mooneye-gb)
    ARTIFACT=$(mkdir_artifact mooneye-gb)

    cd "$REPO_WLA_DX"
    git clone https://github.com/vhelin/wla-dx.git .
    git checkout d9a3237cc2a15c45e5dfde80b3ee6c6467c70beb
    cmake -G "Unix Makefiles" .
    make
    # TODO add wla-dx binaries to PATH

    cd "$REPO"
    git clone https://github.com/Gekkio/mooneye-gb.git .
    git checkout 7cb040d0b7a418bf9063754a448ec72ae1d4c422
    make -C tests clean all

    # TODO copy files to $ARTIFACT
}



###############################################################################
##
##   script starting point
##
###############################################################################

CMD_BLARGG=blargg
CMD_GAMBATTE=gambatte
CMD_MOONEYE_GB=mooneye-gb

# determine the artifact directory based on the path of this script
SCRIPT_DIR=`dirname $0`
ARTIFACTS_DIR=`cd "$SCRIPT_DIR/../artifacts" && pwd -P`
SRC_DIR=`cd "$SCRIPT_DIR/../src" && pwd -P`

# check the first parameter
case ${$1} in
    ${CMD_BLARGG}) assemble_blargg ;;
    ${CMD_GAMBATTE}) assemble_gambatte ;;
    ${CMD_MOONEYE_GB}) assemble_mooneye_gb ;;

    *) print_usage_and_exit ;;
esac
