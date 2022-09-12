#!/bin/bash
# mv led123.a65 led123.tmp
# prettyasm -losk led123.tmp led123.a65
64tass --intel-hex led123.a65 --tab-size=1 -o led123.hex -m --verbose-list -L led123.lst
srec_cat led123.hex -intel -o led123.mos -MOS_Technologies
unix2dos led123.mos
cp led123.mos ~

64tass --intel-hex keyp2led.a65 --tab-size=1 -o keyp2led.hex -m --verbose-list -L keyp2led.lst
srec_cat keyp2led.hex -intel -o keyp2led.mos -MOS_Technologies
unix2dos keyp2led.mos
cp keyp2led.mos ~

