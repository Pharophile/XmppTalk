accessing
printContentsOn: stream
	super printContentsOn: stream.
	stream space; << 'callback invoked'.
	callbackId ifNotNil: [ stream space; << callbackId ]