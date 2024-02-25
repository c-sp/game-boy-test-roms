#!/usr/bin/env bash
set -e

SCRIPT_DIR=$(dirname "$0")

"$SCRIPT_DIR/assemble.sh" rgbds
"$SCRIPT_DIR/assemble.sh" wla-dx

"$SCRIPT_DIR/assemble.sh" age-test-roms
"$SCRIPT_DIR/assemble.sh" blargg-roms
"$SCRIPT_DIR/assemble.sh" bully
"$SCRIPT_DIR/assemble.sh" cgb-acid2
"$SCRIPT_DIR/assemble.sh" cgb-acid-hell
"$SCRIPT_DIR/assemble.sh" dmg-acid2
"$SCRIPT_DIR/assemble.sh" gambatte-roms
"$SCRIPT_DIR/assemble.sh" gbmicrotest
"$SCRIPT_DIR/assemble.sh" little-things-gb
"$SCRIPT_DIR/assemble.sh" mbc3-tester
"$SCRIPT_DIR/assemble.sh" mealybug-tearoom-tests
"$SCRIPT_DIR/assemble.sh" mooneye-test-suite
"$SCRIPT_DIR/assemble.sh" mooneye-test-suite-wilbertpol
"$SCRIPT_DIR/assemble.sh" rtc3test
"$SCRIPT_DIR/assemble.sh" same-suite
"$SCRIPT_DIR/assemble.sh" scribbltests
"$SCRIPT_DIR/assemble.sh" strikethrough
"$SCRIPT_DIR/assemble.sh" turtle-tests

"$SCRIPT_DIR/assemble.sh" release-zip master.zip
