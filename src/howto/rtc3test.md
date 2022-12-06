# rtc3test

The [rtc3test](https://github.com/aaaaaa123456789/rtc3test) rom
is compiled with [RGBDS v0.4](https://github.com/gbdev/rgbds/releases/v0.4.2)
as the code is not compatible to
[more recent RGBDS versions](https://github.com/gbdev/rgbds/releases).

## Game Boy Devices & SoC Revisions

As the test examines the MBC3 real time clock and not the Game Boy hardware by
itself,
it should succeed on all Game Boy devices.

## Exit Condition

rtc3test consist of three subtests.
At startup the user has to select the subtest to run.
You will have to emulate pressing the respective Game Boy buttons and after that
wait for the subtest to finish.

This procedure should be the same on all Game Boy devices.

|          sub-test | press buttons | test duration (emulated seconds) |
|------------------:|:-------------:|----------------------------------|
|       basic tests |       A       | 13                               |
|       range tests |    down, A    | 8                                |
| sub-second writes | down, down, A | 26                               |

## Test Success/Failure

For each subtest there is a
[screenshot](https://github.com/c-sp/gameboy-test-roms/tree/master/src/rtc3test-expected)
of the expected result.

To create comparable screenshots,
your emulator should calculate colors as follows:
- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- each CGB 5 bit RGB channel is converted to 8 bits using the formula
  `(X << 3) | (X >> 2)`
- LCD shades for CGB compatibility mode are:
    - background: `#000000`, `#0063C6`, `#7BFF31` and `#FFFFFF`
    - objects: `#000000`, `#943939`, `#FF8484` and `#FFFFFF`
