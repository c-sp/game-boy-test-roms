![](https://github.com/c-sp/gameboy-test-roms/workflows/build%20and%20release/badge.svg)
[![GitHub release](https://img.shields.io/github/release/c-sp/gameboy-test-roms.svg)](https://GitHub.com/c-sp/gameboy-test-roms/releases/)

# Game Boy Test Roms

Have a Game Boy emulator you want to test for accuracy?
This collection of
[compiled Game Boy test roms](https://github.com/c-sp/gameboy-test-roms/releases)
might help.
It includes (in alphabetical order):

* **[AGE test roms](https://github.com/c-sp/age-test-roms)**  
  <sup>by [me](https://github.com/c-sp) </sup>
* **[Blargg's test roms](https://github.com/retrio/gb-test-roms)**  
  <sup>by [Shay Green (a.k.a. Blargg)](http://www.slack.net/~ant/) </sup>
* **[Bully](https://github.com/Hacktix/BullyGB)**,
  **[Scribbltests](https://github.com/Hacktix/scribbltests)**
  and **[Strikethrough](https://github.com/Hacktix/strikethrough.gb)**  
  <sup>by [Hacktix](https://github.com/Hacktix) </sup>
* **[cgb-acid-hell](https://github.com/mattcurrie/cgb-acid-hell)**,
  **[cgb-acid2](https://github.com/mattcurrie/cgb-acid2)**,
  **[dmg-acid2](https://github.com/mattcurrie/dmg-acid2)** and
  **[Mealybug Tearoom Tests](https://github.com/mattcurrie/mealybug-tearoom-tests)**  
  <sup>by [Matt Currie](https://github.com/mattcurrie) </sup>
* **[Gambatte test suite](https://github.com/sinamas/gambatte)**
  (as the original Gambatte repository is not public anymore, we use
  [pokemon-speedrunning/gambatte-core](https://github.com/pokemon-speedrunning/gambatte-core)
  instead)  
  <sup>by [sinamas](https://github.com/sinamas)
  </sup>
* **[GBMicrotest](https://github.com/aappleby/GBMicrotest)**  
  <sup>by [aappleby](https://github.com/aappleby) </sup>
* **[MBC3 Tester](https://github.com/EricKirschenmann/MBC3-Tester-gb)**  
  <sup>by [Eric Kirschenmann](https://github.com/EricKirschenmann) </sup>
* **[Mooneye Test Suite](https://github.com/Gekkio/mooneye-test-suite)**  
  <sup>by [Joonas Javanainen](https://github.com/Gekkio) </sup>
* **[Mooneye Test Suite (wilbertpol)](https://github.com/wilbertpol/mooneye-gb)**  
  <sup>by [Joonas Javanainen](https://github.com/Gekkio)
  and [wilbertpol](https://github.com/wilbertpol) </sup>
* **[(parts of) little-things-gb](https://github.com/pinobatch/little-things-gb)**  
  <sup>by [Damian Yerrick](https://github.com/pinobatch) </sup>
* **[rtc3test](https://github.com/aaaaaa123456789/rtc3test)**  
  <sup>by [ax6](https://github.com/aaaaaa123456789) </sup>
* **[SameSuite](https://github.com/LIJI32/SameSuite)**  
  <sup>by [Lior Halphon](https://github.com/LIJI32) </sup>
* **[TurtleTests](https://github.com/Powerlated/TurtleTests)**  
  <sup>by [Brian Jia](https://github.com/Powerlated) </sup>

## Running test suites

For each test rom we have to consider:

* **Game Boy devices & SoC revisions:**
  What device & SoC revision is a test compatible to?
  This is quite important as
  [some tests will not run on all devices](https://github.com/LIJI32/SameSuite/tree/master/apu).
  See the [Mooneye Test Suite's readme](https://github.com/Gekkio/mooneye-test-suite/#hardware-testing)
  for a list of devices and SoC revisions.
* **Exit Condition:**
  When is a test finished?
* **Test Success/Failure:**
  How do we identify test success or failure?

Details on this can be found in a separate readme for each test suite:
* [AGE test roms](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/age-test-roms.md)
  (located at `<release-zip>/age-test-roms/`)
* [Blargg's test roms](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/blargg.md)
  (located at `<release-zip>/blargg/`)
* [Bully](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/bully.md)
  (located at `<release-zip>/bully/`)
* [cgb-acid-hell](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/cgb-acid-hell.md)
  (located at `<release-zip>/cgb-acid-hell/`)
* [cgb-acid2](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/cgb-acid2.md)
  (located at `<release-zip>/cgb-acid2/`)
* [dmg-acid2](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/dmg-acid2.md)
  (located at `<release-zip>/dmg-acid2/`)
* [Gambatte test suite](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/gambatte.md)
  (located at `<release-zip>/gambatte/`)
* [GBMicrotest](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/gbmicrotest.md)
  (located at `<release-zip>/gbmicrotest/`)
* [MBC3 Tester](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/mbc3-tester.md)
  (located at `<release-zip>/mbc3-tester/`)
* [Mealybug Tearoom Tests](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/mealybug-tearoom-tests.md)
  (located at `<release-zip>/mealybug-tearoom-tests/`)
* [Mooneye Test Suite](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/mooneye-test-suite.md)
  (located at `<release-zip>/mooneye-test-suite/`)
* [Mooneye Test Suite (wilbertpol)](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/mooneye-test-suite-wilbertpol.md)
  (located at `<release-zip>/mooneye-test-suite-wilbertpol/`)
* [(parts of) little-things-gb](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/little-things-gb.md)
  (located at `<release-zip>/little-things-gb/`)
* [rtc3test](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/rtc3test.md)
  (located at `<release-zip>/rtc3test/`)
* [SameSuite](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/same-suite.md)
  (located at `<release-zip>/same-suite/`)
* [Scribbltests](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/scribbltests.md)
  (located at `<release-zip>/scribbltests/`)
* [Strikethrough](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/strikethrough.md)
  (located at `<release-zip>/strikethrough/`)
* [TurtleTests](https://github.com/c-sp/gameboy-test-roms/tree/master/src/howto/turtle-tests.md)
  (located at `<release-zip>/turtle-tests/`)

## Versioning

All noteworthy adjustments can be found in the [changelog](CHANGELOG.md).

Note that **version numbers are NOT based on
[semantic versioning](https://semver.org)** as I am not capable of
determining what update to any included test suite is actually a breaking
change.
Instead,
major version numbers are increased with every addition of new test suites and
minor version numbers are increased with any update to already included test
suites.

Readme by release version:

* [Readme v7.0](https://github.com/c-sp/gameboy-test-roms/blob/v7.0/README.md)
* [Readme v6.0](https://github.com/c-sp/gameboy-test-roms/blob/v6.0/README.md)
* [Readme v5.2](https://github.com/c-sp/gameboy-test-roms/blob/v5.2/README.md)
* [Readme v5.1](https://github.com/c-sp/gameboy-test-roms/blob/v5.1/README.md)
* [Readme v5.0](https://github.com/c-sp/gameboy-test-roms/blob/v5.0/README.md)
* [Readme v4.0](https://github.com/c-sp/gameboy-test-roms/blob/v4.0/README.md)
* [Readme v3.2](https://github.com/c-sp/gameboy-test-roms/blob/v3.2/README.md)
* [Readme v3.1](https://github.com/c-sp/gameboy-test-roms/blob/v3.1/README.md)
* [Readme v3.0](https://github.com/c-sp/gameboy-test-roms/blob/v3.0/README.md)
* [Readme v2.0](https://github.com/c-sp/gameboy-test-roms/blob/v2.0/README.md)
* [Readme v1.1](https://github.com/c-sp/gameboy-test-roms/blob/v1.1/README.md)
* [Readme v1.0](https://github.com/c-sp/gameboy-test-roms/blob/v1.0/README.md)
