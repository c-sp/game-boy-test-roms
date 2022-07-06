# cgb-acid2

[cgb-acid2](https://github.com/mattcurrie/cgb-acid2) is compiled with
[RGBDS](https://github.com/gbdev/rgbds).

## Game Boy Devices & SoC Revisions

`cgb-acid2` does not require any T-cycle accurate timing and thus *probably*
works on any Game Boy Color device.
However, I could not yet verify this.

## Exit Condition

The test rom executes opcode `0x40: LD B, B` when finished.

## Test Success/Failure

A screenshot of the expected result is included.

To create comparable screenshots,
your emulator should convert CGB 5 bit RGB channels to 8 bits using the formula
`(X << 3) | (X >> 2)`.
