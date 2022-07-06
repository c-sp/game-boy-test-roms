# Mealybug Tearoom Tests

[Mealybug Tearoom Tests](https://github.com/mattcurrie/mealybug-tearoom-tests)
are compiled with [RGBDS](https://github.com/gbdev/rgbds).

## Game Boy Devices & SoC Revisions

[Device specific results](https://github.com/mattcurrie/mealybug-tearoom-tests/tree/master/expected)
are provided as screenshots
(note that we copy these screenshots next to the respective test roms when
bundling a release zip).

## Exit Condition

Each test rom executes opcode `0x40: LD B, B` when finished.

## Test Success/Failure

Test success/failure has to be determined by screenshot comparison.

To create comparable screenshots,
your emulator should calculate colors as follows:
- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- each CGB 5 bit RGB channel is converted to 8 bits using the formula
  `(X << 3) | (X >> 2)`
- LCD shades for CGB compatibility mode are:
    - background: `#000000`, `#0063C6`, `#7BFF31` and `#FFFFFF`
    - objects: `#000000`, `#943939`, `#FF8484` and `#FFFFFF`
