;
; lifted from the cpm users manual
; 
; cp a:x.y b:u.v
;
boot 	equ 	0000h 	;system reboot
bdos 	equ 	0005h 	;bdos entry point
fcbl 	equ 	005ch 	;first file name
sfcb 	equ 	fcbl 	;source fcb
fcb2 	equ 	006ch 	;second file name
dbuff 	equ 	0080h 	;default buffer
tpa 	equ 	0100h 	;beginning of tpa
;
printf 	equ 	9 	;print buffer func#
openf 	equ 	15 	;open file func#
closef 	equ 	16 	;close file func#
deletef equ 	19 	;delete file func#
readf 	equ 	20 	;sequential read
writef 	equ 	21 	;sequential write
makef 	equ 	22 	;make file func#
;
	org 	tpa 	;beginning of tpa
	lxi 	sp,stack ;local stack
;
; move second file name to dfcb
	mvi 	c,16 	;half an fcb
	lxi 	d,fcb2 	;source of move
	lxi 	h,dfcb 	;destination fcb
mfcb 	ldax 	d 	;source fcb
	inx 	d 	;ready next
	mov 	m,a 	;dest fcb
	inx 	h 	;ready next
	dcr 	c 	;count 16...0
	jnz 	mfcb 	;loop 16 times
;
; name has been removed, zero cr
	xra 	a 	;a = 00h
	sta 	dfcbcr 	;current rec = 0
;
; source and destination fcb's ready
;
	lxi 	d,sfcb 	;source file
	call 	open 	;error if 255
	lxi 	d,nofile ;ready message
	inr 	a 	;255 becomes 0
	cz 	finis 	;done if no file
;
; source file open, prep destination
	lxi 	d,dfcb 	;destination
	call 	delete 	;remove if present
;
	lxi 	d,dfcb 	;destination
	call 	make 	;create the file
	lxi 	d,nodir ;ready message
	inr 	a 	;255 becomes 0
	cz 	finis 	;done if no dir space
;
; source file open, dest file open
; copy until end of file on source
;
copy 	lxi 	d,sfcb 	;source
	call 	read 	;read next record
	ora 	a 	;end of file?
	jnz 	eofile 	;skip write if so
	lxi 	d,dfcb 	;destination
	call 	write 	;write record
	lxi 	d,space ;ready message
	ora 	a 	;00 if write ok
	cnz 	finis 	;end if so
	jmp 	copy 	;loop until eof
;
eofile 	equ	$	;end of file, close destination
	lxi 	d,dfcb 	;destination
	call 	close 	;255 if error
	lxi 	h,wrprot ;ready message
	inr 	a 	;255 becomes 00
	cz 	finis 	;shouldn't happen
;
; copy operation complete, end
	lxi 	d,normal ;ready message
;
finis ;write message given by de, reboot
	mvi 	c,printf
	call 	bdos 	;write message
	jmp 	boot 	;reboot system
;
; system interface subroutines
; (all return directly from bdos)
;
open 	mvi 	c,openf
	jmp 	bdos
;
close 	mvi 	c,closef
	jmp 	bdos
;
delete 	mvi 	c,deletef
	jmp 	bdos
;
read 	mvi 	c,readf
	jmp 	bdos
;
write 	mvi 	c,writef
	jmp 	bdos
;
make 	mvi 	c,makef
	jmp 	bdos
;
; console messages
nofile 	db 	'no source file$'
nodir 	db 	'no directory space$'
space 	db 	'out of dat space$'
wrprot 	db 	'write protected?$'
normal 	db 	'copy complete$'
;
; data areas
dfcb 	ds 	33 	;destination fcb
dfcbcr 	equ 	dfcb+32 ;current record
;
	ds 	32 	;16 level stack
stack	equ	$
	end

