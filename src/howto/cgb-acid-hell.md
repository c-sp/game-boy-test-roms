# cgb-acid-hell

[cgb-acid-hell](https://github.com/mattcurrie/cgb-acid-hell) is compiled with
[RGBDS](https://github.com/gbdev/rgbds).

## Game Boy Devices & SoC Revisions

I could not find any compatibility information on
[cgb-acid-hell](https://github.com/mattcurrie/cgb-acid-hell).
My guess is,
that it is compatible to any Game Boy Color device.

## Exit Condition

The test rom executes opcode `0x40: LD B, B` when finished.

## Test Success/Failure

A screenshot of the expected result is included.

To create comparable screenshots,
your emulator should convert CGB 5 bit RGB channels to 8 bits using the formula
`(X << 3) | (X >> 2)`.
