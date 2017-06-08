logging
logClientDisconnect
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: XmppClientDisconnectEvent)
		emit