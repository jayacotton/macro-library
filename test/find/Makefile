FILE = find

$(FILE).hex: $(FILE).mac
	macro -i $(FILE) -o $(FILE) -l $(FILE) -a 8080 -L ../../
	asm8080 $(FILE).asm -l
	unix2dos $(FILE).asm

clean:
	rm $(FILE).hex $(FILE).asm $(FILE).list $(FILE).lst $(FILE).bin
