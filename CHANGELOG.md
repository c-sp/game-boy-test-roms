## [v7.0](https://github.com/c-sp/gameboy-test-roms/releases/tag/v7.0) *(2024-02-25)*

- add [MBC3 Tester:40065adab0](https://github.com/EricKirschenmann/MBC3-Tester-gb/tree/40065adab0)
  *(2021-03-02)*
- add [TurtleTests:b341ff54ec](https://github.com/Powerlated/TurtleTests/tree/b341ff54ec)
  *(2020-09-05)*
- add [Scribbltests:96dd2f14bc](https://github.com/Hacktix/scribbltests/commit/96dd2f14bc)
  *(2020-12-25)*

## [v6.0](https://github.com/c-sp/gameboy-test-roms/releases/tag/v6.0) *(2023-07-24)*

- add
  [GBMicrotest:f3b55497c1](https://github.com/aappleby/GBMicrotest/tree/f3b55497c1)
  *(2023-05-07)*

## [v5.2](https://github.com/c-sp/gameboy-test-roms/releases/tag/v5.2) *(2023-07-24)*

- upgrade to
  [Mooneye Test Suite:8d742b9d55](https://github.com/Gekkio/mooneye-test-suite/tree/8d742b9d55)
  *(2022-03-17)*
- compile Mooneye Test Suite with
  [wla-dx:d8b51a99ff](https://github.com/vhelin/wla-dx/tree/d8b51a99ff)
  *(2022-05-05)*
- upgrade to
  [SameSuite:f71b4b3c37](https://github.com/LIJI32/SameSuite/tree/f71b4b3c37)
  *(2022-04-10)*

## [v5.1](https://github.com/c-sp/gameboy-test-roms/releases/tag/v5.1) *(2022-12-10)*

- fix Blargg
  [interrupt_time-dmg.png](src/blargg-expected/interrupt_time/interrupt_time-dmg.png)
  screenshot

## [v5.0](https://github.com/c-sp/gameboy-test-roms/releases/tag/v5.0) *(2022-12-07)*

- add
  [BullyGB:e24fe6fd7f](https://github.com/Hacktix/BullyGB/tree/e24fe6fd7f)
  *(2021-02-26)*
- add
  [strikethrough:7cd01bf916](https://github.com/Hacktix/strikethrough.gb/tree/7cd01bf916)
  *(2021-03-05)*
- [little-things-gb](https://github.com/pinobatch/little-things-gb): add
  [Telling LYs](https://github.com/pinobatch/little-things-gb/tree/master/tellinglys)
  *(2022-09-22)*
- restructure readme:
  add a readme for each test suite
- remove `age-test-roms/_in-progress` as these tests are not finished yet
- add custom `manual-only/sprite_priority` screenshots (Mooneye Test Suite)
- add DMG screenshot for Blargg's oam_bug test
- refactor Blargg screenshots to use cgb-acid2 compatible colors
- adjust Blargg screenshots naming:
  use suffixes to indicate compatible Game Boy devices
  (e.g. `<...>-dmg.png` or `<...>-cgb.png`)

## [v4.0](https://github.com/c-sp/gameboy-test-roms/releases/tag/v4.0) *(2022-03-30)*

- add
  [rtc3test:80ae792bf1](https://github.com/aaaaaa123456789/rtc3test/tree/80ae792bf1)
  *(2020-12-02)*
- add
  [wilbertpol/mooneye-gb:b78dd21f0b](https://github.com/wilbertpol/mooneye-gb/tree/b78dd21f0b)
  *(2016-07-05)*
- add
  [little-things-gb/firstwhite:9d168486e1](https://github.com/pinobatch/little-things-gb/tree/9d168486e1/firstwhite)
  *(2020-11-23)*
- compile with
  [RGBDS v0.5.2](https://github.com/gbdev/rgbds/releases/tag/v0.5.2)
  *(2021-11-23)*
- upgrade to
  [age-test-roms:cd3f654d13](https://github.com/c-sp/age-test-roms/tree/cd3f654d13)
  *(2022-03-17)*

## [v3.2](https://github.com/c-sp/gameboy-test-roms/releases/tag/v3.2) *(2021-12-30)*

- upgrade to
  [cgb-acid2:04c6ca40cf](https://github.com/mattcurrie/cgb-acid2/tree/04c6ca40cf)
  *(2021-02-26)*
- remove Mealybug Tearoom Test screenshot placeholders
  (e.g. [this one](https://github.com/mattcurrie/mealybug-tearoom-tests/blob/acf48f3f78/expected/CPU%20CGB%20C/m3_lcdc_win_en_change_multiple_wx.png))
- upgrade to
  [age-test-roms:3b27d1c1fb](https://github.com/c-sp/age-test-roms/tree/3b27d1c1fb)
  *(2021-12-23)*
- upgrade to
  [mooneye-test-suite:86d1acf2b3](https://github.com/Gekkio/mooneye-test-suite/tree/86d1acf2b3)
  *(2021-10-31)*
- compile the Mooneye Test Suite with
  [wla-dx:c3cfb15ce2](https://github.com/vhelin/wla-dx/tree/c3cfb15ce2)
  *(2021-10-17)* as this is the commit ID used by the
  [mooneye-test-suite build job](https://github.com/Gekkio/mooneye-test-suite/blob/86d1acf2b3/.github/workflows/ci.yml#L14)
- add Blargg `halt_bug` DMG screenshot and update Blargg test documentation
- include each test suite's readme file(s)


## [v3.1](https://github.com/c-sp/gameboy-test-roms/releases/tag/v3.1) *(2021-09-30)*

- upgrade to
  [mooneye-gb:2d52008228](https://github.com/Gekkio/mooneye-gb/tree/2d52008228)
  *(2021-04-30)*
  and include Mooneye GB test reference screenshots in the release archive
- compile Mooneye GB test roms with
  [wla-dx:eba3774e8d](https://github.com/vhelin/wla-dx/tree/eba3774e8d)
  *(2021-02-21)* as this is the commit ID used by the
  [mooneye-gb:2d52008228](https://github.com/Gekkio/mooneye-gb/tree/2d52008228)
  `build_test_roms` job
- switch from
  [gambatte](https://github.com/sinamas/gambatte)
  to
  [gambatte-core:d819bad196](https://github.com/pokemon-speedrunning/gambatte-core/tree/d819bad196)
  *(2021-09-23)*
  as the former is not public anymore
- upgrade to
  [SameSuite:eb48ef5a90](https://github.com/LIJI32/SameSuite/tree/eb48ef5a90)
  *(2021-09-04)*
- upgrade to
  [age-test-roms:abefbbdb37](https://github.com/c-sp/age-test-roms/tree/abefbbdb37)
  *(2021-09-30)*


## [v3.0](https://github.com/c-sp/gameboy-test-roms/releases/tag/v3.0) *(2021-06-21)*

- add
  [age-test-roms:620943b975](https://github.com/c-sp/age-test-roms/tree/620943b975)
  *(2021-06-17)*
- add
  [cgb-acid-hell:107b7c5a87](https://github.com/mattcurrie/cgb-acid-hell/tree/107b7c5a87)
  *(2021-03-22)*
- add
  [same-suite:a09fc186fb](https://github.com/LIJI32/SameSuite/tree/a09fc186fb)
  *(2020-10-18)*
- upgrade to
  [mealybug-tearoom-tests:70e88fb90b](https://github.com/mattcurrie/mealybug-tearoom-tests/tree/70e88fb90b)
  *(2020-12-19)*
- upgrade to
  [RGBDS:8b60efa149](https://github.com/gbdev/rgbds/tree/e970b6d6eb)
  *(2021-05-15)*
- add several Blargg reference screenshots and document the missing ones


## [v2.0](https://github.com/c-sp/gameboy-test-roms/releases/tag/v2.0) *(2020-07-09)*

- add
  [dmg-acid2:8a98ce731f](https://github.com/mattcurrie/dmg-acid2/tree/8a98ce731f)
  *(2020-04-21)*
- add
  [cgb-acid2:76c4e2c42d](https://github.com/mattcurrie/cgb-acid2/tree/76c4e2c42d)
  *(2020-04-21)*
- add
  [mealybug-tearoom-tests:844b92ea59](https://github.com/mattcurrie/mealybug-tearoom-tests/tree/844b92ea59)
  *(2019-10-24)*
- compile dmg-acid2, cgb-acid2 and mealybug-tearoom-tests with
  [RGBDS:8b60efa149](https://github.com/rednex/rgbds/tree/8b60efa149)
  *(2020-06-27)*


## [v1.1](https://github.com/c-sp/gameboy-test-roms/releases/tag/v1.1) *(2020-06-14)*

- upgrade to
  [mooneye-gb:6b9488fa3e](https://github.com/Gekkio/mooneye-gb/tree/6b9488fa3e)
  *(2020-04-18)*
- compile Mooneye GB test roms with
  [wla-dx:de9a0fcdd0](https://github.com/vhelin/wla-dx/tree/de9a0fcdd0)
  *(2020-01-03)* as this is the commit ID used by the
  [mooneye-gb:6b9488fa3e](https://github.com/Gekkio/mooneye-gb/tree/6b9488fa3e)
  `build_test_roms` job
- upgrade to
  [gambatte:56e3371151](https://github.com/sinamas/gambatte/tree/56e3371151)
  *(2020-03-08)*


## [v1.0](https://github.com/c-sp/gameboy-test-roms/releases/tag/v1.0) *(2020-06-13)*

- compile Mooneye GB test roms with
  [wla-dx:d9a3237cc2](https://github.com/vhelin/wla-dx/tree/d9a3237cc2)
  *(2019-05-30)*
- add
  [mooneye-gb:7cb040d0b7](https://github.com/Gekkio/mooneye-gb/tree/7cb040d0b7)
  *(2019-05-11)*
- add
  [gambatte:f93c5be1a4](https://github.com/sinamas/gambatte/tree/f93c5be1a4)
  *(2019-05-13)*
- add
  [gb-test-roms:c240dd7d70](https://github.com/retrio/gb-test-roms/tree/c240dd7d70)
  *(2015-06-25)*
