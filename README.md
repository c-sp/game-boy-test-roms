![](https://github.com/c-sp/gameboy-test-roms/workflows/build%20and%20release/badge.svg)



# Game Boy Test Roms

Have a Game Boy emulator you want to test for accuracy?
This collection of
[compiled Game Boy test roms](https://github.com/c-sp/gameboy-test-roms/releases)
might help.
It includes (in alphabetical order):

* **[AGE test roms](https://github.com/c-sp/age-test-roms)**  
  <sup>by [me](https://github.com/c-sp) </sup>
* **[BullyGB](https://github.com/Hacktix/BullyGB)**  
  <sup>by [Hacktix](https://github.com/Hacktix) </sup>
* **[Blargg's test roms](https://github.com/retrio/gb-test-roms)**  
  <sup>by [Shay Green (a.k.a. Blargg)](http://www.slack.net/~ant/) </sup>
* **[cgb-acid2](https://github.com/mattcurrie/cgb-acid2)**,
  **[cgb-acid-hell](https://github.com/mattcurrie/cgb-acid-hell)** and
  **[dmg-acid2](https://github.com/mattcurrie/dmg-acid2)**  
  <sup>by [Matt Currie](https://github.com/mattcurrie) </sup>
* **[firstwhite](https://github.com/pinobatch/little-things-gb/tree/master/firstwhite)**  
  <sup>by [Damian Yerrick](https://github.com/pinobatch) </sup>
* **[Gambatte test suite](https://github.com/sinamas/gambatte)**
  (as the original Gambatte repository is not public anymore we use
  [pokemon-speedrunning/gambatte-core](https://github.com/pokemon-speedrunning/gambatte-core)
  instead)  
  <sup>by [sinamas](https://github.com/sinamas)
  </sup>
* **[Mealybug Tearoom Tests](https://github.com/mattcurrie/mealybug-tearoom-tests)**  
  <sup>by [Matt Currie](https://github.com/mattcurrie) </sup>
* **[Mooneye Test Suite](https://github.com/Gekkio/mooneye-test-suite/)**  
  <sup>by [Joonas Javanainen](https://github.com/Gekkio) </sup>
* **[Mooneye Test Suite (wilbertpol)](https://github.com/wilbertpol/mooneye-gb)**  
  <sup>by [Joonas Javanainen](https://github.com/Gekkio)
  and [wilbertpol](https://github.com/wilbertpol) </sup>
* **[rtc3test](https://github.com/aaaaaa123456789/rtc3test)**  
  <sup>by [aaaaaa123456789](https://github.com/aaaaaa123456789) </sup>
* **[SameSuite](https://github.com/LIJI32/SameSuite)**  
  <sup>by [Lior Halphon](https://github.com/LIJI32) </sup>
* **[strikethrough](https://github.com/Hacktix/strikethrough.gb)**  
  <sup>by [Hacktix](https://github.com/Hacktix) </sup>



# Running test suites

For each test rom we have to consider:

* **Hardware:**
  What Game Boy devices is a test compatible to?
  This is quite important as
  [some tests will not run on all devices](https://github.com/LIJI32/SameSuite/tree/master/apu).
* **Exit Condition:**
  When is a test finished?
* **Test Success/Failure:**
  How do we identify test success or failure?



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
Fibonacci numbers: `B = 3, C = 5, D = 8, E = 13, H = 21, L = 34`



## Blargg's test suite

[Blargg's test roms](https://github.com/retrio/gb-test-roms)
are located at `blargg/` inside the released zip file.

**Hardware:**
Tests have been verified on
[DMG-CPU-08 (DMG-CPU C blob)](https://gbhwdb.gekkio.fi/consoles/dmg),
[CPU-CGB-02 (CPU CGB B)](https://gbhwdb.gekkio.fi/consoles/cgb) and
[CPU-CGB-06 (CPU CGB E)](https://gbhwdb.gekkio.fi/consoles/cgb).

**Exit Condition:**
Each test has to run for a specific amount of (emulated) time:

| test (cgb) | emulated seconds | CGB-B | CGB-E |
| ---: | --- | --- | --- |
| `cgb_sound` | 37 | &#10060;<sup>1.</sup> | &#9989;<sup>2.</sup>
| `cpu_instrs` | 31 | &#9989; | &#9989;
| `halt_bug` | 2 | &#9989; | &#9989;
| `instr_timing` | 1 | &#9989; | &#9989;
| `interrupt_time` | 2 | &#9989; | &#9989;
| `mem_timing` | 3 | &#9989; | &#9989;
| `mem_timing-2` | 4 | &#9989; | &#9989;

1. `cgb_sound` (CGB-B):
   Test case 3 fails with code `04`.
   Test cases are repeated infinitely,
   the test never really finishes.
2. `cgb_sound` (CGB-E):
   Test cases are repeated infinitely,
   the test never really finishes.

| test (dmg) | emulated seconds | DMG-C |
| ---: | --- | --- |
| `cpu_instrs` | 55 | &#9989;
| `dmg_sound` | 36 | &#9989;<sup>3.</sup>
| `halt_bug` | 2 | &#9989;
| `instr_timing` | 1 | &#9989;
| `interrupt_time` | 2 | &#10060;<sup>4.</sup>
| `mem_timing` | 3 | &#9989;
| `mem_timing-2` | 4 | &#9989;
| `oam_bug` | *todo* | &#9989;

3. `dmg_sound` (DMG-C):
   Test cases are repeated infinitely,
   the test never really finishes.
4. `interrupt_time` (DMG-C):
   Fails with checksum `7F8F4AAF` (in case anyone is interested).
   This is a CGB-only rom, so failure was expected.

**Test Success:**
A test has finished successfully if the emulator's screen matches the
respective [screenshot](src/blargg-expected).
For details on the screenshot RGB values please have a look at
**Gambatte screenshot colors**
below
(screenshots were made using Gambatte's color correction).



## BullyGB

[BullyGB](https://github.com/Hacktix/BullyGB) is located at `bully/` inside the released zip file.
It is compiled with [RGBDS](https://github.com/gbdev/rgbds).

**Hardware:**
According to the [BullyGB Wiki](https://github.com/Hacktix/BullyGB/wiki),
most test cases are compatible to all Game Boy models.
The test cases compatible to only specific models seem to be included/skipped automatically.

**Exit Condition:**
TODO

**Test Success:**
A [screenshot](src/bully-expected) of the expected test result is available.
You should use the formula `(X << 3) | (X >> 2)` for each Game Boy Color RGB channel
and the RGB values `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF`
for DMG shades to be able to compare screenshots.



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



## firstwhite

The [firstwhite](https://github.com/pinobatch/little-things-gb/tree/master/firstwhite)
test rom is located at `firstwhite/` inside the released zip file.

**Hardware:**
According to the [readme](https://github.com/pinobatch/little-things-gb/tree/master/firstwhite#readme),
the test should succeed on about every Game Boy device except for
the Super Game Boy.

**Exit Condition:**
In my experience the test result is visible nearly immediately.
Terminating the test after half a second of emulation time should be more than enough.

**Test Success:**
The test succeeds when only a white screen is visible.
A corresponding [screenshot](src/firstwhite-expected) is available.
You should use the formula `(X << 3) | (X >> 2)` for each Game Boy Color RGB channel
and the RGB values `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF`
for DMG shades to be able to compare screenshots.



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
be able to compare screenshots.

Gambatte calculates Game Boy Color RGB values using these formulas:

| channel | formula |
| ---: | --- |
| red   | `(R * 13 + G * 2 + B) / 2` |
| green | `(G * 3 + B) * 2` |
| blue  | `(R * 3 + G * 2 + B * 11) / 2` |



## Mooneye Test Suite

The [Mooneye Test Suite](https://github.com/Gekkio/mooneye-test-suite/)
is located at `mooneye-test-suite/` inside the released zip file.
The test roms are compiled with [WLA DX](https://github.com/vhelin/wla-dx).

**Hardware:**
Tests limited to specific devices will contain a hint in their file name.
For example,
`acceptance/boot_regs-dmgABC.gb` is tailored to 
[DMG-CPU A, B and C](https://gbhwdb.gekkio.fi/consoles/dmg)
while `acceptance/boot_regs-sgb.gb` works only on
[SGB](https://gbhwdb.gekkio.fi/consoles/sgb) devices.
Please see [Test naming](https://github.com/Gekkio/mooneye-test-suite#test-naming)
for further details.

**Exit Condition:**
Each Mooneye test rom executes opcode `0x40: LD B, B` when finished.
The maximal runtime for a test is 120 emulated seconds (see
[mooneye_suite.rs](https://github.com/Gekkio/mooneye-gb/blob/66c6e027111dbabcdc68350f3a80d7148bf9dc68/core/tests/mooneye_suite.rs#L198)).

**Test Success:**
A test succeeds if the Game Boy's CPU registers contain the following
Fibonacci numbers: `B = 3, C = 5, D = 8, E = 13, H = 21, L = 34`



## Mooneye Test Suite (extended by wilbertpol)

The [Mooneye Test Suite extended by wilbertpol](https://github.com/wilbertpol/mooneye-gb)
is located at `mooneye-test-suite-wilbertpol/` inside the released zip file.
Test roms are compiled with [WLA DX v9.6](https://github.com/vhelin/wla-dx/releases/tag/v9.6)
as more recent versions of WLA-DX are not compatible.

The test suite works similar to the original [Mooneye Test Suite](#mooneye-test-suite)
with one exception regarding the **Exit Condition**:
instead of executing opcode `0x40: LD B, B` to indicate a finished test,
opcode `0xED (undefined)` is executed
(this is how the Mooneye Test Suite
[worked back in 2016](https://github.com/Gekkio/mooneye-gb/blob/8a7f68b3576d9bbd502a5a51ba126c5fc09c57be/tests/common/common.s#L51)).



## rtc3test

The [rtc3test](https://github.com/aaaaaa123456789/rtc3test) rom
is located at `rtc3test/` inside the released zip file.
We have to use [RGBDS v0.4](https://github.com/gbdev/rgbds/releases/v0.4.2)
for compilation as the code is not compatible to
[current RGBDS versions](https://github.com/gbdev/rgbds/releases).

**Hardware:**
The rom examines MBC3's real time clock and not the Game Boy
hardware by itself.
It should behave similar on all Game Boy devices.

**Exit Condition:**
rtc3test consist of three sub-tests.
At startup the user has to select the sub-test to run.
You will have to emulate pressing the respective Game Boy buttons
and after that wait for the sub-test to finish.

The procedure should be the same on all Game Boy devices.

| sub-test | press buttons | test duration (seconds) |
| ---: | :---: | --- |
| basic tests | A | 13
| range tests | down, A | 8
| sub-second writes | down, down, A | 26

**Test Success:**
For each sub-test there is a [screenshot](src/rtc3test-expected) of the expected result.
CGB screenshots were created using the formula
`(X << 3) | (X >> 2)` for each Game Boy Color RGB channel.
DMG screenshots use RGB values `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF`
instead of the greenish DMG LCD colors.



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
Fibonacci numbers: `B = 3, C = 5, D = 8, E = 13, H = 21, L = 34`



## Strikethrough

[Strikethrough](https://github.com/Hacktix/strikethrough.gb) is located at `strikethrough/`
inside the released zip file.
It is compiled with [RGBDS](https://github.com/gbdev/rgbds).

**Hardware:**
TODO

**Exit Condition:**
TODO

**Test Success:**
A [screenshot](src/strikethrough-expected) of the expected test result is available.
You should use the formula `(X << 3) | (X >> 2)` for each Game Boy Color RGB channel
and the RGB values `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF`
for DMG shades to be able to compare screenshots.
