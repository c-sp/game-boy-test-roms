# Mooneye Test Suite

The [Mooneye Test Suite](https://github.com/Gekkio/mooneye-test-suite/)
is compiled with [WLA DX](https://github.com/vhelin/wla-dx).

## Game Boy Devices & SoC Revisions

Tests limited to specific Game Boy models will contain a hint in their file
name.
For example,
`acceptance/boot_regs-dmgABC.gb` succeeds only on
[DMG-CPU A, B and C](https://gbhwdb.gekkio.fi/consoles/dmg) devices and
`acceptance/boot_regs-sgb.gb` works only on
[Super Game Boy](https://gbhwdb.gekkio.fi/consoles/sgb) devices.
See [Test naming](https://github.com/Gekkio/mooneye-test-suite#test-naming)
for further details.

## Exit Condition

Each Mooneye test rom executes opcode `0x40: LD B, B` when finished.
The maximal runtime for a test is 120 emulated seconds (see
[mooneye_suite.rs](https://github.com/Gekkio/mooneye-gb/blob/66c6e027111dbabcdc68350f3a80d7148bf9dc68/core/tests/mooneye_suite.rs#L198)).

## Test Success/Failure

A test succeeds,
if the Game Boy's CPU registers contain the following Fibonacci numbers:
`B = 3, C = 5, D = 8, E = 13, H = 21, L = 34`.

### Screenshot based tests

At the time of writing,
`manual-only/sprite_priority.gb` is the only test requiring screenshot
comparison to detect success/failure.
As already indicated by its directory name,
it is not part of [Mooneye's automatic test suite](
https://github.com/Gekkio/mooneye-gb/blob/3856dcbca82a7d32bd438cc92fd9693f868e2e23/core/tests/mooneye_suite.rs#L78).

The provided `manual-only/sprite_priority-expected.png` is a grayscale image and
not compatible to the "common palette" used by e.g. cgb-acid2 screenshots or the
ones provided by Mealybug Tearoom Tests.
For that reason I replaced `manual-only/sprite_priority-expected.png` with
[two images](https://github.com/c-sp/gameboy-test-roms/tree/master/src/mooneye-test-suite-expected)
containing the expected result for DMG and CGB (compatibility mode) using this
"common palette".

To create comparable screenshots,
your emulator should calculate colors as follows:
- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- each CGB 5 bit RGB channel is converted to 8 bits using the formula
  `(X << 3) | (X >> 2)`
- LCD shades for CGB compatibility mode are:
    - background: `#000000`, `#0063C6`, `#7BFF31` and `#FFFFFF`
    - objects: `#000000`, `#943939`, `#FF8484` and `#FFFFFF`
