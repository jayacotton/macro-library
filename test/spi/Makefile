all:	fram.hex seltest.hex

fram.hex: fram.mac
	macro -i fram -L ../../ -a 8080
	asm8080 fram.asm -l
	unix2dos fram.asm

seltest.hex: seltest.mac
	macro -i seltest -L ../../ -a 8080
	asm8080 seltest.asm -l
	unix2dos seltest.asm

clean:
	rm seltest.hex seltest.asm seltest.list seltest.lst seltest.bin
	rm fram.hex fram.asm fram.list fram.lst fram.bin
