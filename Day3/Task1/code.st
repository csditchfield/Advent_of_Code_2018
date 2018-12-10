input := FileStream open: 'input' mode: FileStream read.

cloth := Array new: 1000.

i := 1.

[i <= 1000] whileTrue: [
    cloth at: i put: (Array new: 1000 withAll: 0).
    i := i + 1
].

[input atEnd] whileFalse: [
    input next.
    (input peek) ifNotNil: [
        tokens := (input nextLine) tokenize: '(\s@\s)|(,)|(:\s)|(x)'.

   	i := (tokens at: 2) asNumber + 1.
    	[i <= ((tokens at: 2) asNumber  + (tokens at: 4) asNumber)] whileTrue: [
            j := (tokens at: 3) asNumber + 1.
	
            [j <= ((tokens at: 3) asNumber + (tokens at: 5) asNumber)] whileTrue: [
     	        (cloth at: i) at: j put: (((cloth at: i) at: j) + 1).
		
                j := j + 1
            ].

            i := i + 1
    	].
    ]
    ifNil: [input next]
].

overlap := 0.
i := 1.
[i <= 1000] whileTrue: [
    j := 1.

    [j <= 1000] whileTrue: [
        (((cloth at: i) at: j) > 1) ifTrue: [overlap := overlap + 1].
        j := j + 1
    ].

    i := i + 1
].

overlap displayNl.