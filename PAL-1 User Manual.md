> The manual for the PAL-1 is available for download, but is in Chinese. This is my attempt to capture the translation of that material as I go through it. Blockquotes such as this are used for notes related to the translation or content.

# PAL-1 Eight-Bit Computer User Manual

Technology Small Production\
Aibis | Bantian, Shenzhen

***

V1.0
The information in this manual has been reviewed and is believed to be completely reliable. However, we are not responsible for any inaccuracy. This material is for reference only and subject to change without notice.

Technology Small Production\
November 2020

Technical Support: liugn@outlook.com

> Obviously the translation is also not responsible for inaccuracies and meant for reference only.

***

## Table of Contents

To be completed...

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


KIM-1
KIM-1 was established by MOS Technology in 1976
The MOS 6502 microprocessor-based small
Type single board computer, which is considered the earliest
One of the single board computers, made in the 1970s
A great success.
The designer of KIM-1 is Chuck Peddle, who also
Is the director of the 650x team of MOS, MOS
The 650x team has played a very important role in the personal computer revolution.
Helpful promotion. KIM's name comes from
Keyboard Input Monitor abbreviation of three words
Write, this name intuitively explains this calculation
The basic form of the machine: input the program through the keyboard and
And there is a monitoring program to monitor the KIM-1 system
Basic management.


In addition to the 6502 CPU, KIM-1 consists of two 6530
The chip provides 2K bytes ROM (Monitor
Program, 1K bytes per chip), 128 bytes
RAM (64 bytes per chip), four 8-bits
Bidirectional IO ports (two per chip) and two
Figure 1 KIM-1
Programmable clock/timer (one per chip
). The RAM of KIM-1 is usually called 1K byte capacity, but to be precise, the RAM space it can provide is
1152 bytes (8 1K bits RAM + 128 bytes RAM in two 6530); KIM-1 onboard 23 keys 16
The hexadecimal keyboard is used for program and instruction input, and the 6 seven-segment LED displays can completely display the address information of the 6502CPU.
Information and data information; at the same time, KIM-1 also provides the connection capability of the TTY terminal, and can be stored through the tape drive.
Store and read the program.
KIM-1 is the first computer to use 6502 CPU, it attracts a large number of computer enthusiasts, magazines and software
Companies; followed by various 6502 CPU-based computers, such as Commodore's acquisition of MOS
The KIM-1 successor products PET, Acorn BBC Micro and APPLE I developed, which were developed together with Z80 and 8080
Initiated the era of personal computers.




PAL-1
PAL-1 is also a single board computer, most of its structure uses the design of KIM-1, especially the original search engine.
The address mode is completely reserved to achieve maximum compatibility with KIM-1 programs; PAL-1 has 2K bytes of ROM onboard,
5K bytes of RAM, a 6532 RIOT chip provides two 8-bit bidirectional I/Os, these I/Os are mainly used to support
23-key keyboard input, 6 seven-segment LED displays. In addition, PAL-1 also provides RS232 serial port connection terminal
And 40-pin expansion port to support function upgrade.
The assembled PAL-1 and main parts are described in the following figure.



Assembly
If you are buying a finished product, you can skip this chapter.
Before assembling, please check whether the received kit is complete according to the component list on the next page.
The "component number" column in the list corresponds to the device number printed on the motherboard. When installing, place the components in the "component" column
Device, "Quantity" column indicates the total number of components of the model.
For example:
The meaning of the first row in the table-there are 14 0.1uF capacitors in the kit, they need to be installed on the motherboard
C1, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18 mounting holes.
How to identify the component model
If you are not familiar with the components used in PAL-1, please read this section carefully!
Resistance: The resistance value has been indicated on the braid, if it is confused after cutting it out, please use a multimeter to measure
Capacitance: 0.1uF marked 104, ceramic capacitor, does not distinguish between positive and negative
0.22uF marked 224, ceramic capacitor, does not distinguish between positive and negative
100uF marked 100uF, electrolytic capacitor, need to distinguish between positive and negative, long pin positive, PCB hollow positive
10uF indicates 10uF, electrolytic capacitor, need to distinguish between positive and negative, long pin positive, PCB hollow positive
Diode: 1N4001 plastic package, need to distinguish between positive and negative, white wire end corresponds to PCB white wire
1N4148 glass package, need to distinguish between positive and negative, the black wire end corresponds to the PCB white wire


Power LED: Red 3mm LED, need to distinguish the positive and negative poles, the long legs are positive, and the PCB hole is positive
Seven-segment display: the decimal point is placed in the same direction as the PCB printing direction
Transistor: 2N4403 marked 2N4403, the straight edge is placed according to the PCB printing direction
2N4401 marked 2N4401, the straight edge is placed according to the PCB printing direction
Exclusion: Black long strip, labeled A472J, the outermost leg of the white dot corresponds to the PCB square foot
Toggle switch: insert carefully, do not distinguish the direction
Integrated circuit: pay attention to distinguish the number one pin, the semicircle marking corresponds to the semicircle marking printed on the PCB. 12 ICs included in the kit
Socket, if you use IC socket, please pay attention to the same label. Please pay attention to whether all pins are
Is the vertical and pin spacing appropriate? If the chip pin is far away, you need to press the pin on a flat surface before installation
On the side, make the spacing suitable for PCB holes or IC socket pins before inserting into the mounting position.
EPROM: EPROM is a ceramic package with a sticker on it, please do not remove the sticker
Crystal oscillator: pay attention to the right-angle position (one right angle, three rounded corners), and install it according to the PCB printed diagram at right angles
L7805: The lettering side is facing up, the screw holes are aligned and installed





Part number
element
Quantity
> C1, C7-C18 0.1uF capacitor 14
> C2, C3, C6 0.22uF Capacitor 3
C4 100uF capacitor 1
C5 10uF capacitor 1
D1 1N4001 Diode 1
D2 1N4148 Diode 1
D3 red LED 1
J1 DC power socket 1
J2 40-pin pin 1
J3 RS232 male connector 1
JP1 2 foot jumper 1
JP2 2 foot jumper 1
> LED1-LED6 seven segment display 6
> Q1-Q7 2N4403 PNP transistor 7
> Q8, Q9 2N4401 NPN transistor 2
> R1-R5, R39, R41 3K3 resistor 7
> R6, R7, R9-R11, R14, R16, R18, R20, R22, R24, R32-R34, R37, R42 1K resistor 16
> R8, R12 47K resistor 2
> R25-R31 100R resistor 7
> R13, R15, R17, R19, R21, R23, R35, R36, R38, R40, R43 220R resistor 11
RN1 4.7K exclusion 1
SW1 toggle switch 1

SW2-SW24 Tact switch 23
U2 74LS38 1
U3 6502 CPU 1
U4 NE556 1
> U1, U5 74LS145 2
> U6, U11 74LS00 2
U7 6532 RIOT 1
U8 74LS138 1
U9 6264 SRAM 1
U10 2764 EPROM 1
U12 L7805 linear regulator 1
U13 74LS06N 1
X1 1MHz crystal oscillator 1
Motherboard PAL-1 PCB 1
IC_Socket_40 IC socket 40P 2
IC_Socket_28 IC socket 28P 2
IC_Socket_16 IC socket 16P 3
IC_Socket_14 IC socket 14P 5
The kit does not include a power supply; the recommended power supply standard: DC, output power 7.5V/1A, interface 5.5*2.5/2.1mm, internal positive and external negative.




Assembly tools
•
•
•
•
•
Electric soldering iron/solder station
Solder wire
Flat nose pliers
multimeter
Magnifying glass (optional)
For the installation process, please refer to the video "Assemble PAL-1". It is recommended to use an exhaust fan with a sponge filter to absorb welding fumes;
Please note that there are no short-circuited solder joints during the installation process. You can use the on-off file of the multimeter to confirm.
more convenient. After the components are placed, the pins at both ends can be slightly bent, so that they are not easy to shift during welding.
After completing the assembly, you can connect the power supply to start your PAL-1 computer.
