# Apple 1 Integer BASIC

This is a port of Apple 1 Integer BASIC (A1B) to the PAL-1. It should also run on the original KIM-1, Corsham's KIM Clone, and Briel's Micro-KIM.

There are two files you need to load using the KIM-1 monitor.

- a1b.mos: This file contains an image of the Apple 1 Integer BASIC relocated from $E000 down to $8000.
- a1b_ptch.mos:: This is a patch file that patches a few locations in the ROM image and also includes enhanced startup and input / output routines used by A1B

