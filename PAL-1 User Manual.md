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

If you purchased a PAL-1 kit, the uninstalled chips may be damaged by electrostatic discharge, please pay attention to the installation operation
The problem of static electricity at the time! Although static electricity has little effect on the components that have been installed on the PCB (PAL motherboard), it is recommended
It is recommended that when touching the metal part of the PAL directly, make sure that the static electricity has been discharged, and touch the object that has been electrically charged in dry weather.
Products, such as door handles, stair handrails, water pipes.
PAL-1 is a single board computer (Single Board Computer) based on MOS 6502 microprocessor.
The structure and design are basically copied according to the MOS/Commodore KIM-1 computer, and refer to the 6502 hobbyist
The replacement/upgrade information of related parts in the website, the TTY RS232 interface and the expansion interface part use Rich Dreher
And Vince Briel's design.
PAL-1 is a modern reissue version of KIM-1, which is compatible with most programs and data written for KIM-1;
It is not possible to obtain the chips used by KIM-1 one-to-one, mainly the two 6530 RRIOT integrated circuits used by KIM-1.
Road, PAL-1 uses 6532 RIOT chip to replace. The functions of these two chips are very similar, the biggest difference is
The 6530 chip provides 1K bytes of ROM, but the 6532 does not. By adding an EPROM core to the system
The ROM data of 6530 is stored in the chip, and then the 6532 is combined with this "external"
EPROM chips can be replaced. The second difference is that the 6530 chip provides 64 bytes of RAM, while
6532 provides 128 bytes of RAM, so that we can decode the original communication on KIM-1 through appropriate address decoding.
A total of 128 bytes of RAM provided by two 6530s are combined into one 6532.
PAL-1 reduces the two 6530 chips on the KIM-1 to one 6532, which is mainly done to reduce the number of core chips
Although 6532 can still be found, it is also difficult. After reducing a slice of 6532 through the above replacement scheme,
PAL-1 loses 50% of I/O ports and 50% of timers while maintaining compatibility with KIM-1's core capabilities;
In spite of this, PAL-1 can still add more I/O or peripherals via expansion cards as needed.
After I completed the PAL-1 experiment, I really like this classic computing platform. It can bring me 1970~80
It’s a super cool computing experience, and don’t worry about damaging the delicate and rare original KIM-1.
Hope you can also find the budding feeling of personal computers on PAL-1 & Happy Hacking with 6502!
Liu Ganning (刘甘宁)
