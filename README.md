![](https://github.com/c-sp/gameboy-test-roms/workflows/build%20and%20release/badge.svg)



# Game Boy Test Roms

Have a Game Boy emulator you want to test for accuracy?
This collection of
[compiled Game Boy test roms](https://github.com/c-sp/gameboy-test-roms/releases)
might help.
It includes:

* [AGE test roms](https://github.com/c-sp/age-test-roms)
* [Blargg's test roms](https://github.com/retrio/gb-test-roms)
  written by
  [Shay Green (a.k.a. Blargg)](http://blargg.8bitalley.com)
* [cgb-acid2](https://github.com/mattcurrie/cgb-acid2),
  [cgb-acid-hell](https://github.com/mattcurrie/cgb-acid-hell),
  [dmg-acid2](https://github.com/mattcurrie/dmg-acid2) and
  [Mealybug Tearoom Tests](https://github.com/mattcurrie/mealybug-tearoom-tests)
  written by
  [Matt Currie](https://github.com/mattcurrie)
* [Gambatte](https://github.com/sinamas/gambatte)
  test suite written by
  [sinamas](https://github.com/sinamas)
  (as the original Gambatte repository is not public anymore we use
  [pokemon-speedrunning/gambatte-core](https://github.com/pokemon-speedrunning/gambatte-core)
  instead)
* [Mooneye GB](https://github.com/Gekkio/mooneye-gb)
  test suite written by
  [Joonas Javanainen](https://github.com/Gekkio)
* [SameSuite](https://github.com/LIJI32/SameSuite)
  written by
  [Lior Halphon](https://github.com/LIJI32)



# Running test suites

For each test rom we have to consider:

* **Hardware:**
  What Game Boy devices is a test compatible to?
  This is quite important as
  [some tests will not run on all devices](https://github.com/LIJI32/SameSuite/tree/master/apu).
* **Exit Condition:**
  When is a test finished?
* **Test Success/Failure:**
  How do we identify test success and failure?



## AGE test roms

[AGE test roms](https://github.com/c-sp/age-test-roms)
test roms are located at `age-test-roms/` inside the released zip file.
They are compiled with [RGBDS](https://github.com/gbdev/rgbds).

**Hardware:**
Tests have been verified on
[DMG-CPU-08 (DMG-CPU C blob)](https://gbhwdb.gekkio.fi/consoles/dmg),
[CPU-CGB-02 (CPU CGB B)](https://gbhwdb.gekkio.fi/consoles/cgb) and
[CPU-CGB-06 (CPU CGB E)](https://gbhwdb.gekkio.fi/consoles/cgb).
Test names indicate compatible devices.

**Exit Condition:**
Each test rom executes opcode `0x40: LD B, B` when finished.

**Test Success:**
A test succeeds if the Game Boy's CPU registers contain the following
Fibonacci values: `B = 3, C = 5, D = 8, E = 13, H = 21, L = 34`



## Blargg's test suite

[Blargg's test roms](https://github.com/retrio/gb-test-roms)
are located at `blargg/` inside the released zip file.

**Hardware:**
*todo: At the moment I don't have any comprehensive information on device
compatibility.*

**Exit Condition:**
Each test has to run for a specific amount of (emulated) time:

| test (cgb) | emulated seconds |
|---|---|
| `cgb_sound` <sup>(*)</sup> | 37 |
| `cpu_instrs` | 31 |
| `halt_bug` | *todo: seconds* |
| `instr_timing` | 1 |
| `interrupt_time` | 2 |
| `mem_timing` | 3 |
| `mem_timing-2` | 4 |
| `oam_bug` <sup>(*)</sup> | *todo: seconds* |

| test (dmg) | emulated seconds |
|---|---|
| `cpu_instrs` | 55 |
| `dmg_sound` <sup>(*)</sup> | 36 |
| `halt_bug` | *todo: seconds* |
| `instr_timing` | 1 |
| `interrupt_time` | 2 *todo: screenshot* |
| `mem_timing` | 3 |
| `mem_timing-2` | 4 |
| `oam_bug` | *todo* |

**Test Success:**
A test has finished successfully if the emulator's screen matches the
respective [screenshot](src/blargg-expected).
For details on the screenshot RGB values please have a look at
**Gambatte screenshot colors**
below as I used the same color formulas for Blargg screenshots.

**(\*) Notes:**
* `cgb_sound`:
  Test case 3 fails with code `04` on my Game Boy Color.
  All test cases are repeated infinitely,
  the test rom never really finishes.
  [Gambatte](https://github.com/pokemon-speedrunning/gambatte-core)
  runs this test rom successfully though.
* `dmg_sound`:
  All test cases pass on my old Game Boy.
  Though (similar to `cgb_sound`) they are repeated infinitely.
  The test rom never really finishes.
  [Gambatte](https://github.com/pokemon-speedrunning/gambatte-core)
  runs this test rom successfully though.
* `oam_bug`:
  Test cases 2, 4, 5, 7 and 8 fail with code `02` on my Game Boy Color.



## cgb-acid2, cgb-acid-hell, dmg-acid2, Mealybug Tearoom Tests

[cgb-acid2](https://github.com/mattcurrie/cgb-acid2),
[cgb-acid-hell](https://github.com/mattcurrie/cgb-acid-hell),
[dmg-acid2](https://github.com/mattcurrie/dmg-acid2) and the
[Mealybug Tearoom Tests](https://github.com/mattcurrie/mealybug-tearoom-tests)
are located at `cgb-acid2/`, `cgb-acid-hell/`, `dmg-acid2/` and
`mealybug-tearoom-tests/` respectively.
They are compiled with [RGBDS](https://github.com/gbdev/rgbds).

**Hardware:**
`cgb-acid2` and `dmg-acid2` don't require any T-cycle accurate timing and thus
*probably* work on any device.
However, I could not yet verify this.
For
[Mealybug Tearoom Tests](https://github.com/mattcurrie/mealybug-tearoom-tests)
there are
[device specific results](https://github.com/mattcurrie/mealybug-tearoom-tests/tree/master/expected)
provided
(note that we copy these screenshots next to the respective test roms when
bundling a release zip).

**Exit Condition:**
Each of these test roms executes opcode `0x40: LD B, B` when finished.

**Test Success:**
For each test rom there is a screenshot of the expected result.
Some tests come with multiple screenshots to cover different Game Boy hardware.
[Matt Currie](https://github.com/mattcurrie) uses the formula
`(X << 3) | (X >> 2)` for each Game Boy Color RGB channel.
DMG screenshots use RGB values `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF`
instead of greenish Game Boy colors.



## Gambatte test suite

[Gambatte](https://github.com/pokemon-speedrunning/gambatte-core)
test roms are located at `gambatte/` inside the released zip file.

**Hardware:**
Test roms produce results for DMG (identified by `dmg08`),
CGB (identified by `cgb04c`) or both.
For details please have a look at
[testrunner.cpp: main()](https://github.com/pokemon-speedrunning/gambatte-core/blob/d819bad196/test/testrunner.cpp#L370).
Based on the file names I *guess* Gambatte tests have been verified on
[DMG-CPU-08 (unknown CPU version)](https://gbhwdb.gekkio.fi/consoles/dmg) and
[CGB-CPU-04 (CPU CGB C)](https://gbhwdb.gekkio.fi/consoles/cgb).

**Exit Condition:**
All Gambatte test roms finish after 15 Game Boy LCD frames (see
[testrunner.cpp: runTestRom()](https://github.com/pokemon-speedrunning/gambatte-core/blob/d819bad196/test/testrunner.cpp#L278)).
That equals 1053360 Game Boy clock cycles or ~252 emulated milliseconds.

**Test Success:**
There are different types of Gambatte test roms:

* Audio tests are identified by their file name containing `_outaudio0` or
  `_outaudio1`.
  Depending on the `_outaudio` value they are expected to either produce audio
  output or remain completely silent.
* Tests displaying a hexadecimal result value on screen are identified by their
  file name containing `_out<hex>`.
  The emulator screen has to be compared against a monochrome pattern found in
  [testrunner.cpp](https://github.com/pokemon-speedrunning/gambatte-core/blob/d819bad196/test/testrunner.cpp#L65)
  to determine test success.
* For some tests a `png` screenshot file with matching file name can be found
  next to the rom file.

### Gambatte screenshot colors

Your emulator should use the RGB values `#000000`, `#555555`, `#AAAAAA` and
`#FFFFFF` as DMG shades instead of the classic greenish Game Boy colors to
compare the screenshots.

Gambatte calculates Game Boy Color RGB values using these formulas:

| channel | formula |
|---|---|
| red   | `(R * 13 + G * 2 + B) / 2` |
| green | `(G * 3 + B) * 2` |
| blue  | `(R * 3 + G * 2 + B * 11) / 2` |



## Mooneye GB test suite

[Mooneye GB](https://github.com/Gekkio/mooneye-gb)
test roms are located at `mooneye-gb/` inside the released zip file.
They are compiled with [WLA DX](https://github.com/vhelin/wla-dx).

**Hardware:**
Tests limited to specific devices will contain a hint in their file name.
For example,
`acceptance/boot_regs-dmgABC.gb` is tailored to 
[DMG-CPU A, B and C](https://gbhwdb.gekkio.fi/consoles/dmg)
while `acceptance/boot_regs-sgb.gb` works only on
[SGB](https://gbhwdb.gekkio.fi/consoles/sgb) devices.
Please see [Test naming](https://github.com/Gekkio/mooneye-gb#test-naming)
for further details.

**Exit Condition:**
Each Mooneye GB test rom executes opcode `0x40: LD B, B` when finished.
The maximal runtime for a test is 120 emulated seconds (see
[mooneye_suite.rs](https://github.com/Gekkio/mooneye-gb/blob/master/core/tests/mooneye_suite.rs)).

**Test Success:**
A test succeeds if the Game Boy's CPU registers contain the following
Fibonacci values: `B = 3, C = 5, D = 8, E = 13, H = 21, L = 34`
Note that some Mooneye GB tests are written for specific Game Boy hardware.
They might fail depending on what hardware your emulator supports.



## SameSuite

[SameSuite](https://github.com/LIJI32/SameSuite)
test roms are located at `same-suite/` inside the released zip file.
They are compiled with [RGBDS](https://github.com/gbdev/rgbds).

**Hardware:**
Some [SameSuite apu tests](https://github.com/LIJI32/SameSuite/tree/master/apu)
only work on [CPU CGB E](https://gbhwdb.gekkio.fi/consoles/cgb).
I could not find any compatibility information for non-apu tests.

**Exit Condition:**
Each test rom executes opcode `0x40: LD B, B` when finished.

**Test Success:**
A test succeeds if the Game Boy's CPU registers contain the following
Fibonacci values: `B = 3, C = 5, D = 8, E = 13, H = 21, L = 34`
