input := FileStream open: 'input' mode: FileStream read.

doubles := 0.
triples := 0.

[input atEnd] whileFalse: [
    characters := Array new: 26 withAll: 0.
    [input peek asciiValue ~= 10] whileTrue: [
    	currChar := input next asciiValue - 96.
	characters at: currChar put: ((characters at: currChar) + 1).
    ].
    isDouble := false.
    isTriple := false.
    i := 1.
    [i <= 26] whileTrue: [
        (isDouble not & (characters at: i) = 2) ifTrue: [isDouble := true].
	(isTriple not & (characters at: i) = 3) ifTrue: [isTriple := true].
	i := i + 1
    ].
    isDouble ifTrue: [doubles := doubles + 1].
    isTriple ifTrue: [triples := triples + 1].
    input next.
].

doubles printNl.
triples printNl.
(doubles * triples) printNl