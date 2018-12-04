input := FileStream open: 'input' mode: FileStream read.

x := 0.
freqs := Set new.
freqs add: 0.
firstPrint := true.

(input peek = $+)
        ifTrue: [input next].
y := input nextLine asNumber.
(y) 
    ifNotNil: [
        x := x + y.
	currFreq := Set new.
	currFreq add: x
    ].

[currFreq <= freqs] whileFalse: [
    freqs add: x.

    y := nil.
    [y = nil] whileTrue: [
        (input atEnd)
	    ifTrue: [input := FileStream open: 'input' mode: FileStream read].
        (input peek = $+)
            ifTrue: [input next].
        y := input nextLine asNumber.
        (y) 
            ifNotNil: [
	        x := x + y.
	        currFreq := Set new.
	        currFreq add: x
            ].
    ].
].

x printNl
