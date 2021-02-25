# Build your own KIM-1

## DISCLAIMER

- All names with a copyright are acknowledged.
- Some information is derived from deduction after reading a lot of documents and can be unreliable due to the lack of real proof.
- If the reader uses information from this document to write software or build hardware, then it is on his own account. I cannot be held responsible for blowing up your computer, mother-in-law or whatever; it will always be your own fault.
- I'm not a sexist, with 'he' and 'him' I also mean 'she' and 'her'.


## Copyrights
-    This page may contain material which originally is not mine. But as long as nobody can tell me who owns the rights of what, I simply provide it to anyone who is interested. If there is anybody who thinks he owns the rights of the provided material, please inform me and I obey his wishes regarding this material.
-    So you may copy every bit on this page for NON-commercial use but, regarding the above, I won't take any responsebility. I hope you enjoy it. If you use it, just give me at least some credit like "Stolen from Ruud" :-)


## What is the KIM-1?

If you don't know that by now then read the document about the KIM-1 first. This can be found here on FUNET as well.


## The troubleshooter: 6530

Anybody who is a little bit familiar with the hardwaremarket can tell you that you cannot buy the 6530 anymore. Happilly enough there is another IC available which you could call its brother: the 6532.

The 6532 has 16 I/O-lines, an internal timer and 128 bytes of RAM onboard. And no ROM. But we know by now that the internal ROM of the 6530 could be selected unindependently from the I/O. So for this project we'll use an external EPROM as replacement. The pinout of the 6532 is completely different but that should not be a problem.

The next difference is the fact that the 6532 has a sepperate IRQ and PB7 line. As we will see, the functionality of both lines is the same as with the 6530. To create the same circumstances we only have to connect them together.

The third difference is the availability of PB6 with a 6532. See it as a bonus because I haven't found any reason how it could harm us.

The fourth difference is that it is possible to generate an interrupt depending the behaviour of PA7. But this is an option which is out of function by default after a reset. But the major difference lays in the way the registers are selected:

```
funtion:        RS:  A6:  A5:  A4:  A3:  A2:  A1:  A0:  R/W:

RAM              0    x    x    x    x    x    x    x    x

DRA              1    x    x    x    x    0    0    0    x     A
DDRA             1    x    x    x    x    0    0    1    x     B
DRB              1    x    x    x    x    0    1    0    x     C
DDRB             1    x    x    x    x    0    1    1    x     D

PA7, IRQ off,
      neg edge   1    x    x    0    x    1    0    0    0     F
PA7, IRQ off,
      pos edge   1    x    x    0    x    1    0    1    0     G
PA7, IRQ on,
      neg edge   1    x    x    0    x    1    1    0    0     H
PA7, IRQ on,
      pos edge   1    x    x    0    x    1    1    1    0     I

read interrupt
       flag      1    x    x    x    x    1    x    1    1     E

read timer,
       IRQ off   1    x    x    x    0    1    x    0    1     J
read timer,
       IRQ on    1    x    x    x    1    1    x    0    1     K

Clock / 1,
       IRQ off   1    x    x    1    0    1    0    0    0     L
Clock / 8,
       IRQ off   1    x    x    1    0    1    0    1    0     M
Clock / 64,
       IRQ off   1    x    x    1    0    1    1    0    0     N
Clock / 1024,
       IRQ off   1    x    x    1    0    1    1    1    0     O

Clock / 1,
       IRQ on    1    x    x    1    1    1    0    0    0     P
Clock / 8,
       IRQ on    1    x    x    1    1    1    0    1    0     R
Clock / 64,
       IRQ on    1    x    x    1    1    1    1    0    0     S
Clock / 1024,
       IRQ on    1    x    x    1    1    1    1    1    0     T
```

In total 5 addresslines are used, meaning 32 registers. But 11 of the 19 registers have one or more mirrors.

```
Read:      JEJE     KEKE     JEJE     KEKE
Write:     FGHI     FGHI     LMNO     PRST
R/W:   ABCD     ABCD     ABCD     ABCD
```

As we can see, the last 16 registers equal the 16 of the 6530. So now we have to develop some logic which wil do the following:

- The 6532 is only visible within a range of 128 bytes
- The first 16 bytes represent register 16 to 31
- The next 48 byte are free
- The last 64 bytes apear as RAM


## Conclusion:

- Input A6 won't be used and can be tied to GND
- Input A4 is connected to addressline A4 of the 6502 via an invertor.
- An 74145 or equivalent enables the CS-line at the right moment within the 128 bytes.


## ROM and RAM

Here we have a luxury problem. We need 2K of ROM like the 2716.

The problem is that the 2716 is hard to find and more expensive then the 2764 or his bigger brothers. When we use a bigger EPROM we only have to tie the unused addresslines to GND. The same problem occurs with the RAM.

If we have to use bigger RAMs or EPROMs anyway, it is quite easy to use other parts of that chip by OR-wiring the CS-line with more Kx-outputs of the main 74154. (Don't forget the addresslines!) In case of the EPROM we als can tie switches to the surplus addresslines and have the advantage of a multi-KERNEL system.


## Sourcecodes of the ROM

Available here on FUNET. Seem 100% OK but I don't have the original binaries, so I cannot garantee their correctness.


## Schematics of the new KIM-1

Available here as well.


## What are the major differences with the original SCH?

- Replacement of the 6530s by 6532s.
- Replacement of the 6108 RAM-ICs by one 6264 or equivalent 8K*8 SRAM.
- Adding an EPROM.
- Combining K6 and K7 to one line, dropping the resistor for K6.
- Adding a 74LS138 to decode the RAM and I/O of the 6532s.
- Adding jumpers to enable combining other K-lines as well.
- Adding an extra 145. In this way we can use the complete 64K range. The original KIM only used the area $0000/$1FFF but the 6502 expects the RESET and other two vectors in the area $FFFA/$FFFF so we have to connect output 0 with output 7 to emulate this situation.

I didn't change things which are more or less obvious like replacing the clockcircuit by a module or replacing all different TTL-ICs by LS or HCT types.

You can reach me at:  rbaltiss@worldaccess.nl

Have fun, Ruud Baltissen
