# MBC3 Bank Tester

The [MBC3 Bank Tester](https://github.com/EricKirschenmann/MBC3-Tester-gb)
is compiled with [RGBDS](https://github.com/gbdev/rgbds).

## Game Boy Devices & SoC Revisions

Untested on real hardware but it should work on all revisions since it tests a cartridge.

## Exit Condition

This tests loops indefinitely. The result can be checked after first 40 frames.

## Test Success/Failure

Test success/failure can be determined by
[a screenshot](https://github.com/c-sp/gameboy-test-roms/tree/master/src/mbc3-tester-expected/)
comparison.
Note that on CGB the test runs in "CGB compatibility mode".

To create comparable screenshots,
your emulator should calculate colors as follows:

- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- LCD shades for CGB compatibility mode are:
  - background: `#000000`, `#0063C6`, `#7BFF31` and `#FFFFFF`
  - objects: `#000000`, `#943939`, `#FF8484` and `#FFFFFF`
