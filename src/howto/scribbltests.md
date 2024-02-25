# Scribbltests

[Scribbltests](https://github.com/Hacktix/scribbltests)
are actually compiled with [RGBDS](https://github.com/gbdev/rgbds).
However, as the binaries are already part of the repository,
we just use them.

## Game Boy Devices & SoC Revisions

All test roms have been verified on
[MGB 9638 D](https://gbhwdb.gekkio.fi/consoles/mgb) and
[CPU CGB D](https://gbhwdb.gekkio.fi/consoles/cgb) by their author.

## Exit Condition

Running for around 10 frames should be enough for most tests.
The only exception is `statcount_auto` which should be run for around 270 frames
or 4.5 seconds (emulated time).

## Test Success/Failure

Test success/failure can be determined by
[screenshot](https://github.com/c-sp/gameboy-test-roms/tree/master/src/scribbltests/)
comparison.
Note that there are no screenshots for `failrylake` and `winpos` at the moment.

To create comparable screenshots,
your emulator should calculate colors as follows:

- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- LCD shades for CGB compatibility mode are:
  - background: `#000000`, `#0063C6`, `#7BFF31` and `#FFFFFF`
  - objects: `#000000`, `#943939`, `#FF8484` and `#FFFFFF`
