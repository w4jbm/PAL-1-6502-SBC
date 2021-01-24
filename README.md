# PAL-1-6502-SBC

This area contains code and material related to the PAL-1, a 6502-based SBC similar to the KIM.

Feel free to correct me, but in general the KIM, introduced in 1976, seems to have been the first commercially produced, fully-assembled, ready-to-run, affordable, microprocesor-based personal computer. (There are a lot of adjectives in that...) It was originally produced by MOS Technologies (later acquied by Commodore) and sold for $245. That all seems like a pretty significant turning point to me--no soldering iron required, no boot-strapping from a front-panel, no terminal or teletype required (but they were supported if you had them), and one of the better early manuals that shows this was really meant to be a "trainer" and demo system for the MOS 6502.

There are a number of 'clones' available ranging from ones that support the old expansion bus to simple ones based on Arduino emulators that cost under $20. The PAL-1 is availabe on [Tindie](https://www.tindie.com/products/tkoak/pal-1-a-mos-6502-powered-computer-kit/) although it sells out quickly and isn't available sometimes.


## Serial Interface

The connector that came with mine is a male DB-9. Most USB serial interfaces (or interfaces on older computers) are also male DB-9 wired as the DTE device. The PAL-1 has the pinout of a DCE, which would normally have a female DB-9 connector. To get things connected, I used a "gender changer" (DB-9 female-to-female with pins 2, 3, and 5 connected straigt through).


## Power

I am powering mine off a metered and regulated variable power supply. At 6 volts, it draws between about 0.30 and 0.31 amps with the LED display going. (The current varies by how many segments you're lighting up.) When the display is disabled and you are using the serial port, consumption is around 0.26 amps.

The regulator gets pretty warm if I feed it 7 volts. Another quirky thing is that with (for example) serial going, I see the 0.26 amps at 6 volts but 0.29 amps at 7 volts. A voltage regulator data sheet can do a better job explaining linear regulators than I can, but I would not expect to see current change much just because the voltage fed to the regulator goes up a bit. (Normally it is the current demands of the circuit on the regulated side of the regulator that is the main driver of current consumption.)
