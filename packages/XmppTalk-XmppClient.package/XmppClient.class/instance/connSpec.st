accessing
connSpec
	connSpec ifNil: [ Error signal: 'ConnSpec not set' ].
	^connSpec 