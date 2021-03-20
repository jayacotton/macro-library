all:	fram.hex seltest.hex

fram.hex: fram.mac
	macro fram
	asm8080 fram.asm -l
	unix2dos fram.asm

seltest.hex: seltest.mac
	macro seltest
	asm8080 seltest.asm -l
	unix2dos seltest.asm

clean:
	rm seltest.hex seltest.asm seltest.list seltest.lst seltest.bin
	rm fram.hex fram.asm fram.list fram.lst fram.bin
