printing
printContentsOn: stream
	super printContentsOn: stream.
	stream space; << 'stanza sent'.
	stanzaInfo ifNotNil: [ stream space; print: stanzaInfo  ]