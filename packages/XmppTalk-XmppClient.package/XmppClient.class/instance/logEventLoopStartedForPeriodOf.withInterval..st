logging
logEventLoopStartedForPeriodOf: period withInterval: interval
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: XmppEventLoopStarted)
		period: period;
		interval: interval;
		emit