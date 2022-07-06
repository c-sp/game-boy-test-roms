# Mooneye Test Suite

The [Mooneye Test Suite](https://github.com/Gekkio/mooneye-test-suite/)
is compiled with [WLA DX](https://github.com/vhelin/wla-dx).

## Game Boy Devices & SoC Revisions

Tests limited to specific Game Boy models will contain a hint in their file
name.
For example,
`acceptance/boot_regs-dmgABC.gb` succeeds only on
[DMG-CPU A, B and C](https://gbhwdb.gekkio.fi/consoles/dmg) devices and
`acceptance/boot_regs-sgb.gb` works only on
[Super Game Boy](https://gbhwdb.gekkio.fi/consoles/sgb) devices.
See [Test naming](https://github.com/Gekkio/mooneye-test-suite#test-naming)
for further details.

## Exit Condition

Each Mooneye test rom executes opcode `0x40: LD B, B` when finished.
The maximal runtime for a test is 120 emulated seconds (see
[mooneye_suite.rs](https://github.com/Gekkio/mooneye-gb/blob/66c6e027111dbabcdc68350f3a80d7148bf9dc68/core/tests/mooneye_suite.rs#L198)).

## Test Success/Failure

A test succeeds,
if the Game Boy's CPU registers contain the following Fibonacci numbers:
`B = 3, C = 5, D = 8, E = 13, H = 21, L = 34`.

[//]: # (TODO screenshot colors for manual-only/sprite_priority.gb)
