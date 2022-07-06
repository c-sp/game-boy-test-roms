# AGE test roms

[AGE test roms](https://github.com/c-sp/age-test-roms) are compiled with
[RGBDS](https://github.com/gbdev/rgbds).

## Game Boy Devices & SoC Revisions

Tests have been verified on
[DMG-CPU-08 (DMG-CPU C blob)](https://gbhwdb.gekkio.fi/consoles/dmg),
[CPU-CGB-02 (CPU CGB B), CPU-CGB-04 (CPU CGB C) and CPU-CGB-06 (CPU CGB E)](
https://gbhwdb.gekkio.fi/consoles/cgb).
Test file names indicate compatible devices and SoC revisions.

## Exit Condition

Each test rom executes opcode `0x40: LD B, B` once finished.

## Test Success/Failure

Tests capable of automatically verifying for success or failure set the
Game Boy's CPU registers to the following Fibonacci numbers on success:
`B = 3, C = 5, D = 8, E = 13, H = 21, L = 34`.
Failure is indicated by any different values.

### Screenshot based tests

For some tests success or failure cannot be verified automatically.
In that case,
screenshot comparison is used instead.
Screenshots of the expected test results are available for different Game Boy
devices and SoC revisions.
They match the respective test's file name.

To create comparable screenshots,
your emulator should calculate colors as follows:
- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- each CGB 5 bit RGB channel is converted to 8 bits using the formula
  `(X << 3) | (X >> 2)`
- LCD shades for CGB compatibility mode are:
    - background: `#000000`, `#0063C6`, `#7BFF31` and `#FFFFFF`
    - objects: `#000000`, `#943939`, `#FF8484` and `#FFFFFF`
