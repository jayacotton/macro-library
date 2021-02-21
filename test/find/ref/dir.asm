;
; this  is the DIR command from CPM2.2 
; no you can't run this as a .COM file
;
direct:
	;directory search
	call 	fillfcb0 	;comfcb gets file name
	call 	setdisk 	;change disk drives if requested
	lxi 	h,comfcb+1
	mov 	a,m 		;may be empty request
	cpi 	' '
	jnz 	dir1 		;skip fill of ??? if not blank
				;set comfcb to all ??? for current disk
	mvi 	b,11 		;length of fill ????????.???
dir0: 	mvi 	m,'?'
	inx 	h
	dcr 	b
	jnz 	dir0
				;not a blank request, must be in comfcb
dir1:	mvi 	e,0
	push 	d 		;E counts directory entries
	call 	searchcom 	;first one has been found
	cz 	nofile 		;not found message
dir2:	jz 	endir
				;found, but may be system file
	lda 	dcnt 		;get the location of the element
	rrc
	rrc
	rrc
	ani 	110$0000b
	mov c,a
				;c contains base index into buff for dir entry
	mvi 	a,sysfile
	call 	addhcf 		;value to A
	ral
	jc 	dir6 		;skip if system file
				;c holds index into buffer
				;another fcb found, new line?
	pop 	d
	mov 	a,e
	inr 	e
	push 	d
				;e=0,1,2,3,...new line if mod 4 = 0
	ani 	11b
	push 	psw 		;and save the test
	jnz 	dirhdr0 	;header on current line
	call 	crlf
	push 	b
	call 	cselect
	pop 	b
				;current disk in A
	adi 	'A'
	call 	printbc
	mvi 	a,':'
	call 	printbc
	jmp 	dirhdr1 	;skip current line hdr
dirhdr0:call 	blank 		;after last one
	mvi 	a,':'
	call 	printbc
dirhdr1:call 	blank
				;compute position of name in buffer
	mvi 	b,1 		;start with first character of name
dir3:	mov 	a,b
	call 	addhcf 		;buff+a+c fetched
	ani 	7fh 		;mask flags
				;may delete trailing blanks
	cpi 	' '
	jnz 	dir4 		;check for blank type
	pop 	psw
	push 	psw 		;may be 3rd item
	cpi 	3
	jnz 	dirb 		;place blank at end if not
	mvi 	a,9
	call 	addhcf 		;first char of type
	ani 	7fh
	cpi 	' '
	jz 	dir5
				;not a blank in the file type field
dirb:	mvi 	a,' ' 		;restore trailing filename chr
dir4:
	call 	printbc 	;char printed
	inr 	b
	mov 	a,b
	cpi 	12
	jnc 	dir5
				;check for break between names
	cpi 	9
	jnz 	dir3 		;for another char
				;print a blank between names
	call 	blank
	jmp 	dir3
;
dir5:				;end of current entry
	pop 	psw 		;discard the directory counter (mod 4)
dir6:	call 	break$key 	;check for interrupt at keyboard
	jnz 	endir 		;abort directory search
	call 	searchn
	jmp 	dir2 		;for another entry
endir:				;end of directory scan
	pop 	d 		;discard directory counter
	jmp 	retcom

