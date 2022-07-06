# firstwhite

[Firstwhite](https://github.com/pinobatch/little-things-gb/tree/master/firstwhite)
is compiled with [RGBDS](https://github.com/gbdev/rgbds).

## Game Boy Devices & SoC Revisions

According to the
[project's readme](https://github.com/pinobatch/little-things-gb/tree/master/firstwhite#readme),
the test should succeed on about every Game Boy device except for
the Super Game Boy.

## Exit Condition

In my experience the test result is visible nearly immediately.
Terminating the test after half a second emulated time should be sufficient.

## Test Success/Failure

The test succeeds when only a white screen is visible.
[A screenshot](https://github.com/c-sp/gameboy-test-roms/tree/master/src/firstwhite-expected)
is available for convenience reasons.

To create comparable screenshots,
your emulator should calculate colors as follows:
- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- each CGB 5 bit RGB channel is converted to 8 bits using the formula
  `(X << 3) | (X >> 2)`
