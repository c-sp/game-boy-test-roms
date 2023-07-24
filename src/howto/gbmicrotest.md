# GBMicrotest

[GBMicrotest](https://github.com/aappleby/GBMicrotest) test roms are compiled
with [WLA DX](https://github.com/vhelin/wla-dx).

## Game Boy Devices & SoC Revisions

According to the project's
[README](https://github.com/aappleby/GBMicrotest/blob/main/README.md)
tests have been checked on real hardware believed to be a DMG-CPU-08.
Matching CPU units would be
[a DMG-CPU B or a DMG-CPU C](https://gbhwdb.gekkio.fi/consoles/dmg/).

## Exit Condition

While most tests complete after a few hundred cycles,
some tests check behaviour after v-blank and thus take more time.
Running the emulation for two frames should be sufficient.

The only exception is `is_if_set_during_ime0.gb` which has to run for about
380 milliseconds emulated time to be able to succeed.

## Test Success/Failure

Test results are written to Game Boy ram at `0xFF80 - 0xFF82`:

* `0xFF80` contains the actual test result
* `0xFF81` contains the expected test result
* `0xFF82` contains `0x01` if the test passed or `0xFF` if the test failed

You should only check `0xFF82` when evaluating test results though.
`0xFF80` and `0xFF81` are not always set consistently,
e.g. there are tests which set `0xFF80 == 0xFF81` on failure.
