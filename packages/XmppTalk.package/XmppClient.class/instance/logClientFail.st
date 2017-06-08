logging
logClientFail
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: XmppClientFailEvent)
		emit