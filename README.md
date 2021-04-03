# PAL-1-6502-SBC

This area contains code and material related to the PAL-1, a 6502-based SBC similar to the KIM.

Feel free to correct me, but in general the KIM, introduced in 1976, seems to have been the first commercially produced, fully-assembled, ready-to-run, affordable, microprocesor-based personal computer. (There are a lot of adjectives in that...) It was originally produced by MOS Technologies (later acquied by Commodore) and sold for $245. That all seems like a pretty significant turning point to me--no soldering iron required, no boot-strapping from a front-panel, no terminal or teletype required (but they were supported if you had them), and one of the better early manuals that shows this was really meant to be a "trainer" and demo system for the MOS 6502.

There are a number of 'clones' available ranging from ones that support the old expansion bus to simple ones based on Arduino emulators that cost under $20. The PAL-1 is availabe on [Tindie](https://www.tindie.com/products/tkoak/pal-1-a-mos-6502-powered-computer-kit/) although it sells out quickly and isn't available sometimes.

It seems to be based on Vince Briel's [Micro-KIM](http://www.brielcomputers.com/wordpress/?cat=24) which seemed to based on Ruud Baltissen's [Build Your Own KIM](http://www.baltissen.org/newhtm/buildkim.htm).


## Serial Interface

The connector that came with mine is a male DB-9. Most USB serial interfaces (or interfaces on older computers) are also male DB-9 wired as the DTE device. The PAL-1 has the pinout of a DCE, which would normally have a female DB-9 connector. To get things connected, I used a "gender changer" (DB-9 female-to-female with pins 2, 3, and 5 connected straigt through).

The PAL-1 (just like the KIM-1) uses a 'soft UART' or 'bit banger' for its serial I/O. I'm not a fan of this approach, but at the same time it demonstrates what could be accomplished with a minimial amount of hardware. The PAL-1 automatically figures out the appropriate delay between bits of the serial character when you press enter after a reboot. I have found that decreasing the value actually significantly improves the odds of an error-free load of larger punchtape format files. Below is a table for values found and suggest for $17F2.

| Baud | Found | New |
|------|-------|-----|
|   300|    $EA|  $E8|
| 1,200|    $37|  $35|
| 2,400|    $1A|  $18|
| 4,800|    $0B|  $0A|

I haven't tried to optimize the delay values. Right now I'm using 5 ms between characters and 500 ms between lines when doing 8K transfers and with the modified values I usually am successful. With the default values, it seemed like even with longer delays things would slip out of synchronization at some point more often than not on large transfers.


## Loading Hex Files

The serial monitor has provisions for reading 'paper tape' from a teletype that is being used as a terminal. We can use this capability to import a program. Assuming you have the program in Intel Hex format, you can get the file in the MOS Technologies paper tape format using the following commands:

```
srec_cat infile.hex -intel -o outfile.mos -MOS_Technologies
unix2dos outfile.mos
```

Once it is ready, you can get into the serial monitor. I have had to set fairly high delays (10 ms between characters and 250 ms after a carriage return) in my terminal program to get reliable transfers. Once you are ready, type the following:

```
L (start load, begin transfer of file)
(you should see the data loading until the terminating record)
xxxx<space bar> (type in the address where you want to begin execution)
G (this starts running at the address you just entered)
```

NOTE: While the delays may seem high, the original design was based on something like a teletype operating at 110 or 300 bps. On top of that, the paper tape format included NULL characters after each line to give things (both the teletype and the computer) a bit of time to catch up.


## Memory Test (pal_memt)

People who didn't experience the computers of the 1970s and early 1980s probably don't fully appreciate how import memory tests were at that time. A computer could have dozens upon dozens of memory chips and some inevitably were operating on the boarderline in terms of speed. Things like delay lines (I hate those things...) were necessary for some designs using dynamic memory. Static memory was less painful to work with, but still had it's share of quirks.

When I first put together the PAL-1's 32K memory expansion and the expansion bus, I wanted a way to do a stress test on things. With a 1 MHz processor, you can get away with a lot and I didn't expect to find anything. But knowing that the memory had gone through some type of test gave me some peace of mind.

I am sharing Jim Butterfield's memory test program which appeared in the August 1977 edition of Dr. Dobbs Journal of Computer Calistenics & Orthodontia. It uses an alorigthm developed by Knaizuk and Hartmann (IEEE Transactions on Computers, April 1977) and takes under ten seconds to test the 32K expansion board.

You can load the program in memory using the L command from the monitor. Then go to $0002 (0-0-0-2-space) and press G to execute it.

Memory testing is a combination of art and science. You can't just write, for example, all $FFs to memory and see if it takes them. Sometimes writing to one address may result in the value of another address changing. A lot of thought goes into the paterns used and they look for simple things like an individual bit stuck-at-1 or stuck-at-0, but also take into account how failures beyond the memory itself (like the address lines or the address decoders) might manifest themselves.

This program is fairly straight forward

- $FF is stored in every location in the test range
- $00 is then stored in every third location (giving a pattern of FF FF 00 FF FF 00 ...)
- Memory is tested to make sure each location has the expected value
- The location of the $00 is shifted by one two times, with the above test completed
- Then the entire test is run yet again with the values of $FF and $00 swapped

The test range is set from Page $20 to Page $9F (or from $2000 through $9FFF). If something goes wrong, it will dump you back to the serial monitor and the address location of the error will be displayed. The most likely outcome will be that the memory passes the test, in which case you will be dumped back into the monitor and an address of the the last location tested plus one (in our case $A000) will be displayed.

You can test other ranges of memory by changing $0000 to the starting memory page and $0001 to the ending memory page. You can't test Page Zero (since the program and variables are stored there) and obviously you can't test areas where there isn't memory.

'Back in the day...' we used to have memory tests that would run for hours on end watching for intermittent errors or errors that only occurred as a machine warmed up over the span of several hours. These days you are more likely to maybe find something like a solder bridge between two address lines that causes memory errors.


## FIG FORTH (pal_figforth)

This is still work in progress! I struggled with the raw 6502 version of FIG FORTH, but found this version that had been first tweaked for Vince Briel's Apple 1 clone and then for his Micro-KIM clone.

It did not handle line feeds properly and I moved it over to 64tass and have hacked in a few changes. At this point it seems to work, but I still need to clean up the source code. But I thought there might be some interest, so I'm posting it "as-is" for now.

From the monitor, do a "L" to load pal_figforth.pun. Then make sure $F1 is loaded with $00, go to $2300, and press "G" to execute it. If you don't use Forth much, try:
```
2 2 + .
```
This pushes 2 and 2 onto the stack, adds them, and displays the result. Or you can try the following:
```
: HELLO ." Hello, World!" CR ;
```
Watch the spaces! If you get it right, this defines a `HELLO` command that you can now execute by typing at the command line.


## JMON by Jeff Tranter

This is a fairly complete monitor for the 6502. I am still working through some display quirks on the PAL-1/KIM. The KIM echos all input keys, so if you use ESCape to quit a listing, that gets sent to the terminal. Minicom (and I would assume other terminal programs) don't like that. (I send a space and carrage return to finish out a dummy escape sequence for now.)

Some of the other parts of displays are a bit off. For some reason, the code only sends CRs as the newline. I'm adding LFs, but I know there is still work to do in the area of displaying registers. Over time, I'll go through all the cammands to make sure they work like they should. Eventually I'll probably have four version--one for $2000 and one for the top of memory, and then flavors of both with and without the assembler (which doubles the size of things). Having something like this earlier in my troubleshooting of Forth would have helped a lot, but I need it to be out of the way of where Forth loads (at $2000 like many things that use expanded memory on the KIM).


## Tiny BASIC

This is the version of Tiny Basic by Tom Pittman and available on Bob Applegate's website.

I have patched it to handle the backspace key instead of using the underscore chracter. (It does not actually erase or delete the character on the screen, but you can backspace and then type over your error.) It also sets $F1 to $00 which will clear the decimal mode when you start the program.

Cold start is at $0200 and warm start is at $0203.


## Microsoft 9-Digit BASIC

This is the 9-digit version of Microsoft BASIC for the 6502.

It does set $F1 to $00 which will clear the decimal mode when you start the program. I have patched this to allow use of the backspace ($08) as well as the underscore ($5F). To do this, I hacked the code that previously allowed the BELL ($07) through as a valid character to intercept the backspace. (This means the bell is no longer treated as a valid input character.)

I'm still try to get the patch for "Control-C" working. (Basically where pressing any key while a program is executing will interupt it--there is no 'buffer' for characters in the approach the KIM uses for serial communications.) I may also hack the need to enter a Y at the trig functions prompt since memory isn't really an issue.

Initial startup is at $4065. After the initial start, there is a warm start jump at $0000.


## Power

I am powering mine off a metered and regulated variable power supply. At 6 volts, it draws between about 0.30 and 0.31 amps with the LED display going. (The current varies by how many segments you're lighting up.) When the display is disabled and you are using the serial port, consumption is around 0.26 amps.

The regulator gets pretty warm if I feed it 7 volts. Another quirky thing is that with (for example) serial going, I see the 0.26 amps at 6 volts but 0.29 amps at 7 volts. A voltage regulator data sheet can do a better job explaining linear regulators than I can, but I would not expect to see current change much just because the voltage fed to the regulator goes up a bit. (Normally it is the current demands of the circuit on the regulated side of the regulator that is the main driver of current consumption.)


## cpu_up_kim

This program is just tinkering with direct writes to the 6532 registers to drive the LED display to show the message "CPU UP" similar to what the old Heathkit 6800 trainers would display.

It is minimalistic and brute force for simplicity. For example, you could save some space by writing both of the letters P one after another and the letters U one after another instead of seperately. Once you know the fourth location is blanked, you don't really need to blank it again and could move that step to some initialization code. Some of the code immediately before and after the delay subroutine call could be moved down into the subroutine itself. Those are things to work with if you're interested in messing with the code.


## proc_kim

I have been testing some code that determines what type of processor a system is running (the original NMOS vs. the extended CMOS commands). I want to test it on the PAL-1, so this is mainly work-in-progress for now...

My kit has a UMC UM6502 which is an NMOS device that has the original behavior. The four bit "signiture" I gater is `$00 $B0 $FF $B4`. The second byte shows that the Z flag was not set after doing BCD addition of $99 + $01. The third byte shows that $1A acted as a NOP instead of an INC A which is the expected behavior from the older NMOS devices.

I had to use X in the message routine because the A and Y registers are changed after calling OUTCH.


## Srecord use and bug...

I use s`rec_cat` a lot to convert things into the MOS Technologies punched tape format. You can make patches and then fix the checksums with something like:

```
$ srec_cat -ignore-checksum -line-length 41 prog.mos -MOS_Technologies -o prog.mos -MOS_Technologies
```

If you have a binary file, you can set a base address and convert it using:

```
$ srec_cat -line-length 41 prog.bin -Binary -offset 0x2000 -o prog.mos -MOS_Technologies
```

During development work, my assembler generates Intel hex files which can be converted using:
```
$ srec_cat -ignore-checksum -line-length 41 prog.hex -intel -o prog.mos -MOS_Technologies
```

You don't really need the `-line-length` option, but out of habit on the 6502 I would rather not have records that cross page boundaries. The KIM monitor handles things fine, but it's still something I tend to do.

During all of this, I have found a bug in `srec_cat`. (I've used the program for a long time and it is generally incredibly solid.) The final record of a punch tape should indicate a length of zero, then have a four digit (hex) line count, and finish with a four digit (hex) checksum. On longer punch sessions, you might see something like `;0002520252` at the end of the `srec_cat` output with will yield this on the PAL-1/KIM:
```
;0002520252 ERR KIM
```
For up to 255 lines, you are fine. But the checksum is not being calculated--instead the line count is being repeated. The final line should actually read `;0002520054` where $0054 is the sum of the values of the bytes.

**NOTE:** I have heard from Scott who maintains `srec_cat` and provided him with the details of what is going on. (There actually seems to be another "quirk" where some lines are dumped with 16 bytes of data instead of 24 bytes.) From looking at the source code, I believe the original code thought the line count was repeated twice.
