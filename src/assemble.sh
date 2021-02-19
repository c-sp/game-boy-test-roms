#!/usr/bin/env bash
set -e
#
# portable shebang:
# https://www.cyberciti.biz/tips/finding-bash-perl-python-portably-using-env.html
#
# bash on macos:
# https://itnext.io/upgrading-bash-on-macos-7138bd1066ba
#



###############################################################################
##
##   utility methods
##
###############################################################################

print_usage_and_exit()
{
    echo "usages:"
    echo "    $0 $CMD_BLARGG"
    echo "    $0 $CMD_DMG_ACID2"
    echo "    $0 $CMD_CGB_ACID2"
    echo "    $0 $CMD_GAMBATTE"
    echo "    $0 $CMD_MEALYBUG_TEAROOM_TESTS"
    echo "    $0 $CMD_MOONEYE_GB"
    echo "    $0 $CMD_RELEASE_ZIP <zip-file>"
    echo "    $0 $CMD_RGBDS"
    exit 1
}

mkdir_artifact()
{
    if [ -z "$1" ]; then
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
    if [ -z "$ARTIFACT_NAME" ]; then
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
    for f in *.tar*; do
        if [ -f "$f" ]; then
            tar -xvf "$f" && rm "$f"
        fi
    done
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



build_rgbds()
{
    ARTIFACT_NAME=rgbds
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    # build rgbds from source:
    # https://rgbds.gbdev.io/install/source
    REPO_RGBDS=$(mktemp -d)
    cd "$REPO_RGBDS"
    git clone https://github.com/rednex/rgbds.git .
    git checkout 8b60efa1495128301a407e93bd7c4ac0eb0b0f1e
    make

    cp rgbasm rgbfix rgbgfx rgblink "$ARTIFACT"

    tar_rm_artifact $ARTIFACT_NAME
}



build_dmg_acid2()
{
    # extract RGBDS artifacts
    cd "$ARTIFACTS_DIR"
    untar_all_artifacts
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=dmg-acid2
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO_DMG_ACID2=$(mktemp -d)
    cd "$REPO_DMG_ACID2"
    git clone --recurse-submodules https://github.com/mattcurrie/dmg-acid2 .
    git checkout 8a98ce731f96dde032ffb22ec36dc985d78fdb18
    make

    cp build/dmg-acid2.gb "$ARTIFACT"
    cp img/reference-cgb.png "$ARTIFACT/dmg-acid2-cgb.png"
    cp img/reference-dmg.png "$ARTIFACT/dmg-acid2-dmg.png"

    tar_rm_artifact $ARTIFACT_NAME
}



build_cgb_acid2()
{
    # extract RGBDS artifacts
    cd "$ARTIFACTS_DIR"
    untar_all_artifacts
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=cgb-acid2
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO_CGB_ACID2=$(mktemp -d)
    cd "$REPO_CGB_ACID2"
    git clone --recurse-submodules https://github.com/mattcurrie/cgb-acid2 .
    git checkout 76c4e2c42de62141dacc829232eb9e2531a79538
    make

    cp build/cgb-acid2.gbc "$ARTIFACT"
    cp img/reference.png "$ARTIFACT/cgb-acid2.png"

    tar_rm_artifact $ARTIFACT_NAME
}



build_mealybug_tearoom_tests()
{
    # extract RGBDS artifacts
    cd "$ARTIFACTS_DIR"
    untar_all_artifacts
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=mealybug-tearoom-tests
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO_MEALYBUG_TEAROOM_TESTS=$(mktemp -d)
    cd "$REPO_MEALYBUG_TEAROOM_TESTS"
    git clone https://github.com/mattcurrie/mealybug-tearoom-tests.git .
    git checkout 844b92ea59986cfb8a9bb66a94dd8c771aa113de
    make

    # Ubuntu (GitHub runner) symlinks "rename" to the Perl script "prename".
    # Fedora comes with the regular "rename".
    # As these two are not compatible and I thus would not be able
    # to test this script on my machine, we do this the hard way ...
    for f in expected/CPU\ CGB\ C/*.png; do
        mv -- "$f" "${f%.png}_cgb_c.png"
    done
    for f in expected/CPU\ CGB\ D/*.png; do
        mv -- "$f" "${f%.png}_cgb_d.png"
    done
    for f in expected/DMG-CPU\ B/*.png; do
        mv -- "$f" "${f%.png}_dmg_b.png"
    done
    for f in expected/DMG-blob/*.png; do
        mv -- "$f" "${f%.png}_dmg_blob.png"
    done

    cp build/*.gb "$ARTIFACT"
    cp expected/CPU\ CGB\ C/*.png "$ARTIFACT"
    cp expected/CPU\ CGB\ D/*.png "$ARTIFACT"
    cp expected/DMG-CPU\ B/*.png "$ARTIFACT"
    cp expected/DMG-blob/*.png "$ARTIFACT"

    tar_rm_artifact $ARTIFACT_NAME
}



create_release_zip()
{
    ZIP_FILE=$1
    if [ -z "$ZIP_FILE" ]; then
        print_usage_and_exit
    fi

    mkdir -p "$ARTIFACTS_DIR"
    cp README.md CHANGELOG.md "$ARTIFACTS_DIR"

    # remove old zip file
    cd "$ARTIFACTS_DIR"
    rm -rf "$ZIP_FILE"

    # create new zip file
    untar_all_artifacts
    rm -rf rgbds
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
CMD_RGBDS=rgbds
CMD_DMG_ACID2=dmg-acid2
CMD_CGB_ACID2=cgb-acid2
CMD_MEALYBUG_TEAROOM_TESTS=mealybug-tearoom-tests
CMD_RELEASE_ZIP=release-zip

# identify repository directories based on the path of this script
SCRIPT_DIR=$(dirname "$0")
REPO_DIR=$(cd "$SCRIPT_DIR/.." && pwd -P)
ARTIFACTS_DIR="$REPO_DIR/artifacts"
SRC_DIR="$REPO_DIR/src"

# check the first parameter
CMD=$1
if [ -n "$CMD" ]; then
    shift
fi

case ${CMD} in
    "${CMD_BLARGG}") assemble_blargg $@ ;;
    "${CMD_GAMBATTE}") assemble_gambatte $@ ;;
    "${CMD_MOONEYE_GB}") assemble_mooneye_gb $@ ;;
    "${CMD_RGBDS}") build_rgbds $@ ;;
    "${CMD_DMG_ACID2}") build_dmg_acid2 $@ ;;
    "${CMD_CGB_ACID2}") build_cgb_acid2 $@ ;;
    "${CMD_MEALYBUG_TEAROOM_TESTS}") build_mealybug_tearoom_tests $@ ;;
    "${CMD_RELEASE_ZIP}") create_release_zip $@ ;;

    *) print_usage_and_exit ;;
esac
