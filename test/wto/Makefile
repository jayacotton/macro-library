FILE = wto

$(FILE).hex: $(FILE).mac
	macro -i $(FILE) -L ../../ -a 8080
	asm8080 $(FILE).asm -l

clean:
	rm $(FILE).hex $(FILE).asm $(FILE).list $(FILE).lst $(FILE).bin
