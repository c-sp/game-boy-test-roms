# Blargg's test suite

[Blargg's test roms](https://github.com/retrio/gb-test-roms)
are already hosted as binaries and do not have to be compiled.

## Game Boy Devices & SoC Revisions

Tests have been verified on
[DMG-CPU-08 (DMG-CPU C blob)](https://gbhwdb.gekkio.fi/consoles/dmg),
[CPU-CGB-02 (CPU CGB B) and CPU-CGB-06 (CPU CGB E)](
https://gbhwdb.gekkio.fi/consoles/cgb).
See the tables below for details.

## Exit Condition

Each test has to run for a specific amount of (emulated) time:

|             test | emulated seconds |         CGB-B         |        CGB-C         |        CGB-E         |
|-----------------:|-----------------:|:---------------------:|:--------------------:|:--------------------:|
|      `cgb_sound` |               37 | &#10060;<sup>1.</sup> | &#9989;<sup>2.</sup> | &#9989;<sup>2.</sup> |
|     `cpu_instrs` |               31 |        &#9989;        |       &#9989;        |       &#9989;        |
|       `halt_bug` |                2 |        &#9989;        |       &#9989;        |       &#9989;        |
|   `instr_timing` |                1 |        &#9989;        |       &#9989;        |       &#9989;        |
| `interrupt_time` |                2 |        &#9989;        |       &#9989;        |       &#9989;        |
|     `mem_timing` |                3 |        &#9989;        |       &#9989;        |       &#9989;        |
|   `mem_timing-2` |                4 |        &#9989;        |       &#9989;        |       &#9989;        |

1. `cgb_sound` (CGB-B):
   Test case 3 fails with code `04`.
   Test cases are repeated infinitely,
   the test never really finishes.
2. `cgb_sound` (CGB-E):
   Test cases are repeated infinitely,
   the test never really finishes.
   The corresponding
   [screenshot](https://github.com/c-sp/gameboy-test-roms/tree/master/src/blargg-expected/cgb_sound)
   was created with [SameBoy](https://sameboy.github.io),
   which terminates the test correctly.

|             test | emulated seconds |         DMG-C         |
|-----------------:|-----------------:|:---------------------:|
|     `cpu_instrs` |               55 |        &#9989;        |
|      `dmg_sound` |               36 | &#9989;<sup>3.</sup>  |
|       `halt_bug` |                2 |        &#9989;        |
|   `instr_timing` |                1 |        &#9989;        |
| `interrupt_time` |                2 | &#10060;<sup>4.</sup> |
|     `mem_timing` |                3 |        &#9989;        |
|   `mem_timing-2` |                4 |        &#9989;        |
|        `oam_bug` |               21 |        &#9989;        |

3. `dmg_sound` (DMG-C):
   Test cases are repeated infinitely,
   the test never really finishes.
   The corresponding
   [screenshot](https://github.com/c-sp/gameboy-test-roms/tree/master/src/blargg-expected/dmg_sound)
   was created with [SameBoy](https://sameboy.github.io),
   which terminates the test correctly.
4. `interrupt_time` (DMG-C):
   Fails with checksum `7F8F4AAF` (in case anyone is interested).
   This is a CGB-only rom, so failure was expected.

## Test Success/Failure

A test has finished successfully,
if the emulator's screen matches the respective
[screenshot](https://github.com/c-sp/gameboy-test-roms/tree/master/src/blargg-expected).
To create comparable screenshots,
your emulator should calculate colors as follows:
- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- each CGB 5 bit RGB channel is converted to 8 bits using the formula
  `(X << 3) | (X >> 2)`
- LCD shades for CGB compatibility mode are:
   - background: `#000000`, `#0063C6`, `#7BFF31` and `#FFFFFF`
   - objects: `#000000`, `#943939`, `#FF8484` and `#FFFFFF`
