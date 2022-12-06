# Gambatte test suite

[Gambatte](https://github.com/pokemon-speedrunning/gambatte-core)
test roms are compiled with a custom compiler.

## Game Boy Devices & SoC Revisions

Test roms produce results for DMG (identified by `dmg08`),
CGB (identified by `cgb04c`) or both.
For details please have a look at
[testrunner.cpp: main()](https://github.com/pokemon-speedrunning/gambatte-core/blob/d819bad196/test/testrunner.cpp#L370).
Based on the file names I *guess* Gambatte tests have been verified on
[DMG-CPU-08 (unknown CPU version)](https://gbhwdb.gekkio.fi/consoles/dmg) and
[CGB-CPU-04 (CPU CGB C)](https://gbhwdb.gekkio.fi/consoles/cgb).

## Exit Condition

All Gambatte test roms finish after 15 Game Boy LCD frames (see
[testrunner.cpp: runTestRom()](https://github.com/pokemon-speedrunning/gambatte-core/blob/d819bad196/test/testrunner.cpp#L278)).
This is equal to 1053360 Game Boy clock cycles or ~252 emulated milliseconds.

## Test Success/Failure

There are different types of Gambatte test roms:

* Audio tests are identified by their file name containing `_outaudio0` or
  `_outaudio1`.
  Depending on the `_outaudio` value they are expected to either produce audio
  output or remain completely silent.
* Tests displaying a hexadecimal result value are identified by their file name
  containing `_out<hex>`.
  The emulator screen has to be compared against a monochrome pattern found in
  [testrunner.cpp](https://github.com/pokemon-speedrunning/gambatte-core/blob/d819bad196/test/testrunner.cpp#L65)
  to determine test success/failure.
* For some tests a `png` screenshot file matching the respective test rom's file
  name can be found next to the rom file.

### Screenshot Colors

Your emulator should use the RGB values `#000000`, `#555555`, `#AAAAAA` and
`#FFFFFF` as DMG LCD shades to be able to compare screenshots.

Gambatte calculates Game Boy Color RGB values using the following formulae:

| RGB channel | formula                        |
|------------:|--------------------------------|
|         red | `(R * 13 + G * 2 + B) / 2`     |
|       green | `(G * 3 + B) * 2`              |
|        blue | `(R * 3 + G * 2 + B * 11) / 2` |
