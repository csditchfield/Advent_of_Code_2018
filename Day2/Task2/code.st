DEBUG := false.


input := FileStream open: 'input' mode: FileStream read.
oneDifference := false.
firstWordPos := 0.
secondWord := 0.

[input atEnd | oneDifference] whileFalse: [
    firstWordPos := input position.

    test := String new: 26.

    characters := Array new: 26.
    i := 1.
    [input peek asciiValue ~= 10] whileTrue: [
    	currChar := input next.
	test at: i put: currChar.
	characters at: i put: currChar asciiValue - 96.
	i := i + 1
    ].
    input next.
    oldPosition := input position.

    DEBUG ifTrue: [test displayNl].

    [input atEnd | oneDifference] whileFalse: [
        baseWord := characters deepCopy.

	(input peek)
	    ifNotNil: [
	        i := 1.
		secondWord := input position.
		test := String new: 26.
	        [input peek asciiValue ~= 10] whileTrue: [
		    currChar := input next.
		    test at: i put: currChar.
		    baseWord at: i put: ((baseWord at: i) - ((currChar asciiValue) - 96)).
		    i := i + 1
		].
		input next.

		DEBUG
		    ifTrue: [
		        test displayNl.
			baseWord displayNl.
		    ].

		i := 1.
		oneDifference := false.
		twoDifferences := false.
		[i <= 26] whileTrue: [
		    ((baseWord at: i) = 0)
		        ifFalse: [
			    (oneDifference & (twoDifferences not))
			        ifTrue: [
				    twoDifferences := true.
				    oneDifference := false.
				].
			    (oneDifference not & twoDifferences not)
			        ifTrue: [
				    oneDifference := true
				].
			].
		    i := i + 1
		].
	    ]
	    ifNil: [
	        input next.
	    ].
    ].

    DEBUG ifTrue: ['' displayNl].

   input position: oldPosition
].

(oneDifference)
    ifTrue: [
    	sameLetters := Array new: 26.

	i := 1.
    	input position: firstWordPos.
        [input peek asciiValue ~= 10] whileTrue: [
	    currChar := input next.
	    currChar display.

	    ((baseWord at: i) = 0)
	        ifTrue: [
		    sameLetters at: i put: currChar.
		].
	    i := i + 1
        ].

	'' displayNl.

	input position: secondWord.
        [input peek asciiValue ~= 10] whileTrue: [
	    input next display.
        ].

	'' displayNl.

	i := 1.
	[i <= sameLetters size] whileTrue: [
	    (sameLetters at: i) ifNotNil: [(sameLetters at: i) display].
	    i := i + 1.
	].
	'' displayNl.
    ]
    ifFalse: [
        'Not found!' displayNl
    ]