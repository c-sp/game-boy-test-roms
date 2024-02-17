# Turtle Tests

[Turtle Tests](https://github.com/Powerlated/TurtleTests)
are compiled with [RGBDS](https://github.com/gbdev/rgbds).

## Game Boy Devices & SoC Revisions

I could not find any information on Game Boy hardware compatibility for this test suite.
However,
no timing edge cases seem to be involved here,
so these tests will probably run on any DMG and CGB.

## Exit Condition

Running the test run for half a second emulated time or around 30 frames is sufficient.

## Test Success/Failure

Test success/failure can be determined by
[screenshot](https://github.com/c-sp/gameboy-test-roms/tree/master/src/turtle-tests/)
comparison.

To create comparable screenshots,
your emulator should calculate colors as follows:

- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- LCD shades for CGB compatibility mode are:
  - background: `#000000`, `#0063C6`, `#7BFF31` and `#FFFFFF`
  - objects: `#000000`, `#943939`, `#FF8484` and `#FFFFFF`
