FILE = rm

$(FILE).hex: $(FILE).mac
	macro $(FILE)
	asm8080 $(FILE).asm -l

clean:
	rm $(FILE).hex $(FILE).asm $(FILE).list $(FILE).lst $(FILE).bin
