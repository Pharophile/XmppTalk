private logging
stringFromStanza: aStanza

	| buf buflen error actualText actualTextLength  |
	
	buf := ExternalAddress newPointer.
	buflen := ByteArray new: (FFIExternalType sizeOf: #size_t).

	error := lib xmppStanza: aStanza toText: buf outputSize: buflen.
	
	error = 0 
		ifTrue: [ 
			actualText := (ExternalData fromHandle: buf type: ExternalType string) fromCString.
			actualTextLength := buflen unsignedLongAt: 1.
	
			"^'stanza: {1} of length: {2}' format: {actualText. actualTextLength asString}."
			^actualText 
		]	
		ifFalse: [ ^'error converting stanza to text' ].
	
	
	