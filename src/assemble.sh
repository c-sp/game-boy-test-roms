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
    echo "usage:"
    echo "    $0 $CMD_AGE_TEST_ROMS"
    echo "    $0 $CMD_BLARGG"
    echo "    $0 $CMD_BULLY"
    echo "    $0 $CMD_CGB_ACID2"
    echo "    $0 $CMD_CGB_ACID_HELL"
    echo "    $0 $CMD_DMG_ACID2"
    echo "    $0 $CMD_GAMBATTE"
    echo "    $0 $CMD_GBMICROTEST"
    echo "    $0 $CMD_LITTLE_THINGS_GB"
    echo "    $0 $CMD_MBC3_TESTER"
    echo "    $0 $CMD_MEALYBUG_TEAROOM_TESTS"
    echo "    $0 $CMD_MOONEYE_TEST_SUITE"
    echo "    $0 $CMD_MOONEYE_TEST_SUITE_WILBERTPOL"
    echo "    $0 $CMD_RELEASE_ZIP <zip-file>"
    echo "    $0 $CMD_RGBDS"
    echo "    $0 $CMD_RTC3TEST"
    echo "    $0 $CMD_SAME_SUITE"
    echo "    $0 $CMD_SCRIBBLTESTS"
    echo "    $0 $CMD_STRIKETHROUGH"
    echo "    $0 $CMD_TURTLE_TESTS"
    echo "    $0 $CMD_WLA_DX"
    exit 1
}

print_cmd_title()
{
    echo "---------------------------------------------------------"
    echo "$CMD"
    echo "---------------------------------------------------------"
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
    rm -r "$ART_DIR"
    rm -f "$ART_DIR".*

    # create artifact dir
    mkdir -p "$ART_DIR"
    echo "$ART_DIR"
}



###############################################################################
##
##   builds
##
###############################################################################

build_age_test_roms()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/rgbds/"*
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=age-test-roms
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO_AGE_TEST_ROMS=$(mktemp -d)
    cd "$REPO_AGE_TEST_ROMS"
    git clone https://github.com/c-sp/age-test-roms.git .
    git checkout cd3f654d13bf7137fa4f7fb7e5dd041d10f7098e

    rgbasm -V
    make

    cp README.md "$ARTIFACT"
    cd build
    rsync -am --include='*.gb' --include='*/' --exclude='*' ./ "$ARTIFACT"
    rsync -am --include='*.png' --include='*/' --exclude='*' ./ "$ARTIFACT"
    rsync -am --include='*.md' --include='*/' --exclude='*' ./ "$ARTIFACT"

    # remove _in-progress/ as these tests are not finished yet
    rm -rf "$ARTIFACT/_in-progress"

    cp "$SRC_DIR/howto/age-test-roms.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_blargg()
{
    print_cmd_title

    ARTIFACT_NAME=blargg
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO=$(mktemp -d)
    cd "$REPO"
    git clone https://github.com/retrio/gb-test-roms.git .
    git checkout c240dd7d700e5c0b00a7bbba52b53e4ee67b5f15

    rsync -am --include='*.gb' --include='*/' --exclude='*' ./ "$ARTIFACT"
    cp readme.txt "$ARTIFACT"

    cd "$SRC_DIR/blargg-expected"
    rsync -am ./ "$ARTIFACT"

    cp "$SRC_DIR/howto/blargg.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_bully()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/rgbds/"*
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=bully
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO=$(mktemp -d)
    cd "$REPO"
    git clone https://github.com/Hacktix/BullyGB.git .
    git checkout e24fe6fd7f3fbc6021e3ee7f0f29e9166fce5937

    make

    cp bully.gb README.md logo.png "$ARTIFACT"
    cd "$SRC_DIR"
    cp bully-expected/bully.png "$ARTIFACT"

    cp "$SRC_DIR/howto/bully.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_cgb_acid2()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/rgbds/"*
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=cgb-acid2
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO_CGB_ACID2=$(mktemp -d)
    cd "$REPO_CGB_ACID2"
    git clone --recurse-submodules https://github.com/mattcurrie/cgb-acid2 .
    git checkout 04c6ca40cf75b6a93513fe596de4ab797efaff97

    rgbasm -V
    make

    cp README.md "$ARTIFACT"
    cp build/cgb-acid2.gbc "$ARTIFACT"
    cp img/reference.png "$ARTIFACT/cgb-acid2.png"

    cp "$SRC_DIR/howto/cgb-acid2.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_cgb_acid_hell()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/rgbds/"*
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=cgb-acid-hell
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO_CGB_ACID_HELL=$(mktemp -d)
    cd "$REPO_CGB_ACID_HELL"
    git clone https://github.com/mattcurrie/cgb-acid-hell.git .
    git checkout 107b7c5a875f26473ebc1193e32c59394bdd3049

    # The GitHub Ubuntu runner does not know any "md5" command
    # (Ubuntu comes with "md5sum" instead).
    # We comment out the "md5" step in the Makefile ...
    sed -i.bak "s/md5/#md5/" Makefile

    rgbasm -V
    make

    cp README.md "$ARTIFACT"
    cp cgb-acid-hell.gbc "$ARTIFACT"
    cp img/reference.png "$ARTIFACT/cgb-acid-hell.png"

    cp "$SRC_DIR/howto/cgb-acid-hell.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_dmg_acid2()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/rgbds/"*
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=dmg-acid2
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO_DMG_ACID2=$(mktemp -d)
    cd "$REPO_DMG_ACID2"
    git clone --recurse-submodules https://github.com/mattcurrie/dmg-acid2 .
    git checkout 8a98ce731f96dde032ffb22ec36dc985d78fdb18

    rgbasm -V
    make

    cp README.md "$ARTIFACT"
    cp build/dmg-acid2.gb "$ARTIFACT"
    cp img/reference-cgb.png "$ARTIFACT/dmg-acid2-cgb.png"
    cp img/reference-dmg.png "$ARTIFACT/dmg-acid2-dmg.png"

    cp "$SRC_DIR/howto/dmg-acid2.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_gambatte_hwtests()
{
    print_cmd_title

    ARTIFACT_NAME=gambatte
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO=$(mktemp -d)
    cd "$REPO"
    git clone https://github.com/pokemon-speedrunning/gambatte-core.git .
    git checkout d819bad196942db6bc31fd4196b911584c415594
    cd test
    chmod +x ./scripts/assemble_tests.sh
    ./scripts/assemble_tests.sh

    cd hwtests
    rsync -am --include='*.gb' --include='*/' --exclude='*' ./ "$ARTIFACT"
    rsync -am --include='*.gbc' --include='*/' --exclude='*' ./ "$ARTIFACT"
    rsync -am --include='*.png' --include='*/' --exclude='*' ./ "$ARTIFACT"
    cd "$REPO"
    cp README "$ARTIFACT"

    cp "$SRC_DIR/howto/gambatte.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_gbmicrotest()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/wla-dx/"*
    PATH="$ARTIFACTS_DIR/wla-dx:$PATH"

    ARTIFACT_NAME=gbmicrotest
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO=$(mktemp -d)
    cd "$REPO"
    pwd
    git clone https://github.com/aappleby/GBMicrotest.git .
    git checkout f3b55497c1d1202c784b8201dafc888c838b7302

    rm -f bin/*
    ./build.sh

    cp bin/* "$ARTIFACT"
    cp "$SRC_DIR/howto/gbmicrotest.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_little_things_gb()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/rgbds/"*
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=little-things-gb
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO=$(mktemp -d)
    cd "$REPO"
    git clone https://github.com/pinobatch/little-things-gb.git .
    git checkout c4785ad0b9635da7704cc56051e9df552e9e454a

    make firstwhite/firstwhite.gb tellinglys/tellinglys.gb

    cp firstwhite/firstwhite.gb "$ARTIFACT"
    cp firstwhite/README.md "$ARTIFACT/firstwhite-readme.md"
    cp tellinglys/tellinglys.gb "$ARTIFACT"
    cp tellinglys/README.md "$ARTIFACT/tellinglys-readme.md"

    cd "$SRC_DIR"
    cp little-things-gb-expected/*.png "$ARTIFACT"

    cp "$SRC_DIR/howto/little-things-gb.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}


build_mbc3_tester()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/rgbds/"*
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=mbc3-tester
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO=$(mktemp -d)
    cd "$REPO"
    git clone https://github.com/EricKirschenmann/MBC3-Tester-gb.git .
    git checkout 40065adab0e2a5597621bb7e7e4812d0e0f43da7

    cd disassembly
    # The GitHub Ubuntu runner does not know any "md5" command
    # (Ubuntu comes with "md5sum" instead).
    # We comment out the "md5" step in the Makefile ...
    sed -i.bak "s/md5/#md5/" Makefile
    make all
    cd -

    cp disassembly/game.gb "$ARTIFACT/mbc3-tester.gb"
    cp README.md "$ARTIFACT/mbc3-tester-readme.md"

    cd "$SRC_DIR"
    cp mbc3-tester-expected/*.png "$ARTIFACT"

    cp "$SRC_DIR/howto/mbc3-tester.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}


build_mealybug_tearoom_tests()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/rgbds/"*
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=mealybug-tearoom-tests
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO_MEALYBUG_TEAROOM_TESTS=$(mktemp -d)
    cd "$REPO_MEALYBUG_TEAROOM_TESTS"
    git clone --recurse-submodules https://github.com/mattcurrie/mealybug-tearoom-tests.git .
    git checkout 70e88fb90b59d19dfbb9c3ac36c64105202bb1f4

    rgbasm -V
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

    cp README.md "$ARTIFACT"
    cd build
    rsync -am --include='*.gb' --include='*/' --exclude='*' ./ "$ARTIFACT"

    cd ..
    cp expected/CPU\ CGB\ C/*.png "$ARTIFACT/ppu"
    cp expected/CPU\ CGB\ D/*.png "$ARTIFACT/ppu"
    cp expected/DMG-CPU\ B/*.png "$ARTIFACT/ppu"
    cp expected/DMG-blob/*.png "$ARTIFACT/ppu"

    # remove screenshot placeholders
    rm "$ARTIFACT/ppu/m3_lcdc_win_en_change_multiple_wx_cgb_c.png"
    rm "$ARTIFACT/ppu/m3_wx_4_change_cgb_c.png"
    rm "$ARTIFACT/ppu/m3_wx_5_change_cgb_c.png"
    rm "$ARTIFACT/ppu/m3_wx_6_change_cgb_c.png"
    rm "$ARTIFACT/ppu/m3_lcdc_win_en_change_multiple_wx_cgb_d.png"
    rm "$ARTIFACT/ppu/m3_wx_4_change_cgb_d.png"
    rm "$ARTIFACT/ppu/m3_wx_5_change_cgb_d.png"
    rm "$ARTIFACT/ppu/m3_wx_6_change_cgb_d.png"

    cp "$SRC_DIR/howto/mealybug-tearoom-tests.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_mooneye_test_suite()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/wla-dx/"*
    PATH="$ARTIFACTS_DIR/wla-dx:$PATH"

    ARTIFACT_NAME=mooneye-test-suite
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO=$(mktemp -d)
    cd "$REPO"
    git clone https://github.com/Gekkio/mooneye-test-suite.git .
    git checkout 443f6e1f2a8d83ad9da051cbb960311c5aaaea66
    make clean all

    cp README.markdown "$ARTIFACT"
    rsync -am --include='*.png' --include='*/' --exclude='*' ./ "$ARTIFACT"
    cd build
    rsync -am --include='*.gb' --include='*/' --exclude='*' ./ "$ARTIFACT"

    cd "$SRC_DIR/mooneye-test-suite-expected"
    rsync -am ./ "$ARTIFACT"
    rm -f "$ARTIFACT/manual-only/sprite_priority-expected.png"

    cp "$SRC_DIR/howto/mooneye-test-suite.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_mooneye_test_suite_wilbertpol()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/wla-dx/"*
    PATH="$ARTIFACTS_DIR/wla-dx:$PATH"

    ARTIFACT_NAME=mooneye-test-suite-wilbertpol
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO=$(mktemp -d)
    cd "$REPO"
    git clone https://github.com/vojty/wilbertpol-test-suite.git .
    git checkout 325f8e80775cdce408d6d827910c5657c8f0504e
    make clean all

    cp README.markdown "$ARTIFACT"
    cd build
    rsync -am --include='*.gb' --include='*/' --exclude='*' ./ "$ARTIFACT"

    cp "$SRC_DIR/howto/mooneye-test-suite-wilbertpol.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_release_zip()
{
    print_cmd_title

    ZIP_FILE=$1
    if [ -z "$ZIP_FILE" ]; then
        print_usage_and_exit
    fi

    mkdir -p "$ARTIFACTS_DIR"
    cp "$REPO_DIR/README.md" "$REPO_DIR/CHANGELOG.md" "$ARTIFACTS_DIR"

    # remove old zip file
    cd "$ARTIFACTS_DIR"
    rm -rf "$ZIP_FILE"

    # create new zip file
    rm -rf rgbds wla-dx
    zip -r "$ZIP_FILE" .
}



build_rgbds()
{
    print_cmd_title

    ARTIFACT_NAME=rgbds
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    # build rgbds from source:
    # https://rgbds.gbdev.io/install/source
    #
    # As of 2023-07-24 a lot of test rom source code is not compatible
    # to RGBDS 0.6 (e.g. dmc-acid2, cgb-acid2, bully), which is why we still
    # default to RGBDS 0.5.
    REPO_RGBDS=$(mktemp -d)
    cd "$REPO_RGBDS"
    git clone https://github.com/gbdev/rgbds.git .
    git checkout v0.5.2
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build

    cp build/src/rgbasm build/src/rgbfix build/src/rgbgfx build/src/rgblink "$ARTIFACT"
}



build_rtc3test()
{
    print_cmd_title

    # use RGBDS 0.4 as rtc3test is not compatible to RGBDS 0.5
    # (RGBDS 0.5 "PRINT" macro vs. rtc3test "Print:" label)
    REPO_RGBDS=$(mktemp -d)
    cd "$REPO_RGBDS"
    git clone https://github.com/gbdev/rgbds.git .
    git checkout v0.4.2
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build build
    PATH="$REPO_RGBDS/build/src:$PATH"

    ARTIFACT_NAME=rtc3test
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO_RTC3TEST=$(mktemp -d)
    cd "$REPO_RTC3TEST"
    git clone https://github.com/aaaaaa123456789/rtc3test.git .
    git checkout 80ae792bf1b3c3387929b912e6df001af3511e24

    rgbasm -V
    make

    cp rtc3test.gb "$ARTIFACT"
    cp README.md "$ARTIFACT"
    cp tests.md "$ARTIFACT"

    cd "$SRC_DIR"
    cp rtc3test-expected/*.png "$ARTIFACT"

    cp "$SRC_DIR/howto/rtc3test.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_same_suite()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/rgbds/"*
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=same-suite
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO_SAME_SUITE=$(mktemp -d)
    cd "$REPO_SAME_SUITE"
    git clone https://github.com/LIJI32/SameSuite.git .
    git checkout f71b4b3c3773b771f94955f5081dd2b36aabe54d

    rgbasm -V
    make

    rsync -am --include='*.gb' --include='*/' --exclude='*' ./ "$ARTIFACT"
    rsync -am --include='README.md' --include='*/' --exclude='*' ./ "$ARTIFACT"

    cp "$SRC_DIR/howto/same-suite.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_scribbltests()
{
    print_cmd_title

    ARTIFACT_NAME=scribbltests
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO=$(mktemp -d)
    cd "$REPO"
    git clone https://github.com/Hacktix/scribbltests.git .
    git checkout 96dd2f14bc8cce1fd5df25427056e059a175e9f7

    rsync -am --include='*.gb' --include='*/' --exclude='*' ./ "$ARTIFACT"
    rsync -am --include='README.md' --include='*/' --exclude='*' ./ "$ARTIFACT"

    cd "$SRC_DIR/scribbltests-expected"
    rsync -am ./ "$ARTIFACT"

    cp "$SRC_DIR/howto/scribbltests.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_strikethrough()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/rgbds/"*
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=strikethrough
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO=$(mktemp -d)
    cd "$REPO"
    git clone https://github.com/Hacktix/strikethrough.gb.git .
    git checkout 7cd01bf91665b85809379b71e655da751809994e

    make

    cp strikethrough.gb README.md "$ARTIFACT"
    cd "$SRC_DIR"
    cp strikethrough-expected/strikethrough*.png "$ARTIFACT"

    cp "$SRC_DIR/howto/strikethrough.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_turtle_tests()
{
    print_cmd_title

    chmod +x "$ARTIFACTS_DIR/rgbds/"*
    PATH="$ARTIFACTS_DIR/rgbds:$PATH"

    ARTIFACT_NAME=turtle-tests
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO=$(mktemp -d)
    cd "$REPO"
    git clone https://github.com/Powerlated/TurtleTests.git .
    git checkout b341ff54ec1e6a501d37dd309c556b6968a07eec

    make

    cp README.md "$ARTIFACT"
    cd src
    rsync -am --include='*.gb' --include='*/' --exclude='*' ./ "$ARTIFACT"

    cd "$SRC_DIR/turtle-tests-expected"
    rsync -am ./ "$ARTIFACT"

    cp "$SRC_DIR/howto/turtle-tests.md" "$ARTIFACT/game-boy-test-roms-howto.md"
}



build_wla_dx()
{
    print_cmd_title

    ARTIFACT_NAME=wla-dx
    ARTIFACT=$(mkdir_artifact $ARTIFACT_NAME)

    REPO_WLA_DX=$(mktemp -d)
    cd "$REPO_WLA_DX"
    git clone https://github.com/vhelin/wla-dx.git .
    git checkout 89a90a56be5c2b8cf19a9afa3e1b32384ddb1a97
    # in case of this error (e.g. on macOS):
    #     wlalink/write.c:3576:26: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
    # use another compiler, e.g.
    #     ./assemble.sh wla-dx -DCMAKE_C_COMPILER=/usr/local/bin/gcc-13
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 "$@" .
    make wla-gb wlalink

    cp binaries/wla-gb binaries/wlalink "$ARTIFACT"
}



###############################################################################
##
##   script starting point
##
###############################################################################

CMD_AGE_TEST_ROMS=age-test-roms
CMD_BLARGG=blargg-roms
CMD_BULLY=bully
CMD_CGB_ACID2=cgb-acid2
CMD_CGB_ACID_HELL=cgb-acid-hell
CMD_DMG_ACID2=dmg-acid2
CMD_GAMBATTE=gambatte-roms
CMD_GBMICROTEST=gbmicrotest
CMD_LITTLE_THINGS_GB=little-things-gb
CMD_MBC3_TESTER=mbc3-tester
CMD_MEALYBUG_TEAROOM_TESTS=mealybug-tearoom-tests
CMD_MOONEYE_TEST_SUITE=mooneye-test-suite
CMD_MOONEYE_TEST_SUITE_WILBERTPOL=mooneye-test-suite-wilbertpol
CMD_RELEASE_ZIP=release-zip
CMD_RGBDS=rgbds
CMD_RTC3TEST=rtc3test
CMD_SAME_SUITE=same-suite
CMD_SCRIBBLTESTS=scribbltests
CMD_STRIKETHROUGH=strikethrough
CMD_TURTLE_TESTS=turtle-tests
CMD_WLA_DX=wla-dx

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
    "${CMD_AGE_TEST_ROMS}") build_age_test_roms "$@" ;;
    "${CMD_BLARGG}") build_blargg "$@" ;;
    "${CMD_BULLY}") build_bully "$@" ;;
    "${CMD_CGB_ACID2}") build_cgb_acid2 "$@" ;;
    "${CMD_CGB_ACID_HELL}") build_cgb_acid_hell "$@" ;;
    "${CMD_DMG_ACID2}") build_dmg_acid2 "$@" ;;
    "${CMD_GAMBATTE}") build_gambatte_hwtests "$@" ;;
    "${CMD_GBMICROTEST}") build_gbmicrotest "$@" ;;
    "${CMD_LITTLE_THINGS_GB}") build_little_things_gb "$@" ;;
    "${CMD_MBC3_TESTER}") build_mbc3_tester "$@" ;;
    "${CMD_MEALYBUG_TEAROOM_TESTS}") build_mealybug_tearoom_tests "$@" ;;
    "${CMD_MOONEYE_TEST_SUITE}") build_mooneye_test_suite "$@" ;;
    "${CMD_MOONEYE_TEST_SUITE_WILBERTPOL}") build_mooneye_test_suite_wilbertpol "$@" ;;
    "${CMD_RELEASE_ZIP}") build_release_zip "$@" ;;
    "${CMD_RGBDS}") build_rgbds "$@" ;;
    "${CMD_RTC3TEST}") build_rtc3test "$@" ;;
    "${CMD_SAME_SUITE}") build_same_suite "$@" ;;
    "${CMD_SCRIBBLTESTS}") build_scribbltests "$@" ;;
    "${CMD_STRIKETHROUGH}") build_strikethrough "$@" ;;
    "${CMD_TURTLE_TESTS}") build_turtle_tests "$@" ;;
    "${CMD_WLA_DX}") build_wla_dx "$@" ;;

    *) print_usage_and_exit ;;
esac
