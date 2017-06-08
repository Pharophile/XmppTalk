logging
logEventLoopStarted
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: XmppEventLoopStarted)
		emit