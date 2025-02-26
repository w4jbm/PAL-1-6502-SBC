
# PAL-1 ROM Board

This work is related to a ROM board which has 16K of memory mapped at $A000. I am using a 27C256, so the EPROM itself holds 32K. A15 can be tied high or low to select one of two "banks" of memory.

The best way to get started to is to read the manual included here in PDF format. A kit for the PAL-1 EPROM card is available on [Tindie](http://www.tindie.com/products/tkoak/pal-1-rom-expansion-kit/) from Liu Ganning. The software itself is available here if you want to build your own ROM card from scratch (I did the development on a protoboard version) along with the source and enough documentation where you should be able to build your own customer EPROM images if you wish.


## Bank 0 ROM Loader


The ROM Loader program is a simple front-end that was originally designed to let you copy 'files' off the ROM and down into memory. When you power up the PAL-1, you will need to type `A000<space>G` to execute the program on the EPROM. At that point you will see a message like this:

```
PAL-1 ROM Loader v1.0

(B)ASIC, (F)ORTH, eWo(z) Monitor, or e(X)it? _
```

Typing 'B' will move the widely used copy of Microsoft 9 digit BASIC down to $2000 and start it.

Typing 'F' will move a version of FIG Forth down to $2300 and start it.

Typing 'z' will start the eWoz monitor which is ran out of ROM (but does use a number of Page Zero locations).

Typing 'X' will return you to the PAL-1's regular monitor.

There is also an 'M' option that is not listed. This will copy the memory test program by Jim Butterfield that can be found in the First Book of KIM and also the August 1977 issue of Dr. Dobb's Journal. It is set up to test the 32K memory expansion board and you will be put into the PAL-1's monitor at $0002. All you should have to do is type 'G' for the memory test to run. If it runs successfully, you will return to the monitor pointing to $A000 (the first address past the range tested). If it encounters an error, you will return to the monitor pointing to the address where an error was encountered.

NOTE: During development I am getting occassional memory errors, but at this point I believe those are due to the rather messy breadboard layout I used to first prototype a ROM expansion board.

The ROM loader converts all input to upper case, so lower case leters can be entered and will work.

There are some useful routines in the ROM that I will document at some point. One of these is a routine that uses a hardware 'trick' to allow input of a character without it automaticially echoing. (This is used by eWoz.) There is also a memory copy routine and a routine to print a null delimited string. You can find these in the romload.lst file, but they may change as this is debugged and finalized.

The BASIC and Forth versions loaded are converted to hex data that is included during the assembly process. The memory test is also hex data, but I use a special 'Page Zero friendly' copier to move this down to Page Zero.

I was asked about "relocating" the BASIC into the ROM space so it didn't have to be loaded into RAM. This would allow more free RAM to be available for use. Unfortunately there are parts of the KIM's BASIC that are self-modifying, so relocation to ROM isn't really possible. At some point I might implement a BASIC in ROM, but there is a lot (by 1970s standard) of RAM left even with loading BASIC into RAM. (If you are skeptical, please give it a try--I've found that what was most limiting was the time it took to load the BASIC interpreter which is now nearly instantaneous. I haven't come close to running out of program memory.)


## Bank 1 Programs
  
Bank 1 has the following programs at the noted start address

Program | Address
---|--:
Apple 1 Integer BASIC | $A000
eWoz Monitor | $B000
PBUG Monitor | $B400
VTL-02 | $D700


## Reporting Bugs or Requesting Features

Please feel free to report any bugs you find! I try to test things before releasing them, but sometimes things slip through.

If there are features you would like to see added, I'd be interested in hearing about them (although I can't promise they'll always get implemented). Or if you want to add features on your own, I'm happy to assist as possible. All of the source code to create and modify your own images is here.

Development is done under Linux and I use a number of tools such as 64tass, CA65, make, and srec_cat.


## The fine print...

The copyright for some of the material included here is held by others and subject to various terms and conditions.

These are intended for personal use only. Any material will be removed at the request of the copyright holder or those holding other rights to it.

To the extent applicable, any original work herein is:

Copyright (C) 2021 by Jim McClanahan (W4JBM)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
