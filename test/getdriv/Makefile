FILE = getdriv

$(FILE).hex: $(FILE).mac
	macro $(FILE)
	asm8080 $(FILE).asm -l
	unix2dos $(FILE).asm

clean:
	rm $(FILE).hex $(FILE).asm $(FILE).list $(FILE).lst $(FILE).bin
