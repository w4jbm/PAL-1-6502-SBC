# Sudoku for the PAL-1

This program will solve a Sudoku puzzle using a mostly recursive approach. There is something in the original code that causes things to misbehave when the first cell is both empty and not the first guess the system makes. (Given the number of time puzzles start with 1, it is probably just my bad luck to port this on a day when the puzzle solution started with a 4.)

Original code from Adrian Conlon [is here](https://github.com/MoleskiCoder/6502_sudoku). Don't blame him for my hack--I'm pretty sure there's a better way to handle the situation.

