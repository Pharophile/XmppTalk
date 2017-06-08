logging
logClientRawConnect
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: XmppClientRawConnectEvent)
		emit