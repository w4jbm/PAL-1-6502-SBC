# Starship Animated Demo

This is an animated demo of the RIOT. There is nothing elegant and the use of macros and editor tricks let me build it quickly, but also means it is bloated in size.

![Starship](https://github.com/w4jbm/PAL-1-6502-SBC/blob/c6b2a46ae5c8f7781241336079eb7481e3b82148/starship/starship.jpg)

There are two important things this shows from my perspective. All REAL hobbyist computers need to be able to show the image of a starship, preferably in a way that is automated. Also, everything ties back to my first computer, an Ohio Scientific C1P, in some way. In this case, the 8x8 character graphics on the C1P were used as the source for the starship bitmap.

You can also look at it run on [YouTube](https://www.youtube.com/watch?v=UThleUTNTBM).

A couple of tweaks and hacks if you are interested. To get the picture, I just drew a single frame and then put the program in a loop. This gives you what you see in the picture above. To do this, change memory locations starting at `$2136` to `$4C $36 $21`. Also, if you want to tweak the speed you can tweak the value of `$10` at `$323E`. Higher values will make things slower; lower values will speed things up. To get rid of the delay all together you can just do an immediate return out of the route by modifying `$323D` to `$60`.

I have recently started using the JUST utility and it is easier to do the things I want instead of using MAKE. (The steps to build this are in the source as well as pretty evident from the justfile.)
