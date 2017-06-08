accessing
printContentsOn: stream
	super printContentsOn: stream.
	stream space; << 'Event Loop Started'.
	interval ifNotNil: [ stream space; << 'Period'; space; << period asString ].
	interval ifNotNil: [ stream space; << 'Interval'; space; << interval asString ]