# BullyGB

[BullyGB](https://github.com/Hacktix/BullyGB) is compiled with
[RGBDS](https://github.com/gbdev/rgbds).

## Game Boy Devices & SoC Revisions

According to the [BullyGB Wiki](https://github.com/Hacktix/BullyGB/wiki),
most test cases are compatible to all Game Boy devices.
The test cases compatible to only specific Game Boy devices seem to be
included/skipped automatically.

I double-checked this for my own devices
([DMG-CPU-08 (DMG-CPU C blob)](https://gbhwdb.gekkio.fi/consoles/dmg),
[CPU-CGB-02 (CPU CGB B), CPU-CGB-04 (CPU CGB C) and CPU-CGB-06 (CPU CGB E)](
https://gbhwdb.gekkio.fi/consoles/cgb))
and it fails on my DMG-C with error `Bad Echo RAM Reads`.
CGB results are fine though.

## Exit Condition

Letting the emulation run for half a second emulated time is sufficient.

## Test Success/Failure

[A screenshot](https://github.com/c-sp/gameboy-test-roms/tree/master/src/bully-expected)
of the expected test result is available.

To create comparable screenshots,
your emulator should calculate colors as follows:
- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- each CGB 5 bit RGB channel is converted to 8 bits using the formula
  `(X << 3) | (X >> 2)`
