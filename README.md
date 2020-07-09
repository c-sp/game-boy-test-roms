![](https://github.com/c-sp/gameboy-test-roms/workflows/build%20and%20release/badge.svg)

Have a Gameboy emulator you want to test for accuracy?
This collection of
[compiled Gameboy test roms](https://github.com/c-sp/gameboy-test-roms/releases)
might help.
It includes:

* [Blargg's test roms](https://github.com/retrio/gb-test-roms)
  written by
  [Blargg](http://blargg.8bitalley.com)
* [cgb-acid2](https://github.com/mattcurrie/cgb-acid2)
  test rom written by
  [Matt Currie](https://github.com/mattcurrie)
* [dmg-acid2](https://github.com/mattcurrie/dmg-acid2)
  test rom written by
  [Matt Currie](https://github.com/mattcurrie)
* [Gambatte](https://github.com/sinamas/gambatte)
  test suite written by
  [sinamas](https://github.com/sinamas)
* [Mealybug Tearoom Tests](https://github.com/mattcurrie/mealybug-tearoom-tests)
  written by
  [Matt Currie](https://github.com/mattcurrie)
* [Mooneye GB](https://github.com/Gekkio/mooneye-gb)
  test suite written by
  [Joonas Javanainen](https://github.com/Gekkio)



# Running test suites

Every test rom may work and behave differently.
We have to examine two important aspects to make use of a test rom:

* *Exit Condition:*
  How long does the emulation have to run until a test finishes?
* *Test Success:*
  How do we identify test success and failure for a finished test?



## Blargg's test suite

[Blargg's test roms](https://github.com/retrio/gb-test-roms)
are located at `blargg/` inside the released zip file.

### Exit Condition

Each test has to run for a specific amount of (emulated) time.
The time required for a test to finish varies:

| test | emulated seconds |
|---|---|
| `cgb_cpu_instrs` | 31 |
| `dmg_cpu_instrs` | 55 |
| `cgb_instr_timing` | 1 |
| `dmg_instr_timing` | 1 |
| `cgb_mem_timing` | 4 |
| `dmg_mem_timing` | 4 |
| `cgb_sound` | 37 |
| `dmg_sound` | 36 |

### Test Success

A test has finished successfully if the emulator's screen matches the
respective [screenshot](src/blargg-expected).



## cgb-acid2, dmg-acid2, Mealybug Tearoom Tests

[cgb-acid2](https://github.com/mattcurrie/cgb-acid2),
[dmg-acid2](https://github.com/mattcurrie/dmg-acid2) and the
[Mealybug Tearoom Tests](https://github.com/mattcurrie/mealybug-tearoom-tests)
are located at `cgb-acid2/`, `dmg-acid2/` and `mealybug-tearoom-tests/`
respectively.
They are compiled with [RGBDS](https://github.com/rednex/rgbds).

### Exit Condition

Each of these test roms executes opcode `0x40: LD B, B` when finished.

### Test Success

For each test rom there is a screenshot of the expected result.
Some tests come with multiple screenshots to cover different Gameboy hardware. 


## Gambatte test suite

[Gambatte](https://github.com/sinamas/gambatte)
test roms are located at `gambatte/` inside the released zip file.

### Exit Condition

All Gambatte test roms finish after 15 Gameboy LCD frames (see
[testrunner.cpp: runTestRom()](https://github.com/sinamas/gambatte/blob/master/test/testrunner.cpp)
).
That equals 1053360 Gameboy clock cycles or ~252 emulated milliseconds.

### Test Success

There are different types of Gambatte test roms:

* Audio tests are identified by their file name containing `_outaudio0` or
  `_outaudio1`.
  Depending on the `_outaudio` value they are expected to either produce any
  audio output (not necessarily audible though) or remain completely silent.
* Tests displaying any hexadecimal result on screen are identified by their
  file name containing `_out<hex>`.
  The emulator screen has to be compared against a monochrome pattern found in
  [testrunner.cpp](https://github.com/sinamas/gambatte/blob/master/test/testrunner.cpp)
  to determine test success.
* For tests displaying any other result on screen a `png` screenshot file
  with a matching file name can be found next to the rom file.

Note that a test rom can produce results for DMG (identified by `dmg08`),
CGB (identified by `cgb04c`) or both.
For details please have a look at
[testrunner.cpp: main()](https://github.com/sinamas/gambatte/blob/master/test/testrunner.cpp).
In every case there will be some file name parsing involved to determine the
expected test result.



## Mooneye GB test suite

[Mooneye GB](https://github.com/Gekkio/mooneye-gb)
test roms are located at `mooneye-gb/` inside the released zip file.
They are compiled with [WLA DX](https://github.com/vhelin/wla-dx).

Be aware that some Mooneye GB tests are written for specific Gameboy hardware.
They might fail depending on what hardware your emulator supports.

### Exit Condition

Each Mooneye GB test rom executes opcode `0x40: LD B, B` when finished.
The maximal duration for a test is 120 seconds (emulated time),
see [mooneye_suite.rs](https://github.com/Gekkio/mooneye-gb/blob/master/core/tests/mooneye_suite.rs).

### Test Success

A test has succeeded if the Gameboy'S CPU registers contain the following
Fibonacci sequence part:
```
    B = 3
    C = 5
    D = 8
    E = 13
    H = 21
    L = 34
```
