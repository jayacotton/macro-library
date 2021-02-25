The find program will be very usfull on systems with lots of drives and code.
It will search all the drives on your machine, and look for extension match.

You can say:  find . cob  to find all the cobal programs on your machine on all drives.
You can say:  find d cob  to find all cobal programs on your d: drive.  (or use dir).

find will be most useful for large systems.


There are bugs, please report via issues

To build this program you need:  MACRO and ASM8080.  These are also on my repo.

make clean; make  will build a file called find.hex  you then down load that to your
CP/M machine, and say load find on you CP/M machine.  From there you are up a running.

Added for your codeing fun.  

I added unix2dos to the Makefile, to convert the find.asm file to dos format.
This makes the file compatible with CP/M assembers.  At this point you can
copy the find.asm file into your CP/M machine and run the assembler localy.
I used rmac find and link find to build the program.  

BTW: This test case uncovered a few coding bugs that my assembler just
ignores.  (Now fixed in the source).

This building case opens a number of possibilities for furture code
generation.  Such as, write some code on unix/cygwin and some on CP/M 
the build all the code on CP/M and link it up there.

```
C>find . for
E:FA16A   FOR
I:RATFOR  FOR
I:URATFOR FOR
J:RATFOR  FOR
J:URATFOR FOR

ZSDOS error on K: No Drive
Call: 14
```
