These files are related to the development of a ROM expansion board for the PAL-1.

I was asked about "relocating" the BASIC into the ROM space so it didn't have to be loaded into RAM. There are parts of the KIM's BASIC that are self-modifying, so relocation to ROM isn't really possible. At some point I might port EhBASIC over, but there is a lot (by 1970s standard) of RAM left even with loading BASIC into RAM.

This is work in progress and may be broken in places. (I know that A13 needs to be inverted or the ROM image needs to be tweaked as a minimum.)

