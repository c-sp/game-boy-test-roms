# Strikethrough

[Strikethrough](https://github.com/Hacktix/strikethrough.gb) is compiled with
[RGBDS](https://github.com/gbdev/rgbds).

## Game Boy Devices & SoC Revisions

[//]: # (TODO strikethrough: devices & SoC revisions)

## Exit Condition

Running the test run for half a second emulated time is sufficient.

## Test Success/Failure

[A screenshot](https://github.com/c-sp/gameboy-test-roms/tree/master/src/strikethrough-expected)
of the expected test result is available.

To create comparable screenshots,
your emulator should calculate colors as follows:
- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- each CGB 5 bit RGB channel is converted to 8 bits using the formula
  `(X << 3) | (X >> 2)`
