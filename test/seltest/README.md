This tests the seldskf call.

The seldskf call is a bit hairy to use.  Mainly the issue is that it depends on the start address of
BIOS and (potentialy) the version of CP/M.

This is known to work with CP/M 2.2 and ZSDOS 1.1.  It has not been tested yet with CP/M 3

The other issue is the address of BIOS is dependant on your system layout.  It can be anyware in
high memory, but the exact location is hard to pin down.  

For now, edit the BIOS address befor building and running.

Here is a sample output from the code.

ZSDOS v1.1, 54.0K TPA

```
B>c:
C>seltest
1110110011100100
1110110011110100
1110110100000100
1110110100010100
1110110100100100
1110110100110100
1110110101000100
1110110101010100
1110110101100100
1110110101110100
0
0
0
0
0
0
```
