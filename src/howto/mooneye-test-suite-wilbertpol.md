# Mooneye Test Suite (extended by wilbertpol)

[The Mooneye Test Suite extended by wilbertpol](https://github.com/wilbertpol/mooneye-gb)
is compiled with
[WLA DX v9.6](https://github.com/vhelin/wla-dx/releases/tag/v9.6)
as more recent versions of WLA-DX are not compatible.

## Game Boy Devices & SoC Revisions

Tests limited to specific Game Boy models will contain a hint in their file
name.
For example,
`acceptance/boot_regs-dmgABC.gb` succeeds only on
[DMG-CPU A, B and C](https://gbhwdb.gekkio.fi/consoles/dmg) devices and
`acceptance/boot_regs-sgb.gb` works only on
[Super Game Boy](https://gbhwdb.gekkio.fi/consoles/sgb) devices.
See [Test naming](https://github.com/wilbertpol/mooneye-gb#test-naming)
for further details.

## Exit Condition

Each test rom executes opcode `0xED (undefined)` when finished
(this is how the Mooneye Test Suite
[worked back in 2016](https://github.com/Gekkio/mooneye-gb/blob/8a7f68b3576d9bbd502a5a51ba126c5fc09c57be/tests/common/common.s#L51)).

## Test Success/Failure

A test succeeds,
if the Game Boy's CPU registers contain the following Fibonacci numbers:
`B = 3, C = 5, D = 8, E = 13, H = 21, L = 34`.

[//]: # (TODO screenshot colors for manual-only/sprite_priority.gb)
