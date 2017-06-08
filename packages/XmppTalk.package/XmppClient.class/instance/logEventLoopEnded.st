logging
logEventLoopEnded
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: XmppEventLoopEnded)
		emit