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

[//]: # (TODO add CGB-C)
[//]: # (TODO add oam-bug screenshot)

Each test has to run for a specific amount of (emulated) time:

| test (CGB) | emulated seconds | CGB-B | CGB-E |
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

| test (DMG) | emulated seconds | DMG-C |
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

## Test Success/Failure

A test has finished successfully,
if the emulator's screen matches the respective
[screenshot](https://github.com/c-sp/gameboy-test-roms/tree/master/src/blargg-expected).
For details on the screenshot RGB values please have a look at
**Gambatte screenshot colors**
(screenshots were created using Gambatte's color correction).
