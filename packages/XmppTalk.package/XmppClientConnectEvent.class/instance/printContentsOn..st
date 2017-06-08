printing
printContentsOn: stream
	super printContentsOn: stream.
	stream space; << 'client connect'.
	securely ifTrue: [ stream space; << 'Secure' ]
	