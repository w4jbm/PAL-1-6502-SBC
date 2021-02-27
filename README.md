# PAL-1-6502-SBC

This area contains code and material related to the PAL-1, a 6502-based SBC similar to the KIM.

Feel free to correct me, but in general the KIM, introduced in 1976, seems to have been the first commercially produced, fully-assembled, ready-to-run, affordable, microprocesor-based personal computer. (There are a lot of adjectives in that...) It was originally produced by MOS Technologies (later acquied by Commodore) and sold for $245. That all seems like a pretty significant turning point to me--no soldering iron required, no boot-strapping from a front-panel, no terminal or teletype required (but they were supported if you had them), and one of the better early manuals that shows this was really meant to be a "trainer" and demo system for the MOS 6502.

There are a number of 'clones' available ranging from ones that support the old expansion bus to simple ones based on Arduino emulators that cost under $20. The PAL-1 is availabe on [Tindie](https://www.tindie.com/products/tkoak/pal-1-a-mos-6502-powered-computer-kit/) although it sells out quickly and isn't available sometimes.

It seems to be based on Vince Briel's [Micro-KIM](http://www.brielcomputers.com/wordpress/?cat=24) which seemed to based on Ruud Baltissen's [Build Your Own KIM](http://www.baltissen.org/newhtm/buildkim.htm).


## Serial Interface

The connector that came with mine is a male DB-9. Most USB serial interfaces (or interfaces on older computers) are also male DB-9 wired as the DTE device. The PAL-1 has the pinout of a DCE, which would normally have a female DB-9 connector. To get things connected, I used a "gender changer" (DB-9 female-to-female with pins 2, 3, and 5 connected straigt through).


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


## Tiny BASIC

This is the version of Tiny Basic by Tom Pittman and available on Bob Applegate's website.

I have patched it to handle the backspace key instead of using the underscore chracter. (It does not actually erase or delete the character on the screen, but you can backspace and then type over your error.)


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
