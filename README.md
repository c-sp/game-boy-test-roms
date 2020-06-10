![](https://github.com/c-sp/gameboy-test-roms/workflows/build%20and%20release/badge.svg)

Have a Gameboy emulator you want to test for accuracy?
This collection of
[precompiled Gameboy test roms]()
**TODO add link to releases once they are "CI'd"**
might be useful.

Current contents:
* [Mooneye GB](https://github.com/Gekkio/mooneye-gb)
  test roms written by
  [Joonas Javanainen](https://github.com/Gekkio)
* [Gambatte](https://github.com/sinamas/gambatte)
  test roms written by
  [sinamas](https://github.com/sinamas)
* [test roms](https://github.com/retrio/gb-test-roms)
  written by
  [Blargg](http://blargg.8bitalley.com/)


# Blargg test roms

[Blargg's test roms](https://github.com/retrio/gb-test-roms)
are located at `blargg/` inside the released zip file.

A test has finished successfully if the emulator's screen matches the
respective
[screenshot](src/blargg-expected).
The (emulated) time required for a test to complete varies:

| test | emulated seconds |
|---|---|
| `cgb_cpu_instrs` | 30 |
| `dmg_cpu_instrs` | 54 |
| `cgb_instr_timing` | 1 |
| `dmg_instr_timing` | 1 |
| `cgb_mem_timing` | 4 |
| `dmg_mem_timing` | 4 |
| `cgb_sound` | 37 |
| `dmg_sound` | 36 |


# Mooneye GB test roms

[WLA DX](https://github.com/vhelin/wla-dx)
is used to compile [Mooneye GB](https://github.com/Gekkio/mooneye-gb)
test roms.
They are located at `mooneye-gb/` inside the released zip file.

Be aware that some Mooneye GB tests are written for specific Gameboy hardware.
They might fail depending on what hardware your emulator supports.

Each Mooneye GB test rom executes opcode `0x40: LD B, B` when finished
which can be used as exit condition.
A test has succeeded if the CPU registers contain the following Fibonacci
sequence part when finished:
```
    B = 3
    C = 5
    D = 8
    E = 13
    H = 21
    L = 34
```


# Gambatte test roms

TODO


# TODO: more test roms

- https://github.com/LIJI32/SameSuite
- https://github.com/mattcurrie/mealybug-tearoom-tests
- https://github.com/mattcurrie/dmg-acid2/
- https://github.com/mattcurrie/cgb-acid2/

requires https://github.com/rednex/rgbds
