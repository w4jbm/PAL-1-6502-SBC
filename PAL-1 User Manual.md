The manual for the PAL-1 is available for download, but is in Chinese. This is my attempt to capture the translation of that material as I go through it.

# PAL-1 Eight-Bit Computer User Manual

Technology Small Production\
Aibis | Bantian, Shenzhen

***

V1.0
The information in this manual has been reviewed and is believed to be completely reliable. However, we are not responsible for any inaccuracy. This material is for reference only and subject to change without notice.

Technology Small Production\
November 2020

Technical Support: liugn@outlook.com

> Blockquotes are notes related to the translation or content. Obviously the translation is also not responsible for inaccuracies and meant for reference only.

***

Table of Contents

***

## PAL-1 HINTS

Thank you for supporting PAL-1!

If you purchased the PAL-1 as a kit, be aware that the uninstalled chips may be damaged by electrostatic discharge. Please use the appropriate precations during the construction and installation process. Although static electricity will have little effect on the components once they have been installed on the PCB (PAL-1 motherboard), care must be taken prior to and during their installation. You should make sure to discharge static electricy prior to touching conductive portions of the PAL-1.

PAL-1 is a Single Board Computer based on MOS 6502 microprocessor with a design based on the original MOS/Commodore KIM-1 computer which was popular with early 6502 hobbyist. The design includes upgrades (such as the TTY RS232 interface and the expansion interface) based on work by Vince Briel and Rich Dreher.

While it is compatible with most programs written for KIM-1, some chips such as the pair of 6530 RRIOT chips used in the original are difficult to obtain. The PAL-1 makes use of the 6532 RIOT chip and an EPROM which contains the monitor program originally found in the 1K ROMs the 6532 included.

Another difference is that each 6530 chip originally provided 64 bytes of RAM while the 6532 provides 128 bytes of RAM. With appropriate address decoding, a single 6532 can replace the RAM found on two 6530s.

PAL-1 reduces the two 6530 chips on the KIM-1 to one 6532, which is mainly done to reduce the number of core chips
Although 6532 can still be found, it is also difficult. After reducing a slice of 6532 through the above replacement scheme,
PAL-1 loses 50% of I/O ports and 50% of timers while maintaining compatibility with KIM-1's core capabilities;
In spite of this, PAL-1 can still add more I/O or peripherals via expansion cards as needed.
After I completed the PAL-1 experiment, I really like this classic computing platform. It can bring me 1970~80
It’s a super cool computing experience, and don’t worry about damaging the delicate and rare original KIM-1.
Hope you can also find the budding feeling of personal computers on PAL-1 & Happy Hacking with 6502!
Liu Ganning (刘甘宁)
