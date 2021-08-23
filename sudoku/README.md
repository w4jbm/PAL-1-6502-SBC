# Sudoku Solver for the 6502 PAL-1

This program will solve a Sudoku puzzle using a mostly recursive approach. There is something in the original code that causes things to misbehave when the first cell is both empty and not the first guess the system makes. (Given the number of time puzzles start with 1, it is probably just my bad luck to port this on a day when the puzzle solution started with a 4.)

Original code from Adrian Conlon [is here](https://github.com/MoleskiCoder/6502_sudoku). Don't blame him for my hack--I'm pretty sure there's a better way to handle the situation.

UPDATE: More bad luck with a puzzle. The next day's puzzle had the first 6 positions empty and neither the first through the fourth position was the number the algorithm would select first. I had to further update the code to make sure there are no zeros in the "successful" result. (There should never be.)

But the whole reason I was tinkering with it again was to find the easiest way to enter the contents of a new puzzle. If you are using the ROM with eWoz, it is actually very easy. Here is the result if you load and run the `sudoku.mos` file from the PAL-1 monitor:

![Default Puzzle](https://github.com/w4jbm/PAL-1-6502-SBC/raw/main/sudoku/Screenshot%20from%202021-05-30%2014-16-11.png)

The puzzle data is stored starting at $2003. You could use the PAL-1's monitor to load a puzzler here (left to right, top to bottom). But if you have eWoz in ROM, there is an easier way. Got to eWoz and type the following:

```
2000: 4C B8 24
: 0 0 0 0 0 0 9 1 4
: 0 0 0 0 5 8 0 0 0
: 0 7 0 9 0 0 0 0 5
: 6 0 0 1 0 0 0 0 0
: 9 3 0 0 0 0 0 5 8
: 0 0 0 0 0 2 0 0 7
: 1 0 0 0 0 7 0 9 0
: 0 0 0 5 1 0 0 0 0
: 5 8 6 0 0 0 0 0 0
2000R
```

Note: the first line could be shortened, but I'd rather type the entire jump command found at the start of the code.

Before you type the last command to run things, you should see something like this:

![Load a New Puzzle](https://github.com/w4jbm/PAL-1-6502-SBC/raw/main/sudoku/Screenshot%20from%202021-05-30%2014-36-46.png)

And when you enter run, it may take a little bit of time, but you should see the solution to your newly entered puzzle:

![New Puzzle Solution](https://github.com/w4jbm/PAL-1-6502-SBC/raw/main/sudoku/Screenshot%20from%202021-05-30%2014-37-41.png)

I may build a better entry front-end at some point, but for now this takes a minute or two to enter a puzzle and less time than it for your PAL-1 to crank out the solution.

Have fun!!!
