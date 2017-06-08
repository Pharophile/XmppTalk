logging
logClientConnect
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: XmppClientConnectEvent)
		emit