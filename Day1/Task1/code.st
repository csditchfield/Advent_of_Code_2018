input := FileStream open: 'input' mode: FileStream read.

x := 0.

[input atEnd] whileFalse: [
    (input peek = $+)
        ifTrue: [input next].
    y := input nextLine asNumber.
    (y)
        ifNotNil: [x := x + y].
].

x printNl