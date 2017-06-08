logging
logClientConnectSecurely: securely
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: XmppClientConnectEvent)
		securely: securely;
		emit