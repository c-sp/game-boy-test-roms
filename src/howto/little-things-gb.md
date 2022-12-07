# (parts of) little-things-gb

[little-things-gb](https://github.com/pinobatch/little-things-gb) is compiled
with [RGBDS](https://github.com/gbdev/rgbds).

## Game Boy Devices & SoC Revisions

### firstwhite

According to the
[firstwhite readme](https://github.com/pinobatch/little-things-gb/tree/master/firstwhite#readme),
the test should succeed on about every Game Boy device except for
the Super Game Boy.

### Telling LYs

According to the
[Telling LYs readme](https://github.com/pinobatch/little-things-gb/tree/master/tellinglys#telling-lys),
the test should succeed on about every (Super) Game Boy device.
However,
Super Game Boy input seems to be a poor entropy source.

## Exit Condition

### firstwhite

In my experience the test result is visible nearly immediately.
Terminating the test after half a second emulated time should be sufficient.

### Telling LYs

In order to pass the test you will have to emulate pressing all Game Boy
buttons one after another in arbitrary order.
Afterwards the test still needs some time until the "pass" screen is displayed.
5 seconds emulated time after the last button press should be enough.

## Test Success/Failure

Test success/failure can be determined by
[A screenshot](https://github.com/c-sp/gameboy-test-roms/tree/master/src/little-things-gb-expected)
comparison.

To create comparable screenshots,
your emulator should calculate colors as follows:
- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- each CGB 5 bit RGB channel is converted to 8 bits using the formula
  `(X << 3) | (X >> 2)`
- LCD shades for CGB compatibility mode are:
  - background: `#000000`, `#0063C6`, `#7BFF31` and `#FFFFFF`
  - objects: `#000000`, `#943939`, `#FF8484` and `#FFFFFF`
