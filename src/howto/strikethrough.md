# Strikethrough

[Strikethrough](https://github.com/Hacktix/strikethrough.gb) is compiled with
[RGBDS](https://github.com/gbdev/rgbds).

## Game Boy Devices & SoC Revisions

I could not find any compatibility information on Strikethrough.
It works on all of my devices though
([DMG-CPU-08 (DMG-CPU C blob)](https://gbhwdb.gekkio.fi/consoles/dmg),
[CPU-CGB-02 (CPU CGB B), CPU-CGB-04 (CPU CGB C) and CPU-CGB-06 (CPU CGB E)](
https://gbhwdb.gekkio.fi/consoles/cgb)).

## Exit Condition

Running the test run for half a second emulated time is sufficient.

## Test Success/Failure

[Screenshots](https://github.com/c-sp/gameboy-test-roms/tree/master/src/strikethrough-expected)
of the expected test results are available.

To create comparable screenshots,
your emulator should calculate colors as follows:
- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- each CGB 5 bit RGB channel is converted to 8 bits using the formula
  `(X << 3) | (X >> 2)`
