# SameSuite

The [SameSuite](https://github.com/LIJI32/SameSuite)
is compiled with [RGBDS](https://github.com/gbdev/rgbds).

## Game Boy Devices & SoC Revisions

Some [SameSuite apu tests](https://github.com/LIJI32/SameSuite/tree/master/apu)
only work on [CPU CGB E](https://gbhwdb.gekkio.fi/consoles/cgb).
I could not find any compatibility information for non-apu tests.

## Exit Condition

Each test rom executes opcode `0x40: LD B, B` when finished.

## Test Success/Failure

A test succeeds,
if the Game Boy's CPU registers contain the following Fibonacci numbers:
`B = 3, C = 5, D = 8, E = 13, H = 21, L = 34`
