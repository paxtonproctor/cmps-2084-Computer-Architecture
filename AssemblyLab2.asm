;Paxton Proctor
			.model	small
			.stack	100h
			.data
	winA	db		"Expected winner will be A.$"
	winB	db		"Expected winner will be B.$"
			.code
	main:	mov		ax.@data
			mov		ds,ax
			
			mov		dl,0
			mov		cl,0
	lup:	cmp		cl,9
			je		finish
			
			mov		ah,1
			int		21h
			sub		al,30h
			
			add		dl,al
			add		cl,1
			jmp		lup
	finish: cmp		dl,5
			jge		canB
			
	canA:	mov		ah,9
			lea		dx,winA
			int		21h
			jmp		done
			
	canB:	mov		ah,4ch
			lea		dx,winB
			int		21h
			
	done:	mov		ah,4ch
			int		21h
			end		main