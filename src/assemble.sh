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

    # delete old artifact
    # (dir and tar* file)
    rm -rf "$ART_DIR"*

    # create artifact dir
    mkdir -p "$ART_DIR"
    echo "$ART_DIR"
}

tar_rm_artifact()
{
    ARTIFACT_NAME=$1
    if ! [ -n "$ARTIFACT_NAME" ]; then
        echo "artifact name not specified"
        exit 1
    fi
    ART_DIR="$ARTIFACTS_DIR/$ARTIFACT_NAME"

    # tar artifact
    cd "$ARTIFACTS_DIR"
    tar -czf "$ARTIFACT_NAME.tar.gz" "$ARTIFACT_NAME"

    # remove untar'd artifact files as they
    # should not be uploaded
    rm -rf "$ARTIFACT_NAME"
}

untar_all_artifacts()
{
    # untar and remove all tar files in the current directory
    for f in *.tar*; do tar -xvf "$f" && rm "$f"; done
}



assemble_blargg()
{
    ARTIFACT_NAME=blargg
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO=$(mktemp -d)
    cd "$REPO"
    git clone https://github.com/retrio/gb-test-roms.git .
    git checkout c240dd7d700e5c0b00a7bbba52b53e4ee67b5f15

    shopt -s globstar
    cp --parents **/*.gb "$ARTIFACT"

    cd "$SRC_DIR/blargg-expected"
    cp --parents **/*.* "$ARTIFACT"

    tar_rm_artifact $ARTIFACT_NAME
}



assemble_gambatte()
{
    ARTIFACT_NAME=gambatte
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO=$(mktemp -d)
    cd "$REPO"
    git clone https://github.com/sinamas/gambatte.git .
    git checkout 56e3371151b5ee86dcdcf4868324ebc6de220bc9
    cd test
    ./assemble_tests.sh

    cd hwtests
    shopt -s globstar
    cp --parents **/*.gb "$ARTIFACT"
    cp --parents **/*.gbc "$ARTIFACT"
    cp --parents **/*.png "$ARTIFACT"

    tar_rm_artifact $ARTIFACT_NAME
}



assemble_mooneye_gb()
{
    ARTIFACT_NAME=mooneye-gb
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO_WLA_DX=$(mktemp -d)
    cd "$REPO_WLA_DX"
    git clone https://github.com/vhelin/wla-dx.git .
    git checkout de9a0fcdd093964696d873619a9a48102affa47e
    cmake -G "Unix Makefiles" .
    make wla-gb wlalink
    PATH="$REPO_WLA_DX/binaries:$PATH"

    REPO=$(mktemp -d)
    cd "$REPO"
    git clone https://github.com/Gekkio/mooneye-gb.git .
    git checkout 6b9488fa3e7da033a3c33c55ac94476c0e8368b0
    make -C tests clean all

    cd tests/build
    shopt -s globstar
    cp --parents **/*.gb "$ARTIFACT"

    tar_rm_artifact $ARTIFACT_NAME
}



create_release_zip()
{
    ZIP_FILE=$1
    if ! [ -n "$ZIP_FILE" ]; then
        print_usage_and_exit
    fi

    mkdir -p "$ARTIFACTS_DIR"
    cp README.md "$ARTIFACTS_DIR"

    # remove old zip file
    cd "$ARTIFACTS_DIR"
    rm -rf "$ZIP_FILE"

    # create new zip file
    untar_all_artifacts
    zip -r "$ZIP_FILE" .
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
