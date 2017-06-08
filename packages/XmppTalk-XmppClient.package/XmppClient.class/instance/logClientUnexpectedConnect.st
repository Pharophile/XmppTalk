logging
logClientUnexpectedConnect
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: XmppClientUnexpectedConnectEvent)
		emit