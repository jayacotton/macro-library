The find program will be very usfull on systems with lots of drives and code.
It will search all the drives on your machine, and look for extension match.

You can say:  find . cob  to find all the cobal programs on your machine on all drives.
You can say:  find d cob  to find all cobal programs on your d: drive.  (or use dir).

find will be most useful for large systems.


There are bugs, please report via issues

To build this program you need:  MACRO and ASM8080.  These are also on my repo.

make clean; make  will build a file called find.hex  you then down load that to your
CP/M machine, and say load find on you CP/M machine.  From there you are up a running.

C>find . for
E:FA16A   FOR
I:RATFOR  FOR
I:URATFOR FOR
J:RATFOR  FOR
J:URATFOR FOR

ZSDOS error on K: No Drive
Call: 14
