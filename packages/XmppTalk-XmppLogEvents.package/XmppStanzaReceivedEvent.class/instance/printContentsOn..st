printing
printContentsOn: stream
	super printContentsOn: stream.
	stream space; << 'stanza received'.
	stanzaInfo ifNotNil: [ stream space; print: stanzaInfo  ]