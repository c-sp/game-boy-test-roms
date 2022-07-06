# dmg-acid2

[dmg-acid2](https://github.com/mattcurrie/dmg-acid2) is compiled with
[RGBDS](https://github.com/gbdev/rgbds).

## Game Boy Devices & SoC Revisions

`dmg-acid2` does not require any T-cycle accurate timing and thus *probably*
works on any Game Boy device.
However, I could not yet verify this.

## Exit Condition

The test rom executes opcode `0x40: LD B, B` when finished.

## Test Success/Failure

Screenshots of the expected result on DMG and CGB (compatibility mode) are
included.

To create comparable screenshots,
your emulator should calculate colors as follows:
- `#000000`, `#555555`, `#AAAAAA` and `#FFFFFF` are used for the four DMG LCD
  shades
- LCD shades for CGB compatibility mode are:
    - background: `#000000`, `#0063C6`, `#7BFF31` and `#FFFFFF`
    - objects: `#000000`, `#943939`, `#FF8484` and `#FFFFFF`
