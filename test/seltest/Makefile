FILE = seltest

$(FILE).hex: $(FILE).mac
	macro -i $(FILE) -L ../../ -a 8080
	asm8080 $(FILE).asm -l
	unix2dos $(FILE).asm

clean:
	rm $(FILE).hex $(FILE).asm $(FILE).list $(FILE).lst $(FILE).bin
